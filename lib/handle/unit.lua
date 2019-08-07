require('handle.player')

local Unit = {}
Unit.__index = Unit

local allUnits = {}

unit = {}
unit.metatable = Unit

unit.MAX_COLLISION = 200  -- Maximum collision size for a unit (in gameplay constants)

function unit.wrap(whichUnit)
    if whichUnit then
        local handleId = GetHandleId(whichUnit)
        if allUnits[handleId] then
            return allUnits[handleId]
        else
            local table = {}
            allUnits[handleId] = table

            setmetatable(table, Unit)
            table.handle = whichUnit
            return table
        end
    end
end

function unit.create(whichPlayer, typeId, x, y, facingDeg)
    return unit.wrap(CreateUnit(whichPlayer.handle, FourCC(typeId), x, y, facingDeg))
end

local function toRawCode(int)
    local res = ''
    for i = 1, 4 do
        res = string.char(math.floor(int % 256)) .. res
        int = int / 256
	end
	return res
end

local function forEach(grp)
    return function()
        local u = FirstOfGroup(grp)
        assert(not u or GetUnitTypeId(u) ~= 0, "Invalid unit when populating table. Did you remove a unit from the game in the filter function?")
        GroupRemoveUnit(grp, u)
        return u
    end
end

-- Warning: removing a unit  that was enumerated into the group from the game in the filter func will break the iterator.
local function EnumGroup(filter, enumFunc, ...)
    local result = {}
    local grp = CreateGroup()
    enumFunc(grp, ...)
    if filter then
        for u in forEach(grp) do
            u = unit.wrap(u)
            if filter(u) then
                result[u] = true
            end
        end
    else
        for u in forEach(grp) do
            result[unit.wrap(u)] = true
        end
    end
    DestroyGroup(grp)
    return result
end


function unit.enumOfPlayer(whichPlayer, filter)
    return EnumGroup(filter, GroupEnumUnitsOfPlayer, whichPlayer.handle, nil)
end

function unit.enumInRect(whichRect, filter)
    return EnumGroup(filter, GroupEnumUnitsInRect, whichRect.handle, nil)
end
function unit.enumInRectCounted(whichRect, filter, countLimit)
    return EnumGroup(filter, GroupEnumUnitsInRectCounted, whichRect.handle, nil, countLimit)
end

function unit.enumInRange(x, y, radius, filter)
    return EnumGroup(filter, GroupEnumUnitsInRange, x, y, nil)
end
function unit.enumInRangeCounted(x, y, radius, filter, countLimit)
    return EnumGroup(filter, GroupEnumUnitsInRangeCounted, x, y, nil, countLimit)
end
function unit.enumInCollisionRange(x, y, radius, filter)
    if filter then
        return unit.enumInRange(x, y, radius+unit.MAX_COLLISION, function(u) return u:inRangeXY(x, y, radius) and filter(u) end)
    else
        return unit.enumInRange(x, y, radius+unit.MAX_COLLISION, function(u) return u:inRangeXY(x, y, radius) end)
    end
end

function unit.enumSelected(whichPlayer, filter)
    return EnumGroup(filter, GroupEnumUnitsSelected, whichPlayer.handle, nil)
end



-- --------------------------

function Unit:getTypeId()
    return toRawCode(GetUnitTypeId(self.handle))
end

function Unit:kill()
    KillUnit(self.handle)
end
function Unit:remove()
    RemoveUnit(self.handle)
    -- self.handle = nil
end
function Unit:show(boolShow)
    ShowUnit(self.handle, boolShow)
end


--SetUnitState
function Unit:setX(x)
    SetUnitX(self.handle, x)
end
function Unit:setY(y)
    SetUnitY(self.handle, y)
end

function Unit:setPosition(x, y)
    SetUnitPosition(self.handle, x, y)
end

function Unit:getX()
    return GetUnitX(self.handle)
end

function Unit:getY()
    return GetUnitY(self.handle)
end

function Unit:setPosition(x, y)
    SetUnitPosition(self.handle, x, y)
end
-- SetUnitPositionLoc
function Unit:setFacing(facingAngleDeg)
    SetUnitFacing(self.handle, facingAngleDeg)
end
-- SetUnitFacingTimed
-- SetUnitMoveSpeed
-- SetUnitFlyHeight
-- SetUnitTurnSpeed
-- SetUnitPropWindow
-- SetUnitAcquireRange
-- SetUnitCreepGuard

function Unit:addAbility(strAbilCode)
    UnitAddAbility(self.handle, FourCC(strAbilCode))
end
function Unit:removeAbility(strAbilCode)
    UnitRemoveAbility(self.handle, FourCC(strAbilCode))
end
function Unit:getAbilityLevel(strAbilCode)
    return GetUnitAbilityLevel(self.handle, FourCC(strAbilCode))
end

function Unit:getOwner()
    return player.wrap(GetOwningPlayer(self.handle))
end

function Unit:getCollisionSize()
    return BlzGetUnitCollisionSize(self.handle)
end

function Unit:inRangeOf(otherUnit, distance)
    return IsUnitInRange(self.handle, otherUnit.handle, distance)
end

function Unit:inRangeXY(x, y, distance)
    return IsUnitInRangeXY(self.handle, x, y, distance)
end

function Unit:issuePointOrder(strOrder, x, y)
    return IssuePointOrder(self.handle, strOrder, x, y)
end



function Unit:setScale(scale)
    SetUnitScale(self.handle, scale, scale, scale)
end

function Unit:setVertexColor(intRed, intGreen, intBlue, intAlpha)
    SetUnitVertexColor(self.handle, intRed, intGreen, intBlue, intAlpha)
end

function Unit:setColor(playerColor)
    SetUnitColor(self.handle, playerColor.handle)
end

function Unit:setTimeScale(scale)
    SetUnitTimeScale(self.handle, scale)
end

function Unit:addAnimationProperties(properties, boolAdd)
    AddUnitAnimationProperties(self.handle, properties, boolAdd)
end

function Unit:isHero()
    return IsUnitType(self.handle, UNIT_TYPE_HERO)
end

function Unit:isStructure()
    return IsUnitType(self.handle, UNIT_TYPE_STRUCTURE)
end

function Unit:getProperName()
    return GetHeroProperName(self.handle)
end
function Unit:setProperName(name)
    BlzSetHeroProperName(self.handle, name)
end

function Unit:getName()
    return GetUnitName(self.handle)
end
function Unit:setName(name)
    BlzSetUnitName(self.handle, name)
end