-- ceres header start

local ceres = {
}

local __ceres_hooks = {
    ["main::before"] = {},
    ["main::after"] = {},
    ["config::before"] = {},
    ["config::after"] = {}
}

local function __ceres_hookCall(hookName)
    for _, callback in pairs(__ceres_hooks[hookName]) do
        callback()
    end
end

local __ceres_customMain = nil
local __ceres_customConfig = nil

local function __ceresMain()
    __ceres_hookCall("main::before")
    if __ceres_customMain ~= nil then
        __ceres_customMain()
    else
        ceres.__oldMain()
    end
    __ceres_hookCall("main::after")
end

local function __ceresConfig()
    __ceres_hookCall("config::before")
    if __ceres_customConfig ~= nil then
        __ceres_customConfig()
    else
        ceres.__oldConfig()
    end
    __ceres_hookCall("config::after")
end

function ceres.addHook(hookName, callback)
    table.insert(__ceres_hooks[hookName], ceres.wrapCatch(callback))
end

function ceres.setMain(callback)
    __ceres_customMain = callback
end

function ceres.setConfig(callback)
    __ceres_customConfig = callback
end

function ceres.catch(callback, ...)
    local success, err = pcall(callback, ...)

    if not success then
        print(err)
    end
end

function ceres.wrapCatch(callback)
    return function(...)
        ceres.catch(callback, ...)
    end
end

local __modules = {}

require = function(name)
    local module = __modules[name]

    if module ~= nil then
        if module.initialized then
            return module.cached
        else
            module.initialized = true
            module.cached = module.loader()
            return module.cached
        end
    else
        error("module not found")
    end
end

-- ceres header end
gg_trg_Melee_Initialization = nil
function InitGlobals()
end

function Trig_Melee_Initialization_Actions()
    MeleeStartingVisibility()
    MeleeStartingHeroLimit()
    MeleeGrantHeroItems()
    MeleeStartingResources()
    MeleeClearExcessUnits()
    MeleeStartingUnits()
    MeleeStartingAI()
    MeleeInitVictoryDefeat()
end

function InitTrig_Melee_Initialization()
    gg_trg_Melee_Initialization = CreateTrigger()
    TriggerAddAction(gg_trg_Melee_Initialization, Trig_Melee_Initialization_Actions)
end

function InitCustomTriggers()
    InitTrig_Melee_Initialization()
end

function RunInitializationTriggers()
    ConditionalTriggerExecute(gg_trg_Melee_Initialization)
end

function InitCustomPlayerSlots()
    SetPlayerStartLocation(Player(0), 0)
    SetPlayerColor(Player(0), ConvertPlayerColor(0))
    SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(0), true)
    SetPlayerController(Player(0), MAP_CONTROL_USER)
end

function InitCustomTeams()
    SetPlayerTeam(Player(0), 0)
end

