require('stdlib')

commands = {}
commands.ACCESS_USER = 1
commands.ACCESS_TITAN = 2

local COMMANDS = {}


function commands.registerCommand(str, access, callback)

    if not COMMANDS[str] then
        COMMANDS[str] = callback
    end
end


local function onChatMessage()
    local trigPlayer = player.wrap(GetTriggerPlayer())
    local chatMsg = GetEventPlayerChatString()
    
    local index = string.find(chatMsg, '%s+')
    local command
    local args
    if index and index < #chatMsg then
        command = string.sub(chatMsg, 1, index-1)
        args = string.sub(chatMsg, index+1, #chatMsg)
    else
        command = chatMsg
    end

    local callback = COMMANDS[command]
    if callback then
        callback(player, command, args)
    else
        trigPlayer:displayText('Unrecognized command: ' .. command)
    end
end


ceres.addHook('main::after', function()
    local trig = CreateTrigger()

    for i=0,bj_MAX_PLAYERS - 1 do
        if GetPlayerController(Player(i)) == MAP_CONTROL_USER then
            TriggerRegisterPlayerChatEvent(trig, Player(i), "'", false)
            TriggerRegisterPlayerChatEvent(trig, Player(i), "-", false)
        end
    end
    TriggerAddCondition(trig, Condition(onChatMessage))
end)

commands.registerCommand('-show', 0, function() print("AAAA") end)