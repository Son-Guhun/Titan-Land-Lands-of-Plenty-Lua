require('stdlib')

local hooks = {}

function hooks:moveTo()
    local effect = self._weatherEffect

    if effect then
        local typeId = effect:getTypeId()
        effect:destroy()
        self._weatherEffect = weathereffect.create(self, typeId)
        self._weatherEffect:enable(true)
    end
end
hooks.set = hooks.moveTo

function hooks:destroy()
    self:removeWeather()
end

local Rect = rect.metatable
hookutils.hookTableAfter(hooks, Rect)

function Rect:addWeather(strWeatherId)
    if not self._weatherEffect then
        self._weatherEffect = weathereffect.create(self, strWeatherId)
        self._weatherEffect:enable(true)
    end
end

function Rect:changeWeather(strWeatherId)
    local effect = self._weatherEffect

    if effect then
        self._weatherEffect:destroy()
        self._weatherEffect = weathereffect.create(self, strWeatherId)
        self._weatherEffect:enable(true)
    end
end

function Rect:removeWeather()
    local effect = self._weatherEffect

    if effect then
        effect:destroy()
        self._weatherEffect = nil
    end
end

function Rect:hasWeather()
    if self._weatherEffect then return true else return false end
end