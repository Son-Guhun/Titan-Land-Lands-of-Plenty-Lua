require('unitevents.generic._table')
require('stdlib.worldbounds')

local onEnterMapFuncs = {}

local function OnEnterMap()
    local enteringUnit = unit.wrap(GetFilterUnit())
    for _,func in ipairs(onEnterMapFuncs) do
        local r,e = pcall(func, enteringUnit)
        if not r then print(e) end
    end
    return false
end

function unitevents.generic:onEnterMap(callback)
    table.insert(onEnterMapFuncs, callback)
end


ceres.addHook('main::after', function()
    TriggerRegisterEnterRegion(CreateTrigger(), worldbounds.REGION.handle, Filter(OnEnterMap))
end)
