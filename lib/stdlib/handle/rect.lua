rect = {}

local nativeRect = Rect
local Rect = {}
Rect.__index = Rect
rect.metatable = Rect

local function updateValues(rect)
    local handle = rect.handle
    rect._minX = GetRectMinX(handle)
    rect._minY = GetRectMinY(handle)
    rect._maxX = GetRectMaxX(handle)
    rect._maxY = GetRectMaxY(handle)
    rect._centerX = GetRectCenterX(handle)
    rect._centerY = GetRectCenterY(handle)
end

local function wrapRect(whichRect)
    local table = {}
    setmetatable(table, Rect)
    table.handle = whichRect
    updateValues(table)
    return table
end

function rect.create(minX, minY, maxX, maxY)
    return wrapRect(nativeRect(minX, minY, maxX, maxY))
end

-- Used to wrap rect globals created in the World Editor
wrappedRects = {}
function rect.wrap(whichRect)
    if whichRect then
        local handleId = GetHandleId(whichRect)
        local wrapper = wrappedRects[handleId] 
        if not wrapper then
            wrapper = wrapRect(whichRect)
            wrappedRects[handleId] = wrapper
        end
        return wrapper
    end
end


function rect.fromWorldBounds()
    local table = {}
    setmetatable(table, Rect)
    table.handle = GetWorldBounds()
    updateValues(table)
    return table
end

function Rect:destroy()
    RemoveRect(self.handle)
end

function Rect:set(minX, minY, maxX, maxY)
    SetRect(self.handle, minX, minY, maxX, maxY)
    updateValues(self)
end
function Rect:moveTo(centerX, centerY)
    MoveRectTo(self.handle, centerX, centerY)
    updateValues(self)
end
function Rect:getMinX()
    return self._minX
end
function Rect:getMinY()
    return self._minY
end
function Rect:getMaxX()
    return self._maxX
end
function Rect:getMaxY()
    return self._maxY
end
function Rect:getCenterX()
    return self._centerX
end
function Rect:getCenterY()
    return self._centerY
end

function Rect:getWidth()
    return self._maxX - self._minX
end
function Rect:setWidth(width)
    local halfWidth = width/2
    self:set(self._centerX - halfWidth, self._minY, self._centerX + halfWidth, self._maxY)
end
function Rect:getHeight()
    return self._maxY - self._minY
end
function Rect:setHeight(height)
    local halfHeight = height/2
    self:set(self._minX, self._centerY - halfHeight, self._maxX, self._centerY + halfHeight)
end
function Rect:containsObject(object)
    local x,y = object:getX(),object:getY()
    return self._minX <= x and self._maxX >= x and self._minY <= y and self._maxY >= y
end


return Rect