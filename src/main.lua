require('stdlib')
require('UserDefinedRects.rectGenerator')
require('Commands.command')

decobuilders = require('LoP.decobuilders')

local decoTentsInitFunc = require('Init.decotents')

require('Commands.Player.decos')
require('Commands.Player.deleteme')

require('multipatrol')




local function a()
end

ceres.addHook("main::after",  a)

commands.registerCommand('-tents', 0, decoTentsInitFunc)
commands.registerCommand('-rect', commands.ACCESS_USER, function()
    local u = unit.create(player.fromId(0), 'udr0', 0., 0., 270.)
end)
commands.registerCommand('-test', 0, function(trigPlayer)
    for u,_ in pairs(unit.enumSelected(trigPlayer)) do
        u:createPatrolPath(u:getX(), u:getY(), 0., 0.)
    end
end)