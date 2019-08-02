require('unitevents.generic._table')
local worldbounds = require('worldbounds')
require('handle.unit')

local onEnterMapFuncs = {}

local function OnEnterMap()
    for _,func in ipairs(onEnterMapFuncs) do
        local r,e = pcall(func, unit.wrap(GetFilterUnit()))
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
