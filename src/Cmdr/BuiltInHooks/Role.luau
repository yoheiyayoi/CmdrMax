return function (registry)
	registry:RegisterHook("BeforeRun", function(context)
		local player: Player = context.Executor
		local role = player:GetAttribute(registry.ROLE_ATTRIBUTE) or "Default"

        if not context.Permissions or #context.Permissions == 0 then
            return
        end

        -- the owner (creator) always has permission to run commands
        if context.Group == "DefaultAdmin" and context.Executor.UserId == game.CreatorId then
            return
        end

        local Roles = registry:GetRoles()
		local rolePermissions = Roles[role]

        if not rolePermissions then
            return "You don't have permission to run this command"
        end
        
        for _, perm in next, context.Permissions do
            if rolePermissions[perm] then
                return
            end
        end

        return "You don't have permission to run this command"
	end)
end
