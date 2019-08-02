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