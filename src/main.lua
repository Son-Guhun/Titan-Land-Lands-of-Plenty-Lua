require("unit")
local Player = require("player")
require('UserDefinedRects.rectGenerator')







local function a()
    local trig = CreateTrigger()
    TriggerRegisterPlayerChatEvent(trig, Player:fromId(0).handle, "-rect", true)
    TriggerAddAction(trig, function()
        print(1)
        local u = unit.create(Player:fromId(0), FourCC('udr0'), 0., 0., 270.)
        print(2, u)

    end)
end

ceres.addHook("main::after",  a)