player = {}

local User = Player
---@class Player
local Player = {}
Player.__index = Player
player.metatable = Player

local allPlayerSlots = {}

local iterAllSlots ={}
local iterAll = {}

for id=0,bj_MAX_PLAYER_SLOTS-1 do
    local p = {}
    setmetatable(p, Player)
    p.handle = User(id)
    p._handleId = id
    allPlayerSlots[id] = p
    iterAllSlots[id+1] = p
    if id < bj_MAX_PLAYERS then iterAll[id+1] = p end
end

function player.wrap(whichPlayer)
    return allPlayerSlots[GetPlayerId(whichPlayer)]
end

--- Returns the player table with a certain id. A player id is their number-1.
function player.fromId(id)
    return allPlayerSlots[id]
end

--- Returns the player table with a certain number. A player number is their id+1.
function player.fromNumber(number)
    return allPlayerSlots[number-1]
end

--- Returns an (i,p) iterator over all player slots (1-28), where i is the player number (id+1) and p is the player table.
function player.iterAllSlots()
    return ipairs(iterAllSlots)
end

--- Returns an (i,p) iterator over all player slots (1-24), where i is the player number (id+1) and p is the player table.
function player.iterAll()
    return ipairs(iterAll)
end

--- Holds the local player. Initialized after the main function
local localPlayer = nil

--- Returns the player running the local client. This function can only be called after the 'main' function is executed.
-- @return the local client player
function player.getLocal() return localPlayer end
ceres.addHook('main::after', function() localPlayer = GetLocalPlayer() end)


--- Returns the handle id of the player.
function Player:getId()
    return self._handleId
end

--- Returns 1 + the handle id of the player.
function Player:getNumber()
    return self._handleId + 1
end

--- As print(...), but only displays the message the player instance.
function Player:displayTextEx(x, y, ...)
    local sb={}
    for i=1,select('#', ...)do
        sb[i] = tostring(select(i, ...))
    end
    DisplayTextToPlayer(self.handle, 0., 0., table.concat(sb, '    '))
end

--- As print(...), but only displays the message the player instance.
function Player:displayText(...)
    self:displayTextEx(0., 0., ...)
end