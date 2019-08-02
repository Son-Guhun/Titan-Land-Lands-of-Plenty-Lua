require('abilities')
local Rect = require('rect')
require('UserDefinedRects.rectLightning')
require('UserDefinedRects.rectWeather')

local Event = require('unitevents.generic')
require('unitevents.generic.entermap')

local hookutils = require('hookutils')
require('unit')

local GENERATOR_ID = 'udr0'

local ABILS = {}
ABILS.CREATE_OR_DESTROY   = 'UDR2'
ABILS.TOGGLE_VISIBILITY   = 'UDRA'
ABILS.MOVE                = 'UDR4'
ABILS.MOVE_TERRAIN        = 'UDRT'

ABILS.RETRACT_Y           = 'UDR7'
ABILS.EXPAND_Y            = 'UDR8'
ABILS.EXPAND_X            = 'UDR6'
ABILS.RETRACT_X           = 'UDR5'

ABILS.CHANGE_WEATHER_NEXT = 'AUR0'
ABILS.CHANGE_WEATHER_PREV = 'AUR1'
ABILS.TOGGLE_WEATHER      = 'UDR9'

ABILS.LOCK_UNITS          = 'UDR3'
ABILS.UNLOCK_UNITS        = 'UDRB'

ABILS.PAGE_NEXT = 'UDRQ'
ABILS.PAGE_PREV = 'UDRR'

ABILS.TOGGLE_FOG = 'UDRS'

ABILS.FOG_STYLE_UP      = 'UDRI'
ABILS.FOG_STYLE_DOWN    = 'UDRJ'

ABILS.FOG_ZSTART_UP    = 'UDRK'
ABILS.FOG_ZSTART_DOWN  = 'UDRL'

ABILS.FOG_ZEND_UP      = 'UDRM'
ABILS.FOG_ZEND_DOWN    = 'UDRN'

ABILS.FOG_DENSITY_UP   = 'UDRO'
ABILS.FOG_DENSITY_DOWN = 'UDRP'

ABILS.FOG_RED_UP       = 'UDRC'
ABILS.FOG_RED_DOWN     = 'UDRD'

ABILS.FOG_GREEN_UP     = 'UDRG'
ABILS.FOG_GREEN_DOWN   = 'UDRH'

ABILS.FOG_BLUE_UP      = 'AUR2'
ABILS.FOG_BLUE_DOWN    = 'UDRF'

local PAGES = {
    {ABILS.CREATE_OR_DESTROY, ABILS.TOGGLE_VISIBILITY, ABILS.MOVE, ABILS.MOVE_TERRAIN,
     ABILS.RETRACT_X, ABILS.EXPAND_X, ABILS.RETRACT_Y, ABILS.EXPAND_Y, ABILS.LOCK_UNITS, ABILS.UNLOCK_UNITS},

    {ABILS.CHANGE_WEATHER_NEXT, ABILS.CHANGE_WEATHER_PREV, ABILS.TOGGLE_WEATHER, ABILS.TOGGLE_FOG, ABILS.FOG_STYLE_UP,
     ABILS.FOG_STYLE_DOWN, ABILS.FOG_ZSTART_UP, ABILS.FOG_ZSTART_DOWN, ABILS.FOG_ZEND_UP, ABILS.FOG_ZEND_DOWN},

    {ABILS.FOG_DENSITY_UP, ABILS.FOG_DENSITY_DOWN, ABILS.FOG_RED_UP, ABILS.FOG_RED_DOWN,
    ABILS.FOG_GREEN_UP, ABILS.FOG_GREEN_DOWN, ABILS.FOG_BLUE_UP, ABILS.FOG_BLUE_DOWN}
}

local function GetUnitCurrentPage(u)
    local currentPage

    for i,page in ipairs(PAGES) do
        if u:getAbilityLevel(page[1]) > 0 then
            currentPage = i
        end
    end
    return currentPage
end

