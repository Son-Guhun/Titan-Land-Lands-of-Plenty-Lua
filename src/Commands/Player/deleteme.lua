require('stdlib')
require('Commands.command')

local palace
ceres.addHook('main::after', function() palace = rect.wrap(gg_rct_Titan_Palace) end)

commands.registerCommand('-deleteme', commands.ACCESS_USER, function(trigPlayer, command, args)
    for u,_ in pairs(unit.enumOfPlayer(trigPlayer)) do
        if not palace:containsObject(u) then
            u:remove()
        end
    end
end)