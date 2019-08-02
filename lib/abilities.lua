require("unitevents.generic")

-- TODO: Natives to wrap
--[[
native GetAbilityEffectById         takes integer abilityId, effecttype t, integer index returns string
native GetAbilitySoundById          takes integer abilityId, soundtype t returns string


native BlzSetAbilityResearchExtendedTooltip        takes integer abilCode, string researchExtendedTooltip, integer level returns nothing
native BlzGetAbilityResearchExtendedTooltip        takes integer abilCode, integer level returns string
]]--
abilities = {}


local Abilities = {}
Abilities.__index = Abilities
abilities.metatable = Abilities

local cachedAbilities = {}

function abilities.get(abilCode)
    local ability = cachedAbilities[abilCode]
    if ability then
        return ability
    else
        ability = {}
        setmetatable(ability, Abilities)
        ability.code = FourCC(abilCode)
        cachedAbilities[abilCode] = ability
        return ability
    end
end

-- onCast events
local funcs = {}

local function OnSpellCast(spellId, trigU, target)
    if funcs[spellId] then
        funcs[spellId](spellId, trigU, target)
    end
end

function Abilities:onEffect(callback)
    funcs[self.code] = callback
end

unitevents.generic:onSpellEffect(OnSpellCast)


-- Tooltip methods
function Abilities:getTooltip(intLevel)
    return BlzGetAbilityTooltip(self.code, intLevel)
end
function Abilities:setTooltip(strTooltip, intLevel)
    BlzSetAbilityTooltip(self.code, strTooltip, intLevel)
end

function Abilities:getActivatedTooltip(intLevel)
    return BlzGetAbilityActivatedTooltip(self.code, intLevel)
end
function Abilities:getActivatedTooltip(intLevel)
    BlzSetAbilityActivatedTooltip(self.code, intLevel)
end

function Abilities:getExtendedTooltip(intLevel)
    return BlzGetAbilityExtendedTooltip(self.code, intLevel)
end
-- Setter

function Abilities:getResearchTooltip(intLevel)
    return BlzGetAbilityResearchTooltip(self.code, intLevel)
end
-- Setter

-- Icon methods
function Abilities:getIcon()
    return BlzGetAbilityIcon(self.code)
end
-- Setter

function Abilities:getActivatedIcon()
    return BlzGetAbilityActivatedIcon(self.code)
end
-- Setter

function Abilities:getPosX()
    return BlzGetAbilityPosX(self.code)
end
-- Setter

function Abilities:getPosY()
    return BlzGetAbilityPosY(self.code)
end
-- Setter

function Abilities:getActivatedPosX()
    return BlzGetAbilityActivatedPosX(self.code)
end
-- Setter

function Abilities:getActivatedPosY()
    return BlzGetAbilityActivatedPosY(self.code)
end
-- Setter

-- Other methods
function Abilities:getManaCost(intLevel)
    return BlzGetAbilityManaCost(self.code, intLevel)
end

function Abilities:BlzGetAbilityCooldown(intLevel)
    return BlzGetAbilityCooldown(self.code, intLevel)
end