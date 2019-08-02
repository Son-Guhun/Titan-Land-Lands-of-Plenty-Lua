local Region = {}
Region.__index = Region


function Region:create()
    local table = {}
    setmetatable(table, self)
    table.handle = CreateRegion()
    return table
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


return Region