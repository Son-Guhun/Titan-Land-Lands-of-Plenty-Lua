local commands = require('Commands.command')


commands.registerCommand('-start', commands.ACCESS_USER, function(trigPlayer, command, args)
    unit.create(trigPlayer, 'e000', 0., 0., 270.)
end)