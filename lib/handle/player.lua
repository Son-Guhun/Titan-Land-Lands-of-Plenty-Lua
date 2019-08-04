player = {}

local User = Player
local Player = {}
Player.__index = Player
player.metatable = Player

local allPlayerSlots = {}
local allPlayers = {}

for id=0,bj_MAX_PLAYER_SLOTS-1 do
    local p = {}
    setmetatable(p, Player)
    p.handle = User(id)
    allPlayerSlots[id] = p
    if id < bj_MAX_PLAYERS then allPlayers[id] = p end
end

function player.wrap(whichPlayer)
    return allPlayerSlots[GetPlayerId(whichPlayer)]
end

function player.fromId(id)
    return allPlayerSlots[id]
end

function player.iterAllSlots()
    return ipairs(allPlayerSlots)
end

function player.iterAll()
    return ipairs(allPlayers)
end

local localPlayer = nil
function player.getLocal() return localPlayer end
ceres.addHook('main::after', function() localPlayer = GetLocalPlayer() end)

function Player:displayTextEx(x, y, ...)
    local sb={}
    for i=1,select('#', ...)do
        sb[i] = tostring(select(i, ...))
    end
    DisplayTextToPlayer(self.handle, 0., 0., table.concat(sb, '    '))
end

function Player:displayText(...)
    self:displayTextEx(0., 0., ...)
end