abilities.get(ABILS.PAGE_NEXT):onEffect(function(_, trigU)
    local currentPage = GetUnitCurrentPage(trigU)

    for _,abil in ipairs(PAGES[currentPage]) do
        trigU:removeAbility(abil)
    end
    for _,abil in ipairs(PAGES[currentPage%#PAGES + 1]) do
        trigU:addAbility(abil)
    end
end)

abilities.get(ABILS.PAGE_PREV):onEffect(function(_, trigU)
    local currentPage = GetUnitCurrentPage(trigU)

    for _,abil in ipairs(PAGES[currentPage]) do
        trigU:removeAbility(abil)
    end
    for _,abil in ipairs(PAGES[(currentPage - 2)%#PAGES + 1]) do
        trigU:addAbility(abil)
    end
end)

abilities.get(ABILS.CREATE_OR_DESTROY):onEffect(function(_, trigU)
    if trigU:hasAttachedRect() then
        trigU:destroyAttachedRect()
    else
        trigU:createAttachedRect()
    end
end)

abilities.get(ABILS.MOVE):onEffect(function (_,trigU, target)
    print(target.getX())
    trigU:setPosition(target:getX(), target:getY())
end)

abilities.get(ABILS.EXPAND_X):onEffect(function (_, trigU)
    local rect = trigU._attachedRect
    if rect then
        rect:setWidth(trigU._attachedRect:getWidth() + 64)
    end
end)

abilities.get(ABILS.RETRACT_X):onEffect(function (_, trigU)
    local rect = trigU._attachedRect
    if rect then
        rect:setWidth(trigU._attachedRect:getWidth() - 64)
    end
end)

abilities.get(ABILS.EXPAND_Y):onEffect(function (_, trigU)
    local rect = trigU._attachedRect
    if rect then
        rect:setHeight(trigU._attachedRect:getHeight() + 64)
    end
end)

abilities.get(ABILS.RETRACT_Y):onEffect(function (_, trigU)
    local rect = trigU._attachedRect
    if rect then
        rect:setHeight(trigU._attachedRect:getHeight() - 64)
    end
end)

local weatherList = {'RAhr', 'RAlr', 'MEds', 'FDbh', 'FDbl', 'FDgh', 'FDgl', 'FDrh', 'FDrl', 'FDwh', 'FDwl', 'RLhr', 'RLlr', 'SNbs', 'SNhs', 'SNls', 'WOcw', 'WOlw', 'LRaa', 'LRma', 'WNcw'}

abilities.get(ABILS.CHANGE_WEATHER_NEXT):onEffect(function (_, trigU)
    local rect = trigU._attachedRect
    if rect then
        trigU._currentWeather = trigU._currentWeather%#weatherList + 1
        rect:changeWeather(weatherList[trigU._currentWeather])
    end
end)

abilities.get(ABILS.CHANGE_WEATHER_PREV):onEffect(function (_, trigU)
    local rect = trigU._attachedRect
    if rect then
        trigU._currentWeather = (trigU._currentWeather - 2)%#weatherList + 1
        rect:changeWeather(weatherList[trigU._currentWeather])
    end
end)

abilities.get(ABILS.TOGGLE_WEATHER):onEffect(function (_, trigU)
    local rect = trigU._attachedRect
    if rect then
        if rect:hasWeather() then
            rect:removeWeather()
        else
            rect:addWeather(weatherList[trigU._currentWeather])
        end
    end
end)

-- Remove Aatk and Amov on enter map, add first page of abilities
ceres.addHook('main::after', function()
    Event:onEnterMap(function(trigU)
        print(trigU:getTypeId())
        if trigU:getTypeId() == GENERATOR_ID then
            trigU:removeAbility('Amov')
            trigU:removeAbility('Aatk')
            for _,abil in ipairs(PAGES[1]) do
                print(abil)
                trigU:addAbility(abil)
            end
        end
    end)
end)


local hooks = {}
local function updatePosition(unitGenerator)
    if unitGenerator._attachedRect then
        unitGenerator._attachedRect:moveTo(unitGenerator:getX(), unitGenerator:getY())
    end
end
hooks.setX = updatePosition
hooks.setY = updatePosition
hooks.setPosition = updatePosition

local Unit = unit.metatable
hookutils.hookTableAfter(hooks, Unit)

function Unit:createAttachedRect()
    if not self._attachedRect then
        local rect = Rect:create(0,0,64,64)
        self._attachedRect = rect
        self._currentWeather = 1
        updatePosition(self)
        rect:addLightning()
        rect:addWeather(weatherList[self._currentWeather])
    end
end

function Unit:destroyAttachedRect()
    if self._attachedRect then
        self._attachedRect:destroy()
        self._attachedRect = nil
    end
end

function Unit:hasAttachedRect()
    if self._attachedRect then return true else return false end
end

