return function (registry)
	registry:RegisterHook("BeforeRun", function(context)
		local player: Player = context.Executor
		local role = player:GetAttribute(registry.ROLE_ATTRIBUTE) or "Default"

        if not context.Permissions or #context.Permissions == 0 then
            return
        end

        if context.Group == "DefaultAdmin" and context.Executor.UserId == game.CreatorId then
            return
        end

		local rolePermissions = registry.Roles[role]

        for _, perm in next, context.Permissions do
            if rolePermissions[perm] then
                return
            end
        end

        return "You don't have permission to run this command"
	end)
end
