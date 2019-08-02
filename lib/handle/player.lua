player = {}

local User = Player
local Player = {}
Player.__index = Player
player.metatable = Player

function player.fromId(id)
    local table = {}
    setmetatable(table, Player)
    table.handle = User(id)
    return table
end