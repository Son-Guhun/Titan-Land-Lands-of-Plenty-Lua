require('stdlib')

local hooks = {}

function hooks:moveTo()
    if self._lightnings then
        local minX = self:getMinX()
        local minY = self:getMinY()
        local maxX = self:getMaxX()
        local maxY = self:getMaxY()

        self._lightnings.top:move(false, minX, maxY, maxX, maxY)
        self._lightnings.bottom:move(false, minX, minY, maxX, minY)
        self._lightnings.left:move(false, minX, minY, minX, maxY)
        self._lightnings.right:move(false, maxX, minY, maxX, maxY)
    end
end
hooks.set = hooks.moveTo

function hooks:destroy()
    self:removeLightning()
end

local Rect = rect.metatable
hookutils.hookTableAfter(hooks, Rect)

function Rect:addLightning()
    if not self._lightnings then
        self._lightnings = {}

        local minX = self:getMinX()
        local minY = self:getMinY()
        local maxX = self:getMaxX()
        local maxY = self:getMaxY()

        self._lightnings.top = lightning.create('DRAM', false, minX, maxY, maxX, maxY)
        self._lightnings.bottom = lightning.create('DRAM', false, minX, minY, maxX, minY)
        self._lightnings.left = lightning.create('DRAM', false, minX, minY, minX, maxY)
        self._lightnings.right = lightning.create('DRAM', false, maxX, minY, maxX, maxY)
    end
end

function Rect:removeLightning()
    if self._lightnings then
        for _,lightning in pairs(self._lightnings) do
            lightning:destroy()
        end
        self._lightnings = nil
    end
end



return Rect
