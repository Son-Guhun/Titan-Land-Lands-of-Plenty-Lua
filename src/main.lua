require('stdlib')
require('UserDefinedRects.rectGenerator')
require('Commands.command')

decobuilders = require('LoP.decobuilders')

local decoTentsInitFunc = require('Init.decotents')

require('Commands.Player.decos')
require('Commands.Player.deleteme')





local function a()
    local trig = CreateTrigger()
    TriggerRegisterPlayerChatEvent(trig, player.fromId(0).handle, "-rect", true)
    TriggerAddAction(trig, function()
        local u = unit.create(player.fromId(0), 'udr0', 0., 0., 270.)
    end)

    trig = CreateTrigger()
    TriggerRegisterPlayerChatEvent(trig, player.fromId(0).handle, "-names", true)
    TriggerAddAction(trig, function()
        print("Ha!")
        local units = unit.enumSelected(player.fromId(0))
        for u,_ in pairs(units) do
            print(GetUnitName(u.handle))
        end
    end)
end

ceres.addHook("main::after",  a)

commands.registerCommand('-tents', 0, decoTentsInitFunc)