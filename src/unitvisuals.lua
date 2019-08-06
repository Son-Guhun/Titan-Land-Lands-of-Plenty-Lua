require('stdlib')

local unitvisuals = {}


local Unit = unit.metatable

function Unit:setCustomScale(scale)
    self._customScale =  scale
    self:setScale(scale)
end

function Unit:setCustomVertexColor(intRed, intGreen, intBlue, intAlpha)
    self._customVertexColor = {intRed, intGreen, intBlue, intAlpha}
    self:setVertexColor(intRed, intGreen, intBlue, intAlpha)
end

function Unit:setCustomColor(playerColor)
    self._customColor = playerColor
    self:setColor(playerColor)
end

local allTags = "gold lumber work flesh ready one two throw slam large medium small victory alternate morph defend swim spin fast upgrade first second third fourth fifth"
function Unit:setCustomAnimationProperties(properties)
    local currentProps = self._customProperties
    if currentProps then
        self:addAnimationProperties(allTags, false)
    else
        self:addAnimationProperties(allTags, false)
    end

    if properties ~= '' then
        self:addAnimationProperties(properties, true)
    else
        self._customProperties = nil
    end
end


function Unit:setCustomName(name)
    if self:isHero() then
        self._originalName = self:getProperName()
        self:setProperName(name)
    else
        self._originalName = self:getName()
        self:setName(name)
    end
end



return unitvisuals