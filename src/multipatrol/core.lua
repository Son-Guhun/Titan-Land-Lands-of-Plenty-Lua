require('stdlib')

local multipatrol = {}

local RANGE = 32.
local MINIMUM_DISTANCE = 100.

local PATROL_RECT
ceres.addHook('main::after', function() 
    PATROL_RECT = rect.create(0,0,RANGE,RANGE)
    PATROL_RECT.destroy = stdlib.DO_NOTHING
 end)

local isSystemOrder = false

function multipatrol.isSystemOrder() return isSystemOrder end

local Unit = unit.metatable
function patrolPointReached(whichRegion, trigU)
    if whichRegion._patrolUnit == trigU then
        local patrolPoints = trigU._patrolPoints
        local nextPoint = trigU._currentPatrol%#patrolPoints + 1
        local nextCoords = patrolPoints[nextPoint]

        isSystemOrder = true
        if trigU:issuePointOrder('patrol', table.unpack(nextCoords)) then
            PATROL_RECT:moveTo(table.unpack(patrolPoints[trigU._currentPatrol]))
            whichRegion:clearRect(PATROL_RECT)
            trigU._currentPatrol = nextPoint
            PATROL_RECT:moveTo(table.unpack(nextCoords))
            whichRegion:addRect(PATROL_RECT)
        end
        isSystemOrder = false
    end
end

function Unit:resumePatrol()
    local patrolPoints = self._patrolPoints
    if patrolPoints then
        local nextCoords = patrolPoints[self._currentPatrol]
        isSystemOrder = true
        if not self:issuePointOrder('patrol', table.unpack(nextCoords)) then
            self:issuePointOrder('move', table.unpack(nextCoords))
        end
        isSystemOrder = false
    end
end

function Unit:createPatrolPath(x0, y0, x, y)
    if math.distance(x0, y0, x, y) > MINIMUM_DISTANCE then
        local patrolRegion = region.create()
        self._patrolRegion = patrolRegion
        self._patrolPoints = {{x0,y0},{x,y}}
        self._currentPatrol = 2

        PATROL_RECT:moveTo(x, y)
        patrolRegion._patrolUnit = self
        patrolRegion:onEnter(patrolPointReached)
        patrolRegion:addRect(PATROL_RECT)
        return true
    end
    return false
end

-- Todo: also check distance to the first patrol point
function Unit:addPatrolPoint(x, y)
    local patrolPoints = self._patrolPoints
    if patrolPoints then
        if math.distance(x, y, table.unpack(patrolPoints[#patrolPoints])) > MINIMUM_DISTANCE then
            table.insert(patrolPoints, {x,y})
        end
    end
end

function Unit:hasPatrolPath()
    if self._patrolPoints then return true else return false end
end

function Unit:clearPatrolData()
    local patrolRegion = self._patrolRegion

    if patrolRegion then
        patrolRegion:destroy()
        self._patrolRegion = nil
        self._patrolPoints = nil
        self._currentPatrol = nil
    end
end

return multipatrol