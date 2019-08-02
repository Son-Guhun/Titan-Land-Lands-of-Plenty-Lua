weathereffect = {}

local WeatherEffect = {}
WeatherEffect.__index = WeatherEffect

weathereffect.metatable = WeatherEffect

function weathereffect.create(rect, strEffectId)
    local table = {}
    setmetatable(table, WeatherEffect)
    table.handle = AddWeatherEffect(rect.handle, FourCC(strEffectId))
    table._isEnabled = false
    table._typeId = strEffectId
    return table
end

function WeatherEffect:destroy()
    local effect = self.handle
    EnableWeatherEffect(effect, false)  -- If a weather effect is not disabled before being destroyed, its sound remains.
    RemoveWeatherEffect(effect)
end

function WeatherEffect:isEnabled()
    return self._isEnabled
end

function WeatherEffect:enable(boolEnable)
    EnableWeatherEffect(effect, boolEnable)
    self._isEnabled = boolEnable
end

function WeatherEffect:getTypeId()
    return self._typeId
end