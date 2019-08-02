local Unit = {}
Unit.__index = Unit

local allUnits = {}

unit = {}
unit.metatable = Unit

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
    return unit.wrap(CreateUnit(whichPlayer.handle, typeId, x, y, facingDeg))
end

local function toRawCode(int)
    local res = ''
    for i = 1, 4 do
        res = string.char(math.floor(int % 256)) .. res
        int = int / 256
	end
	return res
end

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