local commands = require('Commands.command')
require('unitvisuals')

local filters = {}

function filters.ownedByPlayer(whichPlayer)
    return function(u) return u:getOwner() == whichPlayer end
end

function filters.accessibleByPlayer(whichPlayer)
    local accessLevel = whichPlayer.accessLevel
    return function(u) return u:getOwner().accessLevel < accessLevel end
end

commands.registerCommand("'size", commands.ACCESS_USER, function(trigP, cmd, args)
    for u,_ in pairs(unit.enumSelected(trigP, filters.ownedByPlayer(trigP))) do
        u:setCustomScale(tonumber(args)/100.)
    end
end)

commands.registerCommand("'speed", commands.ACCESS_USER, function(trigP, cmd, args)
    for u,_ in pairs(unit.enumSelected(trigP, filters.ownedByPlayer(trigP))) do
        u:setCustomTimeScale(tonumber(args)/100.)
    end
end)

commands.registerCommand("-tag", commands.ACCESS_USER, function(trigP, cmd, args)
    for u,_ in pairs(unit.enumSelected(trigP, filters.ownedByPlayer(trigP))) do
        u:setCustomAnimationProperties(args)
    end
end)