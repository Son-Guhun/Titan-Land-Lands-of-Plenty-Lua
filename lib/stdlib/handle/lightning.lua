lightning = {}

local Lightning = {}
Lightning.__index = Lightning

lightning.metatable = Lightning

function lightning.create(strCodeName, checkVisibility, x1, y1, x2, y2)
    local table = {}
    setmetatable(table, Lightning)
    table.handle = AddLightning(strCodeName, checkVisibility, x1, y1, x2, y2)
    return table
end

function Lightning:move(checkVisibility, x1, y1, x2, y2)
    MoveLightning(self.handle, checkVisibility, x1, y1, x2, y2)
end

function Lightning:destroy()
    return DestroyLightning(self.handle)
end