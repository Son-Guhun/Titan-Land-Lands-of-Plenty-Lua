require('stdlib.handle.unit')

region = {}

local Region = {}
Region.__index = Region
region.metatable = {}


function region.create()
    local table = {}
    setmetatable(table, Region)
    table.handle = CreateRegion()
    return table
end

function Region:destroy()
    self:onEnter(nil)
    RemoveRegion(self.handle)
    self.handle = nil
end


function Region:addRect(rect)
    RegionAddRect(self.handle, rect.handle)
end
function Region:clearRect(rect)
    RegionClearRect(self.handle, rect.handle)
end

function Region:addCell(x, y)
    RegionAddCell(self.handle, x, y)
end
function Region:clearCell(x, y)
    RegionClearCell(self.handle, x, y)
end


-- Non-natives
-- GetTriggerRegion() does not work in a filter
function Region:onEnter(callback)
    local trig = self._onEnterTrigger
    if not callback then
        if trig then
            DestroyTrigger(trig)
            DestroyFilter(self._onEnterFilter)
            self._onEnterTrigger = nil
            self._onEnterFilter = nil
            self._onEnterCallback = nil
        end
    else
        if not trig then
            trig = CreateTrigger()
            self._onEnterTrigger = trig
            self._onEnterCallback = callback
            self._onEnterFilter = Filter(function()
                self._onEnterCallback(self, unit.wrap(GetFilterUnit()))
                return false
            end)
            TriggerRegisterEnterRegion(trig, self.handle, self._onEnterFilter)
        else
            self._onEnterCallback = callback
        end
    end
end