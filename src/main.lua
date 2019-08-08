require('stdlib')
require('UserDefinedRects.rectGenerator')
require('Commands.command')

decobuilders = require('LoP.decobuilders')

local decoTentsInitFunc = require('Init.decotents')

require('Commands.Player.decos')
require('Commands.Player.deleteme')

require('multipatrol.addons.automatic')

require('Commands.Decoration.visuals')
require('Commands.Player.start')

local function a()
    for i,p in player.iterAll() do
        local udg_temp_player = p.handle
        CreateFogModifierRectBJ( true, udg_temp_player, FOG_OF_WAR_VISIBLE,  GetPlayableMapRect())
        SetPlayerAbilityAvailableBJ( false, FourCC('Apos'), udg_temp_player )
        SetPlayerAbilityAvailableBJ( false, FourCC('Aps2'), udg_temp_player )
        SetPlayerAbilityAvailableBJ( false, FourCC('ACps'), udg_temp_player )
        SetPlayerAbilityAvailableBJ( false, FourCC('Ashm'), udg_temp_player )
        SetPlayerAbilityAvailableBJ( false, FourCC('Ahid'), udg_temp_player )
        SetPlayerAbilityAvailableBJ( false, FourCC('Sshm'), udg_temp_player )
        SetPlayerHandicapXPBJ( udg_temp_player, 0.00 )
        AdjustPlayerStateBJ( 1000000000, udg_temp_player, PLAYER_STATE_RESOURCE_GOLD )
        AdjustPlayerStateBJ( 1000000000, udg_temp_player, PLAYER_STATE_RESOURCE_LUMBER )
        SetPlayerMaxHeroesAllowed( -1, udg_temp_player )
    end
end

ceres.addHook("main::after",  a)

commands.registerCommand('-tents', 0, decoTentsInitFunc)
commands.registerCommand('-rect', commands.ACCESS_USER, function()
    local u = unit.create(player.fromId(0), 'udr0', 0., 0., 270.)
end)
commands.registerCommand('-test', 0, function(trigPlayer)
    for u,_ in pairs(unit.enumSelected(trigPlayer)) do
        u:createPatrolPath(u:getX(), u:getY(), 0., 0.)
    end
end)