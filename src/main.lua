require('stdlib')
require('UserDefinedRects.rectGenerator')







local function a()
    local trig = CreateTrigger()
    TriggerRegisterPlayerChatEvent(trig, player.fromId(0).handle, "-rect", true)
    TriggerAddAction(trig, function()
        local u = unit.create(player.fromId(0), FourCC('udr0'), 0., 0., 270.)
    end)
end

ceres.addHook("main::after",  a)