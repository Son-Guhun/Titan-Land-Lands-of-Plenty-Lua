require('stdlib')
local decobuilders = require('LoP.decobuilders')
require('Commands.command')


commands.registerCommand('-decos', commands.ACCESS_USER, function(trigPlayer, command, args)
    for name,array in pairs(decobuilders.typeIds) do
        for _,id in ipairs(array) do
            print(name, id)
            unit.create(trigPlayer, id, 0., 0., 270.)
        end
    end
end)