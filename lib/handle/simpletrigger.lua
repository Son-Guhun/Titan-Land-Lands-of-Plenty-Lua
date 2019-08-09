simpletrigger = {}


SimpleTrigger = {}
SimpleTrigger.__index = SimpleTrigger
simpletrigger.metatable = SimpleTrigger

local onCondition =  Condition(function()
    local trig = allTriggers[GetHandleId(GetTriggeringTrigger())]
    trig.callback(trig)
    return false
end)

local allTriggers = {}

function simpletrigger.create(callback)
    local trig = CreateTrigger()
    local wrapper = setmetatable({}, SimpleTrigger)

    wrapper.handle = trig
    allTriggers[GetHandleId(trig)] = wrapper

    TriggerAddCondition(trig, onCondition)
    return wrapper
end

function SimpleTrigger:destroy()
    local trig = self.handle
    DestroyTrigger(self.handle)
    allTriggers[GetHandleId(trig)] = nil
end

function SimpleTrigger:registerChatEvent(whichPlayer, chatMsgToDetect, boolExactMatch)
    TriggerRegisterPlayerChatEvent(self.handle, whichPlayer, chatMsgToDetect, boolExactMatch)
end

function SimpleTrigger:registerSyncEvent(whichPlayer, prefix, fromServer)
    BlzTriggerRegisterPlayerSyncEvent(self.handle, whichPlayer, prefix, fromServer)
end
