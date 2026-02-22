local Players = game:GetService("Players")

return {
	Name = "clear",
	Aliases = {},
	Description = "Clear all lines above the entry line of the Cmdr window.",
	Group = "DefaultUtil",
	Args = {},

	ClientRun = function()
		local player = Players.LocalPlayer
		local gui = player:WaitForChild("PlayerGui"):WaitForChild("Cmdr")
		local frame = gui:WaitForChild("Frame"):WaitForChild("Frame")

		if gui and frame then
			for _, child in next, frame:QueryDescendants("TextBox#Line") do
				child:Destroy()
			end
		end
		
		return ""
	end,
}