function main()
    SetCameraBounds(-3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    NewSoundEnvironment("Default")
    SetAmbientDaySound("LordaeronSummerDay")
    SetAmbientNightSound("LordaeronSummerNight")
    SetMapMusic("Music", true, 0)
    InitBlizzard()
    InitGlobals()
    InitCustomTriggers()
    RunInitializationTriggers()
end

function config()
    SetMapName("TRIGSTR_001")
    SetMapDescription("TRIGSTR_003")
    SetPlayers(1)
    SetTeams(1)
    SetGamePlacement(MAP_PLACEMENT_USE_MAP_SETTINGS)
    DefineStartLocation(0, 1449.6, -357.3)
    InitCustomPlayerSlots()
    SetPlayerSlotAvailable(Player(0), MAP_CONTROL_USER)
    InitGenericPlayerSlots()
end


local function __module_0()
    local MethodHooker = {}
    MethodHooker.__index = MethodHooker
    
    local hookCache = {}
    
    function MethodHooker:create()
        local table = {}
        setmetatable(table, self)
        return table
    end
    
    function MethodHooker:hookBefore(table)
        if not table._beforeHooks then
            table._beforeHooks = {}
        end
        table._beforeHooks[self] = true
    end
    
    
    function MethodHooker:hookAfter(table)
        if not table._afterHooks then
            table._afterHooks = {}
        end
        table._afterHooks[self] = true
    end
    
    function MethodHooker:unhookAfter(table)
        table._afterHooks[self] = nil
        if next(table._afterHooks) == nil then
            table._afterHooks = nil
        end
    end
    
    function MethodHooker:unhookBefore(table)
        table._beforeHooks[self] = nil
        if next(table._beforeHooks) == nil then
            table._beforeHooks = nil
        end
    end
    
    local function HookedMethod(table, index)
        local metatable = getmetatable(table)
        local field = metatable[index]
        if type(field) ~= 'function' then
            return field
        end
    
        local func = hookCache[metatable][index]
        if not func then
            func = function(self, ...)
                if self._beforeHooks then
                    for hook,_ in pairs(self._beforeHooks) do
                        if hook[index] then
                            hook[index](self, ...)
                        end
                    end
                end
                local value = field(self, ...)
                if self._afterHooks then
                    for hook,_ in pairs(self._afterHooks) do
                        if hook[index] then
                            hook[index](self, value, ...)
                        end
                    end
                end
                return value
            end
            hookCache[metatable][index] = func
        end
        return func
    end
    
    function MethodHooker.hookableMetatable()
        local table = {}
        hookCache[table] = {}
        table.__index = HookedMethod
        return table
    end
    
    return MethodHooker
end
__modules["methodhooker"] = {initialized = false, cached = nil, loader = __module_0}
local function __module_1()
    local MethodHooker = require("methodhooker")
    
    local Unit = MethodHooker.hookableMetatable()
    
    local allUnits = {}
    
    function Unit:wrap(whichUnit)
        if whichUnit then
            if allUnits[whichUnit] then
                return allUnits[whichUnit]
            else
                local table = {}
                allUnits[whichUnit] = table
    
                setmetatable(table, self)
                table.handle = whichUnit
                return table
            end
        end
    end
    
    function Unit:create(whichPlayer, typeId, x, y, facingDeg)
        return Unit:wrap(CreateUnit(whichPlayer.handle, typeId, x, y, facingDeg))
    end
    
    function Unit:kill()
        KillUnit(self.handle)
    end
    function Unit:remove()
        RemoveUnit(self.handle)
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
    
    return Unit
end
__modules["unit"] = {initialized = false, cached = nil, loader = __module_1}
local function __module_2()
    local User = Player
    local Player = {}
    Player.__index = Player
    
    function Player:fromId(id)
        local table = {}
        setmetatable(table, self)
        table.handle = User(id)
        return table
    end
    
    
    return Player
end
__modules["player"] = {initialized = false, cached = nil, loader = __module_2}
local function __module_3()
    local MethodHooker = require("methodhooker")
    
    
    local nativeRect = Rect
    local Rect = MethodHooker.hookableMetatable()
    
    local function updateValues(rect)
        local handle = rect.handle
        rect._minX = GetRectMinX(handle)
        rect._minY = GetRectMinY(handle)
        rect._maxX = GetRectMaxX(handle)
        rect._maxY = GetRectMaxY(handle)
        rect._centerX = GetRectCenterX(handle)
        rect._centerY = GetRectCenterY(handle)
    end
    
    function Rect:create(minX, minY, maxX, maxY)
        local table = {}
        setmetatable(table, self)
        table.handle = nativeRect(minX, minY, maxX, maxY)
        updateValues(table)
        return table
    end
    
    function Rect:fromWorldBounds()
        local table = {}
        setmetatable(table, self)
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
    
    return Rect
end
__modules["rect"] = {initialized = false, cached = nil, loader = __module_3}
local function __module_4()
    local GenericUnitEvent = {}
    return GenericUnitEvent
end
__modules["unitevents.generic"] = {initialized = false, cached = nil, loader = __module_4}
local function __module_5()
    local Unit = require("unit")
    local GenericUnitEvent = require("unitevents.generic")
    
    -- TODO: Cache target of spellId after first cast. For Channel spells, check their special fields.
    
    local onSpellCastFuncs = {}
    
    function OnSpellCast()
    
        local target = Unit:wrap(GetSpellTargetUnit())
    
        if not target then
            target = GetSpellTargetDestructable()
            if not target then
                target = GetSpellTargetItem()
                if not target then
                    target = {}
                    local x = GetSpellTargetX()
                    local y = GetSpellTargetY()
                    function target.getX() return x end
                    function target.getY() return y end
                end
            end
        end
    
        for _,func in ipairs(onSpellCastFuncs[GetHandleId(GetTriggerEventId())]) do
            local b, e = pcall(func, GetSpellAbilityId(), Unit:wrap(GetTriggerUnit()), target)
            if not b then print(e) end
        end
    end
    
    local events = {EVENT_PLAYER_UNIT_SPELL_CHANNEL, EVENT_PLAYER_UNIT_SPELL_CAST, EVENT_PLAYER_UNIT_SPELL_EFFECT,
                              EVENT_PLAYER_UNIT_SPELL_FINISH, EVENT_PLAYER_UNIT_SPELL_ENDCAST}
    
    for _,event in ipairs(events) do
        onSpellCastFuncs[GetHandleId(event)] = {}
    end
    
    local function init()
        local trig = CreateTrigger()
    
        for i=0,bj_MAX_PLAYER_SLOTS do
            local player = Player(i)
    
            for _,event in ipairs(events) do
                TriggerRegisterPlayerUnitEvent(trig, player, event, nil)
            end
        end
    
        TriggerAddCondition(trig, Condition(OnSpellCast))
    end
    
    local function onSpell(event, callback)
        table.insert(onSpellCastFuncs[GetHandleId(event)], callback)
    end
    
    function GenericUnitEvent:onSpellChannel(callback)
       onSpell(EVENT_PLAYER_UNIT_SPELL_CHANNEL, callback)
    end
    
    function GenericUnitEvent:onSpellCast(callback)
        onSpell(EVENT_PLAYER_UNIT_SPELL_CAST, callback)
    end
    
    function GenericUnitEvent:onSpellEffect(callback)
        onSpell(EVENT_PLAYER_UNIT_SPELL_EFFECT, callback)
    end
    
    function GenericUnitEvent:onSpellFinish(callback)
        onSpell(EVENT_PLAYER_UNIT_SPELL_FINISH, callback)
    end
    function GenericUnitEvent:onSpellEndCast(callback)
        onSpell(EVENT_PLAYER_UNIT_SPELL_ENDCAST, callback)
    end
    
    ceres.addHook("main::after", init)
    
    -- Tests
    if false then
        local function initTest()
            GenericUnitEvent:onSpellEffect(function(spellId, trigU, target) print(GetUnitName(trigU)) end)
        end
    
        ceres.addHook("main::after", initTest)
    end
    
    return GenericUnitEvent
    
end
__modules["unitevents.generic.spell"] = {initialized = false, cached = nil, loader = __module_5}
local function __module_6()
    local Event = require("unitevents.generic")
    require("unitevents.generic.spell")
    
    -- TODO: Natives to wrap
    --[[
    native GetAbilityEffectById         takes integer abilityId, effecttype t, integer index returns string
    native GetAbilitySoundById          takes integer abilityId, soundtype t returns string
    
    
    native BlzSetAbilityResearchExtendedTooltip        takes integer abilCode, string researchExtendedTooltip, integer level returns nothing
    native BlzGetAbilityResearchExtendedTooltip        takes integer abilCode, integer level returns string
    ]]--
    
    local Abilities = {}
    Abilities.__index = Abilities
    
    local cachedAbilities = {}
    
    function Abilities:get(abilCode)
        local ability = cachedAbilities[abilCode]
        if ability then
            return ability
        else
            ability = {}
            setmetatable(ability, self)
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
    
    Event:onSpellEffect(OnSpellCast)
    
    
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
    
    return Abilities
end
__modules["abilities"] = {initialized = false, cached = nil, loader = __module_6}
local function __module_7()
    local Lightning = {}
    Lightning.__index = Lightning
    
    function Lightning:create(strCodeName, checkVisibility, x1, y1, x2, y2)
        local table = {}
        setmetatable(table, self)
        table.handle = AddLightning(strCodeName, checkVisibility, x1, y1, x2, y2)
        return table
    end
    
    function Lightning:move(checkVisibility, x1, y1, x2, y2)
        MoveLightning(self.handle, checkVisibility, x1, y1, x2, y2)
    end
    
    function Lightning:destroy()
        return DestroyLightning(self.handle)
    end
    
    return Lightning
end
__modules["lightning"] = {initialized = false, cached = nil, loader = __module_7}
local function __module_8()
    local Rect = require("rect")
    local Lightning = require("lightning")
    local MethodHooker = require("methodhooker")
    
    local hooks = MethodHooker:create()
    
    function hooks:moveTo()
        local minX = self:getMinX()
        local minY = self:getMinY()
        local maxX = self:getMaxX()
        local maxY = self:getMaxY()
    
        self._lightnings.top:move(false, minX, maxY, maxX, maxY)
        self._lightnings.bottom:move(false, minX, minY, maxX, minY)
        self._lightnings.left:move(false, minX, minY, minX, maxY)
        self._lightnings.right:move(false, maxX, minY, maxX, maxY)
    end
    hooks.set = hooks.moveTo
    
    function hooks:destroy(returnValue)
        self:removeLightning()
    end
    
    function Rect:addLightning()
        if not self._lightnings then
            self._lightnings = {}
    
            local minX = self:getMinX()
            local minY = self:getMinY()
            local maxX = self:getMaxX()
            local maxY = self:getMaxY()
    
            self._lightnings.top = Lightning:create('DRAM', false, minX, maxY, maxX, maxY)
            self._lightnings.bottom = Lightning:create('DRAM', false, minX, minY, maxX, minY)
            self._lightnings.left = Lightning:create('DRAM', false, minX, minY, minX, maxY)
            self._lightnings.right = Lightning:create('DRAM', false, maxX, minY, maxX, maxY)
    
            hooks:hookAfter(self)
        end
    end
    
    function Rect:removeLightning()
        if self._lightnings then
            for _,lightning in pairs(self._lightnings) do
                lightning:destroy()
            end
            self._lightnings = nil
            hooks:unhookAfter(self)
        end
    end
    
    
    
    return Rect
    
end
__modules["UserDefinedRects.rectLightning"] = {initialized = false, cached = nil, loader = __module_8}
local function __module_9()
    local WeatherEffect = {}
    WeatherEffect._index = WeatherEffect
    
    function WeatherEffect:create(rect, strEffectId)
        local table = {}
        setmetatable(table, self)
        table.handle = AddWeatherEffect(rect.handle, FourCC(strEffectId))
        table._isEnabled = true
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
        self._isEnabled = boolEnable
        EnableWeatherEffect(effect, boolEnable)
    end
    
    function WeatherEffect:getTypeId()
        return self._typeId
    end
    
    return WeatherEffect
end
__modules["weathereffect"] = {initialized = false, cached = nil, loader = __module_9}
local function __module_10()
    local WeatherEffect = require("weathereffect")
    local Rect = require("rect")
    local MethodHooker = require("methodhooker")
    
    
    local hooks = MethodHooker:create()
    
    function hooks:moveTo()
        local effect = self._weatherEffect
        local typeId = effect:getTypeId()
        effect:destroy()
        self._weatherEffect = WeatherEffect:create(self, typeId)
    end
    hooks.set = hooks.moveTo
    
    function hooks:destroy(returnValue)
        self:removeWeather()
    end
    
    
    function Rect:addWeather(strWeatherId)
        if not self._weatherEffect then
            self._weatherEffect = WeatherEffect:create(self.handle, strWeatherId)
            hooks:hookAfter(self)
        end
    end
    
    function Rect:changeWeather(strWeatherId)
        local effect = self._weatherEffect
    
        if effect then
            self._weatherEffect:destroy()
            self._weatherEffect = WeatherEffect:create(self.handle, strWeatherId)
        end
    end
    
    function Rect:removeWeather()
        local effect = self._weatherEffect
    
        if effect then
            hooks:unhookAfter(self)
            effect:destroy()
            self._weatherEffect = nil
        end
    end
end
__modules["UserDefinedRects.rectWeather"] = {initialized = false, cached = nil, loader = __module_10}
local function __module_11()
    local MethodHooker = require("methodhooker")
    
    local Region = MethodHooker.hookableMetatable()
    
    
    function Region:create()
        local table = {}
        setmetatable(table, self)
        table.handle = CreateRegion()
        return table
    end
    
    
    function Region:addRect(rect)
        RegionAddRect(self.handle, rect.handle)
    end
    function Region:clearRect(rect)
        RegionClearRect(self.handle, rect.handle)
    end
    
    function Region:addCell(x, y)
        RegionAddCell(self.handle, x, y)
    end
    function Region:clearCell(x, y)
        RegionClearCell(self.handle, x, y)
    end
    
    
    return Region
end
__modules["region"] = {initialized = false, cached = nil, loader = __module_11}
local function __module_12()
    local Rect = require("rect")
    local Region = require("region")
    
    --  Za Warudo should be empty.
    local metaWorld     = {}
    --World               = makeReadonly(metaWorld, 'World')
    
    ceres.addHook("main::before", function()
        metaWorld.RECT      = Rect:fromWorldBounds()
        metaWorld.REGION       = Region:create()
    
        metaWorld.MAX_X     = metaWorld.RECT.maxX
        metaWorld.MAX_Y     = metaWorld.RECT.maxY
        metaWorld.MIN_X     = metaWorld.RECT.minX
        metaWorld.MIN_Y     = metaWorld.RECT.minY
    
        metaWorld.REGION:addRect(metaWorld.RECT)
    end)
    
    return metaWorld
end
__modules["worldbounds"] = {initialized = false, cached = nil, loader = __module_12}
local function __module_13()
    local GenericUnitEvent = require("unitevents.generic")
    local worldbounds = require("worldbounds")
    local Unit = require("unit")
    
    local onEnterMapFuncs = {}
    
    local function OnEnterMap()
        for _,func in ipairs(onEnterMapFuncs) do
            pcall(func, Unit:wrap(GetFilterUnit()))
        end
        return false
    end
    
    function GenericUnitEvent:onEnterMap(callback)
        table.insert(onEnterMapFuncs, callback)
    end
    
    
    ceres.addHook('main::after', function()
        TriggerRegisterEnterRegion(CreateTrigger(), worldbounds.REGION.handle, Filter(OnEnterMap))
    end)
end
__modules["unitevents.generic.entermap"] = {initialized = false, cached = nil, loader = __module_13}
local function __module_14()
    local Abilities = require("abilities")
    local Rect = require("rect")
    require("UserDefinedRects.rectLightning")
    require("UserDefinedRects.rectWeather")
    
    local Event = require("unitevents.generic")
    require("unitevents.generic.entermap")
    
    local MethodHooker = require("methodhooker")
    local Unit = require("unit")
    
    
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
    
    Abilities:get(ABILS.PAGE_NEXT):onEffect(function(_, trigU)
        local currentPage = GetUnitCurrentPage(trigU)
    
        for _,abil in ipairs(PAGES[currentPage]) do
            trigU:removeAbility(abil)
        end
        for _,abil in ipairs(PAGES[currentPage%#PAGES + 1]) do
            trigU:addAbility(abil)
        end
    end)
    
    Abilities:get(ABILS.PAGE_PREV):onEffect(function(_, trigU)
        local currentPage = GetUnitCurrentPage(trigU)
    
        for _,abil in ipairs(PAGES[currentPage]) do
            trigU:removeAbility(abil)
        end
        for _,abil in ipairs(PAGES[(currentPage - 2)%#PAGES + 1]) do
            trigU:addAbility(abil)
        end
    end)
    
    Abilities:get(ABILS.CREATE_OR_DESTROY):onEffect(function(_, trigU)
        if trigU:hasAttachedRect() then
            trigU:destroyAttachedRect()
        else
            trigU:createAttachedRect()
        end
    end)
    
    Abilities:get(ABILS.MOVE):onEffect(function (_,trigU, target)
        print(target.getX())
        trigU:setPosition(target:getX(), target:getY())
    end)
    
    Abilities:get(ABILS.EXPAND_X):onEffect(function (_, trigU)
        local rect = trigU._attachedRect
        if rect then
            rect:setWidth(trigU._attachedRect:getWidth() + 64)
        end
    end)
    
    Abilities:get(ABILS.RETRACT_X):onEffect(function (_, trigU)
        local rect = trigU._attachedRect
        if rect then
            rect:setWidth(trigU._attachedRect:getWidth() - 64)
        end
    end)
    
    Abilities:get(ABILS.EXPAND_Y):onEffect(function (_, trigU)
        local rect = trigU._attachedRect
        if rect then
            rect:setHeight(trigU._attachedRect:getHeight() + 64)
        end
    end)
    
    Abilities:get(ABILS.RETRACT_Y):onEffect(function (_, trigU)
        local rect = trigU._attachedRect
        if rect then
            rect:setHeight(trigU._attachedRect:getHeight() - 64)
        end
    end)
    
    
    
    -- Remove Aatk and Amov on enter map, add first page of abilities
    ceres.addHook('main::after', function()
        Event:onEnterMap(function(trigU)
            trigU:removeAbility('Amov')
            trigU:removeAbility('Aatk')
            for _,abil in ipairs(PAGES[1]) do
                print(abil)
                trigU:addAbility(abil)
            end
        end)
    end)
    
    -- --------------------------------
    -- Possibly subclass Rect?
    
    -- --------------------------------
    local hooks = MethodHooker:create()
    
    local function updatePosition(unitGenerator)
        unitGenerator._attachedRect:moveTo(unitGenerator:getX(), unitGenerator:getY())
    end
    
    function Unit:createAttachedRect()
        if not self._attachedRect then
            local rect = Rect:create(0,0,64,64)
            rect:addLightning()
            rect:addWeather('RAhr')
            self._attachedRect = rect
            updatePosition(self)
            hooks:hookAfter(self)
        end
    end
    
    function Unit:destroyAttachedRect()
        if self._attachedRect then
            hooks:unhookAfter(self)
            self._attachedRect:destroy()
            self._attachedRect = nil
        end
    end
    
    function Unit:hasAttachedRect()
        if self._attachedRect then return true else return false end
    end
    
    hooks.setX = updatePosition
    hooks.setY = updatePosition
    hooks.setPosition = updatePosition
    
    
end
__modules["UserDefinedRects.rectGenerator"] = {initialized = false, cached = nil, loader = __module_14}
local function __module_15()
    --require("userDefinedRects")
    --local Group = require("group")
    local Unit = require("unit")
    local Player = require("player")
    local Rect = require("rect")
    --require('rectLightning')
    require("abilities")
    require("UserDefinedRects.rectGenerator")
    
    
    
    
    
    
    
    local function a()
        local trig = CreateTrigger()
        TriggerRegisterPlayerChatEvent(trig, Player:fromId(0).handle, "-rect", true)
        TriggerAddAction(trig, function()
            print(1)
            local u = Unit:create(Player:fromId(0), FourCC('udr0'), 0., 0., 270.)
            print(2, u)
    
        end)
    end
    
    ceres.addHook("main::after",  a)
end
__modules["main"] = {initialized = false, cached = nil, loader = __module_15}

-- ceres post-script start

ceres.__oldMain = main
ceres.__oldConfig = config

function main()
    __ceresMain()
end

function config()
    __ceresConfig()
end

ceres.catch(require("main"))

-- ceres post-script end
