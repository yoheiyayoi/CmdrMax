local RunService = game:GetService("RunService")
local Util = require(script.Shared:WaitForChild("Util"))

if RunService:IsServer() == false then
	error("Cmdr server module is somehow running on a client!")
end

local Cmdr do
	Cmdr = setmetatable({
		ReplicatedRoot = nil;
		RemoteFunction = nil;
		RemoteEvent = nil;
		Util = Util;
		DefaultCommandsFolder = script.BuiltInCommands;

		-- CmdrMax data
		VERSION = "1.0.0-beta";
		ROLE_ATTRIBUTE = "CmdrMaxRole";
	}, {
		__index = function (self, k)
			local r = self.Registry[k]
			if r and type(r) == "function" then
				return function (_, ...)
					return r(self.Registry, ...)
				end
			end
		end
	})

	Cmdr.Registry = require(script.Shared.Registry)(Cmdr)
	Cmdr.Dispatcher = require(script.Shared.Dispatcher)(Cmdr)

	require(script.Initialize)(Cmdr)
end

-- Handle command invocations from the clients.
Cmdr.RemoteFunction.OnServerInvoke = function (player, text, options)
	if text == "Init" then
		local commandsList = {}
		for name, cmdData in next, Cmdr.Registry.Commands do
			local clientData = Cmdr.Util.DeepCopy(cmdData)
			clientData.Run = nil -- remove server run function for client
			commandsList[name] = clientData
		end

		return {
			Commands = commandsList
		}
	end
	
	if #text > 100_000 then
		return "Input too long"
	end
	
	return Cmdr.Dispatcher:EvaluateAndRun(text, player, options)
end

return Cmdr :: {
	ReplicatedRoot: Folder;
	RemoteFunction: RemoteFunction;
	RemoteEvent: RemoteEvent;
	Util: typeof(Util);
	DefaultCommandsFolder: Folder;
	VERSION: string;
	ROLE_ATTRIBUTE: string;

	Registry: typeof(Cmdr.Registry);
	Dispatcher: typeof(Cmdr.Dispatcher);
}
