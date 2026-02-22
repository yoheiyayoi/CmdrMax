--: Services
local Rep = game:GetService("ReplicatedStorage")

--: Modules
local Cmdr = require(script.Cmdr)
local t = require(script.DevPackages.t)
local args = require(script.args)

--: Local
local method = {
	args = args
}

local CachedRemote = Cmdr.RemoteEvent or nil

--: Types
export type HookState = "BeforeRun" | "AfterRun"
export type ArgumentDefinition = args.ArgumentDefinition
export type CommandData = {
	Name: string?;
	Aliases: { string }?;
	Description: string?;
	Group: string?;
	Permissions: { string }?;
	Args: { ArgumentDefinition };
	AutoExec: boolean?;
	Run: (context: any, ...any) -> ();
	ClientRun: ((context: any, ...any) -> ())?;
}

type CmdrMaxEvent = "Init" | "_RegisterCommand"

--: Functions

--// Utils
local function SendEvent(event: CmdrMaxEvent, ...)
	if not CachedRemote then
		repeat
			task.wait()
		until Cmdr.RemoteEvent

		CachedRemote = Cmdr.RemoteEvent
	end

	CachedRemote:FireAllClients(event, ...)
end

--// Commands
function method.RegisterDefaultCommands(filter: { string } | (command: any) -> boolean)
	Cmdr.Registry:RegisterDefaultCommands(filter)
end

function method.AddCommand(name: string, data: CommandData)
	assert(t.string(name))
	assert(t.table(data))

	local Commands = Cmdr.Registry.Commands
	assert(not Commands[name], `[CmdrMax] - Command "{name}" already exist!`)
	--
	if not data.Name then
		data.Name = name
	end

	Cmdr.Registry:RegisterCommandObject(data)
	Commands[name] = data

	local clientData = Cmdr.Util.DeepCopy(data) :: CommandData
	clientData.Run = nil -- remove server run function for client
	SendEvent("_RegisterCommand", clientData)
end

--// Roles
function method.SetRolePermissions(role: string, permissions: { string })
	assert(t.string(role))
	assert(t.table(permissions))

	local Roles = Cmdr.Registry.Roles
	assert(not Roles[role], `[CmdrMax] - Role "{role}" already exist!`)

	Roles[role] = Cmdr.Util.MakeDictionary(permissions)
end

function method.GiveRole(player: Player, role: string)
	assert(t.string(role))

	local Roles = Cmdr.Registry.Roles
	assert(Roles[role], `[CmdrMax] - Role "{role}" does not exist!`)
	
	player:SetAttribute(Cmdr.ROLE_ATTRIBUTE, role)
end

return method
