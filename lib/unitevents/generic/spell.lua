require('unitevents.generic._table')
require('handle.unit')

-- TODO: Cache target of spellId after first cast. For Channel spells, check their special fields.

local onSpellCastFuncs = {}

function OnSpellCast()

    local target = unit.wrap(GetSpellTargetUnit())

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
        local b, e = pcall(func, GetSpellAbilityId(), unit.wrap(GetTriggerUnit()), target)
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

function unitevents.generic:onSpellChannel(callback)
   onSpell(EVENT_PLAYER_UNIT_SPELL_CHANNEL, callback)
end

function unitevents.generic:onSpellCast(callback)
    onSpell(EVENT_PLAYER_UNIT_SPELL_CAST, callback)
end

function unitevents.generic:onSpellEffect(callback)
    onSpell(EVENT_PLAYER_UNIT_SPELL_EFFECT, callback)
end

function unitevents.generic:onSpellFinish(callback)
    onSpell(EVENT_PLAYER_UNIT_SPELL_FINISH, callback)
end
function unitevents.generic:onSpellEndCast(callback)
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