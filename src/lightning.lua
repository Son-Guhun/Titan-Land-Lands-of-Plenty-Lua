local Lightning = {}
Lightning.__index = Lightning

function Lightning:create(strCodeName, checkVisibility, x1, y1, x2, y2)
    local table = {}
    setmetatable(table, self)
    table.handle = AddLightning(strCodeName, checkVisibility, x1, y1, x2, y2)
    return table
end

function Lightning:move(checkVisibility, x1, y1, x2, y2)
    MoveLightning(self.handle, checkVisibility, x1, y1, x2, y2)
end

function Lightning:destroy()
    return DestroyLightning(self.handle)
end

return Lightning