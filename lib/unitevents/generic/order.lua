require('unitevents.generic._table')
require('handle')

local onOrderFuncs = {}
local onPointOrderFuncs = {}
local onTargetOrderFuncs = {}

local function onOrder()
    local orderId = GetIssuedOrderId()
    local trigU = unit.wrap(GetTriggerUnit())

    for _,func in ipairs(onOrderFuncs) do
        local r,e = pcall(func, orderId, trigU)
        if not r then print(e) end
    end
    return false
end

local function onPointOrder()
    local orderId = GetIssuedOrderId()
    local trigU = unit.wrap(GetTriggerUnit())
    local x = GetOrderPointX()
    local y = GetOrderPointY()

    for _,func in ipairs(onPointOrderFuncs) do
        local r,e = pcall(func, orderId, trigU, x, y)
        if not r then print(e) end
    end
    return false
end

local function onTargetOrder()
    local orderId = GetIssuedOrderId()
    local trigU = unit.wrap(GetTriggerUnit())
    local target = unit.wrap(GetOrderTargetUnit())  -- GetOrderTarget

    for _,func in ipairs(onTargetOrderFuncs) do
        local r,e = pcall(func, orderId, trigU, target)
        if not r then print(e) end
    end
    return false
end

ceres.addHook('main::after', function()
    local orderTrig = CreateTrigger()
    local pointOrderTrig = CreateTrigger()
    local targetOrderTrig = CreateTrigger()

    for i=0,bj_MAX_PLAYER_SLOTS do
        local player = Player(i)

        TriggerRegisterPlayerUnitEvent(orderTrig, player, EVENT_PLAYER_UNIT_ISSUED_ORDER, nil)
        TriggerRegisterPlayerUnitEvent(pointOrderTrig, player, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER, nil)
        TriggerRegisterPlayerUnitEvent(targetOrderTrig, player, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER, nil)
    end

    TriggerAddCondition(orderTrig, Condition(onOrder))
    TriggerAddCondition(pointOrderTrig, Condition(onPointOrder))
    TriggerAddCondition(targetOrderTrig, Condition(onTargetOrder))
end)

function unitevents.generic.onOrder(callback)
    table.insert(onOrderFuncs, callback)
end

function unitevents.generic.onPointOrder(callback)
    table.insert(onPointOrderFuncs, callback)
end

function unitevents.generic.onTargetOrder(callback)
    table.insert(onOrderFuncs, callback)
end
