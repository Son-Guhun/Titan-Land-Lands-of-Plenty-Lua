player = {}

local User = Player
local Player = {}
Player.__index = Player
player.metatable = Player

allPlayers = {}

for id=0,bj_MAX_PLAYER_SLOTS-1 do
    local p = {}
    setmetatable(p, Player)
    p.handle = User(id)
    allPlayers[id] = p
end

function player.wrap(whichPlayer)
    return allPlayers[GetPlayerId(whichPlayer)]
end

function player.fromId(id)
    return allPlayers[id]
end

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