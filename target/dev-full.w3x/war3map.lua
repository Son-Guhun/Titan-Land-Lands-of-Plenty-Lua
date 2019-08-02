-- ceres header start

local ceres = {
}

local __ceres_hooks = {
    ["main::before"] = {},
    ["main::after"] = {},
    ["config::before"] = {},
    ["config::after"] = {}
}

local function __ceres_hookCall(hookName)
    for _, callback in pairs(__ceres_hooks[hookName]) do
        callback()
    end
end

local __ceres_customMain = nil
local __ceres_customConfig = nil

local function __ceresMain()
    __ceres_hookCall("main::before")
    if __ceres_customMain ~= nil then
        __ceres_customMain()
    else
        ceres.__oldMain()
    end
    __ceres_hookCall("main::after")
end

local function __ceresConfig()
    __ceres_hookCall("config::before")
    if __ceres_customConfig ~= nil then
        __ceres_customConfig()
    else
        ceres.__oldConfig()
    end
    __ceres_hookCall("config::after")
end

function ceres.addHook(hookName, callback)
    table.insert(__ceres_hooks[hookName], ceres.wrapCatch(callback))
end

function ceres.setMain(callback)
    __ceres_customMain = callback
end

function ceres.setConfig(callback)
    __ceres_customConfig = callback
end

function ceres.catch(callback, ...)
    local success, err = pcall(callback, ...)

    if not success then
        print(err)
    end
end

function ceres.wrapCatch(callback)
    return function(...)
        ceres.catch(callback, ...)
    end
end

local __modules = {}

require = function(name)
    local module = __modules[name]

    if module ~= nil then
        if module.initialized then
            return module.cached
        else
            module.initialized = true
            module.cached = module.loader()
            return module.cached
        end
    else
        error("module not found")
    end
end

-- ceres header end
gg_rct_GiveTo_Blue = nil
gg_rct_GiveTo_Teal = nil
gg_rct_GiveTo_Brown = nil
gg_rct_GiveTo_Purple = nil
gg_rct_GiveTo_Yellow = nil
gg_rct_GiveTo_Orange = nil
gg_rct_GiveTo_Green = nil
gg_rct_GiveTo_Pink = nil
gg_rct_GiveTo_Gray = nil
gg_rct_GiveTo_Light_Blue = nil
gg_rct_GiveTo_Dark_Green = nil
gg_rct_WarpIn = nil
gg_rct_DoorTreasureA = nil
gg_rct_DoorTreasureB = nil
gg_rct_DoorTitanB = nil
gg_rct_DoorTitanA = nil
gg_rct_DoorIceTitan = nil
gg_rct_WaygateRed = nil
gg_rct_WaygateBlue = nil
gg_rct_Titan_Palace = nil
gg_rct_Region_019 = nil
gg_rct_Titan_Palace_Inner = nil
gg_rct_Titan_Palace_Inner_Entrance = nil
gg_rct_Patrol_System_Range = nil
gg_rct_Deco_Tents_Rect = nil
gg_rct_GiveTo_Maroon = nil
gg_rct_GiveTo_Navy = nil
gg_rct_GiveTo_Emerald = nil
gg_rct_GiveTo_Turquoise = nil
gg_rct_GiveTo_Violet = nil
gg_rct_GiveTo_Peach = nil
gg_rct_GiveTo_Mint = nil
gg_rct_GiveTo_Lavender = nil
gg_rct_GiveTo_Coal = nil
gg_rct_GiveTo_Snow = nil
gg_rct_GiveTo_Wheat = nil
gg_rct_GiveTo_Peanut = nil
gg_cam_Camera_001 = nil
gg_snd_StopTimeTicTac = nil
gg_snd_RiflemanAttack1 = nil
gg_unit_e00D_0409 = nil
gg_unit_e00C_0408 = nil
gg_unit_e009_0407 = nil
gg_unit_e008_0406 = nil
gg_unit_H00V_0359 = nil
gg_unit_H00S_0141 = nil
gg_unit_e00A_0411 = nil
gg_unit_e007_0410 = nil
gg_unit_e00B_0405 = nil
gg_dest_ATg1_0003 = nil
gg_dest_ATg3_0004 = nil
function InitGlobals()
end

function InitSounds()
    gg_snd_StopTimeTicTac = CreateSound("Sound\\Interface\\BattleNetTick.wav", false, false, false, 10, 10, "DefaultEAXON")
    SetSoundParamsFromLabel(gg_snd_StopTimeTicTac, "ChatroomTimerTick")
    SetSoundDuration(gg_snd_StopTimeTicTac, 476)
    gg_snd_RiflemanAttack1 = CreateSound("Units\\Human\\Rifleman\\RiflemanAttack1.wav", false, true, true, 10, 10, "MissilesEAX")
    SetSoundParamsFromLabel(gg_snd_RiflemanAttack1, "RiflemanAttack1")
    SetSoundDuration(gg_snd_RiflemanAttack1, 702)
end

function CreateBuildingsForPlayer0()
    local p = Player(0)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("nct2"), -27872.0, 25440.0, 270.000)
    u = CreateUnit(p, FourCC("nfr2"), -27072.0, 24960.0, 270.000)
    u = CreateUnit(p, FourCC("nwgt"), -22784.0, 22912.0, 270.000)
    WaygateSetDestination(u, GetRectCenterX(gg_rct_WaygateRed), GetRectCenterY(gg_rct_WaygateRed))
    WaygateActivate(u, true)
    SetUnitColor(u, ConvertPlayerColor(0))
    u = CreateUnit(p, FourCC("nct1"), -27872.0, 25696.0, 270.000)
    u = CreateUnit(p, FourCC("nth1"), -26144.0, 25888.0, 270.000)
    u = CreateUnit(p, FourCC("nth0"), -26432.0, 25984.0, 270.000)
    u = CreateUnit(p, FourCC("ngt2"), -27872.0, 25184.0, 270.000)
    u = CreateUnit(p, FourCC("nfh1"), -26400.0, 25760.0, 270.000)
    u = CreateUnit(p, FourCC("ndh0"), -27392.0, 25984.0, 270.000)
    u = CreateUnit(p, FourCC("nmh0"), -27808.0, 24992.0, 270.000)
    u = CreateUnit(p, FourCC("nmh1"), -27616.0, 25952.0, 270.000)
    u = CreateUnit(p, FourCC("nnzg"), -27104.0, 25952.0, 270.000)
    u = CreateUnit(p, FourCC("ndch"), -27904.0, 25984.0, 270.000)
    u = CreateUnit(p, FourCC("nhns"), -27584.0, 25344.0, 270.000)
    u = CreateUnit(p, FourCC("ndh1"), -27008.0, 25536.0, 270.000)
    u = CreateUnit(p, FourCC("ngnh"), -27296.0, 25056.0, 270.000)
    u = CreateUnit(p, FourCC("ncnt"), -27552.0, 25056.0, 270.000)
    u = CreateUnit(p, FourCC("nfh0"), -27008.0, 25216.0, 270.000)
    u = CreateUnit(p, FourCC("nwgt"), -23552.0, 22912.0, 270.000)
    WaygateSetDestination(u, GetRectCenterX(gg_rct_WaygateBlue), GetRectCenterY(gg_rct_WaygateBlue))
    WaygateActivate(u, true)
    SetUnitColor(u, ConvertPlayerColor(1))
end

function CreateUnitsForPlayer0()
    local p = Player(0)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("ngnw"), -25483.2, 27995.1, 265.330)
    u = CreateUnit(p, FourCC("h04K"), -25056.4, 27617.0, 276.611)
    u = CreateUnit(p, FourCC("h04I"), -25208.7, 27604.7, 184.345)
    u = CreateUnit(p, FourCC("ngns"), -25753.2, 27884.4, 279.039)
    u = CreateUnit(p, FourCC("ngna"), -25646.3, 27926.9, 295.131)
    u = CreateUnit(p, FourCC("ngnb"), -25592.2, 27717.5, 263.813)
    u = CreateUnit(p, FourCC("ngnv"), -25459.0, 27750.2, 270.943)
    u = CreateUnit(p, FourCC("ngno"), -25670.2, 27721.3, 268.734)
    u = CreateUnit(p, FourCC("H00V"), -26815.8, 26960.7, 301.444)
    SetUnitColor(u, ConvertPlayerColor(3))
    u = CreateUnit(p, FourCC("e00B"), -27924.4, 28020.3, 182.390)
    SetUnitColor(u, ConvertPlayerColor(3))
    u = CreateUnit(p, FourCC("e008"), -27614.2, 28022.1, 288.477)
    SetUnitColor(u, ConvertPlayerColor(2))
    u = CreateUnit(p, FourCC("e009"), -27777.5, 28016.9, 238.202)
    u = CreateUnit(p, FourCC("e00C"), -27782.4, 27745.5, 211.933)
    u = CreateUnit(p, FourCC("e00D"), -27782.1, 27878.2, 139.399)
    u = CreateUnit(p, FourCC("e007"), -27622.4, 27760.2, 219.481)
    SetUnitColor(u, ConvertPlayerColor(2))
    u = CreateUnit(p, FourCC("e00A"), -27934.5, 27746.3, 54.703)
    SetUnitColor(u, ConvertPlayerColor(7))
    u = CreateUnit(p, FourCC("u00I"), -27373.8, 25385.8, 52.846)
end

function CreateBuildingsForPlayer1()
    local p = Player(1)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -24000.0, 24064.0, 270.000)
end

function CreateBuildingsForPlayer2()
    local p = Player(2)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -24384.0, 24064.0, 270.000)
end

function CreateBuildingsForPlayer3()
    local p = Player(3)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -24768.0, 24064.0, 270.000)
end

function CreateBuildingsForPlayer4()
    local p = Player(4)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -25152.0, 24064.0, 270.000)
end

function CreateBuildingsForPlayer5()
    local p = Player(5)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("nfr1"), -27648.0, 25728.0, 270.000)
    u = CreateUnit(p, FourCC("n000"), -25536.0, 24064.0, 270.000)
end

function CreateBuildingsForPlayer6()
    local p = Player(6)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -25920.0, 24064.0, 270.000)
end

function CreateBuildingsForPlayer7()
    local p = Player(7)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -26304.0, 24064.0, 270.000)
end

function CreateBuildingsForPlayer8()
    local p = Player(8)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -26688.0, 24064.0, 270.000)
end

function CreateBuildingsForPlayer9()
    local p = Player(9)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -27072.0, 24064.0, 270.000)
end

function CreateBuildingsForPlayer10()
    local p = Player(10)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -27456.0, 24064.0, 270.000)
end

function CreateBuildingsForPlayer11()
    local p = Player(11)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -27840.0, 24064.0, 270.000)
end

function CreateBuildingsForPlayer12()
    local p = Player(12)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -24000.0, 22848.0, 270.000)
end

function CreateBuildingsForPlayer13()
    local p = Player(13)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -24384.0, 22848.0, 270.000)
end

function CreateBuildingsForPlayer14()
    local p = Player(14)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -24768.0, 22848.0, 270.000)
end

function CreateBuildingsForPlayer15()
    local p = Player(15)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -25152.0, 22848.0, 270.000)
end

function CreateBuildingsForPlayer16()
    local p = Player(16)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -25536.0, 22848.0, 270.000)
end

function CreateBuildingsForPlayer17()
    local p = Player(17)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -25920.0, 22848.0, 270.000)
end

function CreateBuildingsForPlayer18()
    local p = Player(18)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -26304.0, 22848.0, 270.000)
end

function CreateBuildingsForPlayer19()
    local p = Player(19)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -26688.0, 22848.0, 270.000)
end

function CreateBuildingsForPlayer20()
    local p = Player(20)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -27072.0, 22848.0, 270.000)
end

function CreateBuildingsForPlayer21()
    local p = Player(21)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -27456.0, 22848.0, 270.000)
end

function CreateBuildingsForPlayer22()
    local p = Player(22)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -27840.0, 22848.0, 270.000)
end

function CreateBuildingsForPlayer23()
    local p = Player(23)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -28288.0, 23488.0, 270.000)
end

function CreateNeutralPassiveBuildings()
    local p = Player(PLAYER_NEUTRAL_PASSIVE)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n02W"), -25664.0, 26240.0, 270.000)
    u = CreateUnit(p, FourCC("n02Z"), -22784.0, 25408.0, 270.000)
    u = CreateUnit(p, FourCC("n02V"), -25856.0, 25984.0, 270.000)
    u = CreateUnit(p, FourCC("n02X"), -25920.0, 25664.0, 270.000)
    u = CreateUnit(p, FourCC("n02J"), -22784.0, 26496.0, 270.000)
    u = CreateUnit(p, FourCC("u00K"), -768.0, -13888.0, 270.000)
    u = CreateUnit(p, FourCC("nshp"), 8576.0, 6528.0, 270.000)
    u = CreateUnit(p, FourCC("nshp"), -3328.0, 5376.0, 270.000)
    u = CreateUnit(p, FourCC("nshp"), -3712.0, -1664.0, 270.000)
    u = CreateUnit(p, FourCC("nshp"), 1920.0, -192.0, 270.000)
    u = CreateUnit(p, FourCC("n00Z"), -23744.0, 26880.0, 270.000)
    u = CreateUnit(p, FourCC("n03T"), -23424.0, 27200.0, 270.000)
    u = CreateUnit(p, FourCC("n03U"), -23936.0, 25792.0, 270.000)
    u = CreateUnit(p, FourCC("n02R"), -23360.0, 26176.0, 270.000)
    u = CreateUnit(p, FourCC("n02R"), -23360.0, 24768.0, 270.000)
    u = CreateUnit(p, FourCC("n02R"), -23360.0, 26816.0, 270.000)
    u = CreateUnit(p, FourCC("n03A"), -22976.0, 26880.0, 270.000)
    u = CreateUnit(p, FourCC("n015"), -23296.0, 25280.0, 270.000)
    u = CreateUnit(p, FourCC("n00R"), -23168.0, 25280.0, 270.000)
    u = CreateUnit(p, FourCC("n02P"), -23936.0, 26496.0, 270.000)
    u = CreateUnit(p, FourCC("n00S"), -22784.0, 26240.0, 270.000)
    u = CreateUnit(p, FourCC("n00X"), -23936.0, 26368.0, 270.000)
    u = CreateUnit(p, FourCC("n00O"), -23936.0, 25600.0, 270.000)
    u = CreateUnit(p, FourCC("n014"), -23872.0, 26880.0, 270.000)
    u = CreateUnit(p, FourCC("ndrk"), -23808.0, 27264.0, 270.000)
    u = CreateUnit(p, FourCC("n03D"), -22912.0, 25280.0, 270.000)
    u = CreateUnit(p, FourCC("ngme"), -23296.0, 25024.0, 270.000)
    u = CreateUnit(p, FourCC("n02I"), -23680.0, 27008.0, 270.000)
    u = CreateUnit(p, FourCC("n02U"), -23040.0, 27008.0, 270.000)
    u = CreateUnit(p, FourCC("n00P"), -23744.0, 25344.0, 270.000)
    u = CreateUnit(p, FourCC("n02C"), -23936.0, 26048.0, 270.000)
    u = CreateUnit(p, FourCC("n02L"), -23424.0, 25280.0, 270.000)
    u = CreateUnit(p, FourCC("n00D"), -23616.0, 25344.0, 270.000)
    u = CreateUnit(p, FourCC("n00W"), -23936.0, 26752.0, 270.000)
    u = CreateUnit(p, FourCC("n02K"), -22784.0, 25792.0, 270.000)
    u = CreateUnit(p, FourCC("n006"), -22784.0, 26048.0, 270.000)
    u = CreateUnit(p, FourCC("n010"), -23552.0, 27136.0, 270.000)
    u = CreateUnit(p, FourCC("n005"), -23936.0, 26240.0, 270.000)
    u = CreateUnit(p, FourCC("n00H"), -23936.0, 26624.0, 270.000)
    u = CreateUnit(p, FourCC("ndrg"), -22912.0, 28032.0, 270.000)
    u = CreateUnit(p, FourCC("n00C"), -22784.0, 26624.0, 270.000)
    u = CreateUnit(p, FourCC("n00E"), -23168.0, 27136.0, 270.000)
    u = CreateUnit(p, FourCC("ndru"), -23808.0, 27648.0, 270.000)
    u = CreateUnit(p, FourCC("ndrz"), -22912.0, 27264.0, 270.000)
    u = CreateUnit(p, FourCC("ndro"), -23808.0, 28032.0, 270.000)
    u = CreateUnit(p, FourCC("ndrr"), -22912.0, 27648.0, 270.000)
    u = CreateUnit(p, FourCC("n00N"), -22784.0, 25664.0, 270.000)
    u = CreateUnit(p, FourCC("n00Q"), -23936.0, 25408.0, 270.000)
    u = CreateUnit(p, FourCC("n00G"), -22784.0, 26752.0, 270.000)
    u = CreateUnit(p, FourCC("n030"), -22784.0, 25920.0, 270.000)
    u = CreateUnit(p, FourCC("n033"), -22784.0, 25280.0, 270.000)
    u = CreateUnit(p, FourCC("n034"), -22784.0, 25536.0, 270.000)
    u = CreateUnit(p, FourCC("n038"), -22848.0, 26880.0, 270.000)
    u = CreateUnit(p, FourCC("n02Q"), -23296.0, 27200.0, 270.000)
    u = CreateUnit(p, FourCC("n03K"), -22784.0, 26368.0, 270.000)
    u = CreateUnit(p, FourCC("nmgv"), -25792.0, 26560.0, 270.000)
    u = CreateUnit(p, FourCC("ntav"), -23296.0, 23808.0, 270.000)
    SetUnitColor(u, ConvertPlayerColor(0))
    u = CreateUnit(p, FourCC("u00K"), -768.0, -13568.0, 270.000)
    u = CreateUnit(p, FourCC("u00K"), -768.0, -13760.0, 270.000)
    u = CreateUnit(p, FourCC("u00K"), -768.0, -14144.0, 270.000)
    u = CreateUnit(p, FourCC("u00K"), -768.0, -14016.0, 270.000)
end

function CreateNeutralPassive()
    local p = Player(PLAYER_NEUTRAL_PASSIVE)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("nbot"), -3945.6, -1662.5, 97.441)
    u = CreateUnit(p, FourCC("nbot"), 8797.4, 6187.7, 247.584)
    u = CreateUnit(p, FourCC("nbot"), 1796.4, -824.0, 208.955)
    u = CreateUnit(p, FourCC("nbot"), -3240.9, 4887.3, 29.763)
    u = CreateUnit(p, FourCC("Ekgg"), -25163.5, 27943.6, 294.712)
    u = CreateUnit(p, FourCC("Hgam"), -25306.9, 27929.4, 273.447)
    u = CreateUnit(p, FourCC("H060"), -25446.9, 27952.7, 272.054)
    u = CreateUnit(p, FourCC("H00T"), -25771.6, 27564.9, 274.040)
    u = CreateUnit(p, FourCC("h0K8"), -19290.2, 27008.7, 320.382)
    u = CreateUnit(p, FourCC("h0K6"), -20239.0, 26842.0, 355.627)
    u = CreateUnit(p, FourCC("h0K6"), -20831.5, 26509.4, 98.902)
    u = CreateUnit(p, FourCC("h0K9"), -19605.7, 26537.6, 347.292)
    u = CreateUnit(p, FourCC("h0KA"), -19766.6, 27490.3, 66.623)
    u = CreateUnit(p, FourCC("h0K6"), -20202.2, 26208.5, 59.811)
    u = CreateUnit(p, FourCC("h0K6"), -20639.9, 27449.5, 88.750)
    u = CreateUnit(p, FourCC("h0K6"), -18585.2, 27185.6, 346.256)
    u = CreateUnit(p, FourCC("h0K6"), -18743.7, 27921.9, 211.702)
    u = CreateUnit(p, FourCC("h0K6"), -18094.8, 26898.0, 125.523)
    u = CreateUnit(p, FourCC("h0K6"), -20023.4, 28238.1, 260.681)
    u = CreateUnit(p, FourCC("h0KR"), -18581.9, 27188.0, 265.888)
    u = CreateUnit(p, FourCC("h0KR"), -20240.4, 26845.8, 280.127)
    u = CreateUnit(p, FourCC("h0KQ"), -19835.7, 27320.2, 345.542)
    u = CreateUnit(p, FourCC("h0KQ"), -19623.3, 27446.5, 335.829)
    u = CreateUnit(p, FourCC("h0KS"), -20586.0, 26549.8, 60.317)
    u = CreateUnit(p, FourCC("h0KS"), -20417.3, 27841.2, 352.551)
    u = CreateUnit(p, FourCC("h02H"), -18664.9, 27524.4, 353.913)
    u = CreateUnit(p, FourCC("h051"), -19614.2, 26549.8, 129.478)
    u = CreateUnit(p, FourCC("h051"), -19296.0, 26977.2, 295.948)
    u = CreateUnit(p, FourCC("h056"), -18104.0, 26875.2, 98.550)
    u = CreateUnit(p, FourCC("h056"), -18748.8, 27953.7, 317.295)
    u = CreateUnit(p, FourCC("h056"), -20599.0, 26581.5, 270.206)
    u = CreateUnit(p, FourCC("h0KK"), -8855.8, 23264.7, 287.246)
    u = CreateUnit(p, FourCC("h0KK"), -5688.8, 26716.4, 289.356)
    u = CreateUnit(p, FourCC("h0KM"), -7551.5, 23346.5, 328.655)
    u = CreateUnit(p, FourCC("H00S"), -26963.1, 27112.3, 308.790)
    SetUnitColor(u, ConvertPlayerColor(4))
    u = CreateUnit(p, FourCC("h0NZ"), -4887.4, 26321.8, 261.329)
    u = CreateUnit(p, FourCC("h0NZ"), -6469.3, 23255.4, 254.067)
    u = CreateUnit(p, FourCC("h0O1"), -8531.4, 22517.0, 198.046)
    u = CreateUnit(p, FourCC("h0OK"), -9428.0, 21791.4, 61.229)
    u = CreateUnit(p, FourCC("h0OK"), -5431.5, 22942.9, 145.826)
    u = CreateUnit(p, FourCC("h0OL"), -5679.3, 25569.4, 98.539)
    u = CreateUnit(p, FourCC("h0OB"), -5837.1, 25405.1, 186.795)
    u = CreateUnit(p, FourCC("h0OC"), -5652.0, 25412.9, 272.964)
    u = CreateUnit(p, FourCC("h0OE"), -5918.3, 25574.9, 302.507)
    u = CreateUnit(p, FourCC("h06R"), -5001.8, -8971.9, 91.930)
    u = CreateUnit(p, FourCC("h03H"), -4955.2, -9230.8, 119.722)
    u = CreateUnit(p, FourCC("h089"), -5090.6, -9168.8, 67.656)
    u = CreateUnit(p, FourCC("h0BV"), -27275.5, 25677.9, 105.428)
    u = CreateUnit(p, FourCC("h0BW"), -27157.7, 25704.5, 239.169)
    u = CreateUnit(p, FourCC("h0BX"), -27425.3, 25697.5, 267.316)
    u = CreateUnit(p, FourCC("h0BY"), -27039.4, 25724.2, 182.774)
    u = CreateUnit(p, FourCC("h0BD"), -27167.7, 25255.6, 0.000)
    u = CreateUnit(p, FourCC("h0BB"), -27170.5, 25441.5, 270.000)
    u = CreateUnit(p, FourCC("h0BA"), -27383.1, 25448.4, 270.000)
    u = CreateUnit(p, FourCC("h0BC"), -27402.0, 25247.8, 90.000)
end

function CreatePlayerBuildings()
    CreateBuildingsForPlayer0()
    CreateBuildingsForPlayer1()
    CreateBuildingsForPlayer2()
    CreateBuildingsForPlayer3()
    CreateBuildingsForPlayer4()
    CreateBuildingsForPlayer5()
    CreateBuildingsForPlayer6()
    CreateBuildingsForPlayer7()
    CreateBuildingsForPlayer8()
    CreateBuildingsForPlayer9()
    CreateBuildingsForPlayer10()
    CreateBuildingsForPlayer11()
    CreateBuildingsForPlayer12()
    CreateBuildingsForPlayer13()
    CreateBuildingsForPlayer14()
    CreateBuildingsForPlayer15()
    CreateBuildingsForPlayer16()
    CreateBuildingsForPlayer17()
    CreateBuildingsForPlayer18()
    CreateBuildingsForPlayer19()
    CreateBuildingsForPlayer20()
    CreateBuildingsForPlayer21()
    CreateBuildingsForPlayer22()
    CreateBuildingsForPlayer23()
end

function CreatePlayerUnits()
    CreateUnitsForPlayer0()
end

function CreateAllUnits()
    CreateNeutralPassiveBuildings()
    CreatePlayerBuildings()
    CreateNeutralPassive()
    CreatePlayerUnits()
end

function CreateRegions()
    local we
    gg_rct_GiveTo_Blue = Rect(-24096.0, 23968.0, -23904.0, 24160.0)
    gg_rct_GiveTo_Teal = Rect(-24480.0, 23968.0, -24288.0, 24160.0)
    gg_rct_GiveTo_Brown = Rect(-27936.0, 23968.0, -27744.0, 24160.0)
    gg_rct_GiveTo_Purple = Rect(-24864.0, 23968.0, -24672.0, 24160.0)
    gg_rct_GiveTo_Yellow = Rect(-25248.0, 23968.0, -25056.0, 24160.0)
    gg_rct_GiveTo_Orange = Rect(-25632.0, 23968.0, -25440.0, 24160.0)
    gg_rct_GiveTo_Green = Rect(-26016.0, 23968.0, -25824.0, 24160.0)
    gg_rct_GiveTo_Pink = Rect(-26400.0, 23968.0, -26208.0, 24160.0)
    gg_rct_GiveTo_Gray = Rect(-26784.0, 23968.0, -26592.0, 24160.0)
    gg_rct_GiveTo_Light_Blue = Rect(-27168.0, 23968.0, -26976.0, 24160.0)
    gg_rct_GiveTo_Dark_Green = Rect(-27552.0, 23968.0, -27360.0, 24160.0)
    gg_rct_WarpIn = Rect(-23296.0, 22912.0, -23168.0, 23040.0)
    gg_rct_DoorTreasureA = Rect(-25728.0, 26944.0, -25216.0, 27328.0)
    gg_rct_DoorTreasureB = Rect(-25728.0, 26432.0, -25216.0, 26816.0)
    gg_rct_DoorTitanB = Rect(-27008.0, 26048.0, -26496.0, 26432.0)
    gg_rct_DoorTitanA = Rect(-26304.0, 26624.0, -25920.0, 27136.0)
    gg_rct_DoorIceTitan = Rect(-24256.0, 26624.0, -23872.0, 27136.0)
    gg_rct_WaygateRed = Rect(7328.0, -2784.0, 7840.0, -2272.0)
    gg_rct_WaygateBlue = Rect(-8416.0, -7328.0, -7904.0, -6816.0)
    gg_rct_Titan_Palace = Rect(-29152.0, 22240.0, -22368.0, 28384.0)
    gg_rct_Region_019 = Rect(-1024.0, -14336.0, -736.0, -13184.0)
    gg_rct_Titan_Palace_Inner = Rect(-29152.0, 24800.0, -24672.0, 28320.0)
    gg_rct_Titan_Palace_Inner_Entrance = Rect(-24160.0, 24832.0, -24032.0, 25088.0)
    gg_rct_Patrol_System_Range = Rect(-5728.0, 1920.0, -5696.0, 1952.0)
    gg_rct_Deco_Tents_Rect = Rect(-22848.0, 22976.0, -22656.0, 24352.0)
    gg_rct_GiveTo_Maroon = Rect(-24096.0, 22752.0, -23904.0, 22944.0)
    gg_rct_GiveTo_Navy = Rect(-24480.0, 22752.0, -24288.0, 22944.0)
    gg_rct_GiveTo_Emerald = Rect(-27936.0, 22752.0, -27744.0, 22944.0)
    gg_rct_GiveTo_Turquoise = Rect(-24864.0, 22752.0, -24672.0, 22944.0)
    gg_rct_GiveTo_Violet = Rect(-25248.0, 22752.0, -25056.0, 22944.0)
    gg_rct_GiveTo_Peach = Rect(-26016.0, 22752.0, -25824.0, 22944.0)
    gg_rct_GiveTo_Mint = Rect(-26400.0, 22752.0, -26208.0, 22944.0)
    gg_rct_GiveTo_Lavender = Rect(-26784.0, 22752.0, -26592.0, 22944.0)
    gg_rct_GiveTo_Coal = Rect(-27168.0, 22752.0, -26976.0, 22944.0)
    gg_rct_GiveTo_Snow = Rect(-27552.0, 22752.0, -27360.0, 22944.0)
    gg_rct_GiveTo_Wheat = Rect(-25632.0, 22752.0, -25440.0, 22944.0)
    gg_rct_GiveTo_Peanut = Rect(-28384.0, 23392.0, -28192.0, 23584.0)
end

function CreateCameras()
    gg_cam_Camera_001 = CreateCameraSetup()
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ROTATION, 100.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ANGLE_OF_ATTACK, 1.7, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_TARGET_DISTANCE, 1650.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_ROLL, 0.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_FARZ, 5000.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_NEARZ, 100.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_LOCAL_PITCH, 0.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_LOCAL_YAW, 0.0, 0.0)
    CameraSetupSetField(gg_cam_Camera_001, CAMERA_FIELD_LOCAL_ROLL, 0.0, 0.0)
    CameraSetupSetDestPosition(gg_cam_Camera_001, -27345.3, 28095.2, 0.0)
end

function InitUpgrades_Player0()
    SetPlayerTechResearched(Player(0), FourCC("Rhme"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Rhra"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Rhhb"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rhar"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Rhgb"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rhac"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Rhde"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rhan"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rhpt"), 2)
    SetPlayerTechResearched(Player(0), FourCC("Rhst"), 2)
    SetPlayerTechResearched(Player(0), FourCC("Rhla"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Rhri"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rhlh"), 2)
    SetPlayerTechResearched(Player(0), FourCC("Rhfl"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rhss"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rhrt"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rhfc"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rhfs"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rhcd"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rome"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Rora"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Roar"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Rwdm"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Ropg"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Robs"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rows"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Roen"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rowd"), 2)
    SetPlayerTechResearched(Player(0), FourCC("Rost"), 2)
    SetPlayerTechResearched(Player(0), FourCC("Rotr"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rolf"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rowt"), 2)
    SetPlayerTechResearched(Player(0), FourCC("Rorb"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Robf"), 1)
    SetPlayerTechResearched(Player(0), FourCC("R00C"), 2)
    SetPlayerTechResearched(Player(0), FourCC("R00D"), 1)
    SetPlayerTechResearched(Player(0), FourCC("R00E"), 3)
    SetPlayerTechResearched(Player(0), FourCC("R00F"), 3)
    SetPlayerTechResearched(Player(0), FourCC("R00G"), 3)
    SetPlayerTechResearched(Player(0), FourCC("R00H"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Rume"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Rura"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Ruar"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Ruac"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rugf"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Ruwb"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rusf"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(0), FourCC("Ruba"), 2)
    SetPlayerTechResearched(Player(0), FourCC("Rufb"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rusl"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rucr"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Ruex"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rnen"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rnsw"), 2)
    SetPlayerTechResearched(Player(0), FourCC("Rnsi"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rnat"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Rnam"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Rnsb"), 1)
    SetPlayerTechMaxAllowed(Player(0), FourCC("R003"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Resm"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Resw"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Rema"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Rerh"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Renb"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Reuv"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Resc"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Reib"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Remk"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Redt"), 2)
    SetPlayerTechResearched(Player(0), FourCC("Redc"), 2)
    SetPlayerTechResearched(Player(0), FourCC("Resi"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Recb"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Reht"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Repb"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rers"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rehs"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Reeb"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Reec"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rews"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rovs"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Robk"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rosp"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Rupc"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rusm"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rubu"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rusp"), 1)
    SetPlayerTechResearched(Player(0), FourCC("Rgfo"), 3)
    SetPlayerTechResearched(Player(0), FourCC("Rguv"), 1)
    SetPlayerTechMaxAllowed(Player(0), FourCC("Rhse"), 0)
    SetPlayerTechMaxAllowed(Player(0), FourCC("Rhpm"), 0)
    SetPlayerTechMaxAllowed(Player(0), FourCC("Ropm"), 0)
    SetPlayerTechMaxAllowed(Player(0), FourCC("Rupm"), 0)
    SetPlayerTechMaxAllowed(Player(0), FourCC("Repm"), 0)
end

function InitUpgrades_Player1()
    SetPlayerTechResearched(Player(1), FourCC("Rhme"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Rhra"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Rhhb"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rhar"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Rhgb"), 1)
    SetPlayerTechResearched(Player(1), FourCC("R00A"), 1)
    SetPlayerTechResearched(Player(1), FourCC("R003"), 3)
    SetPlayerTechResearched(Player(1), FourCC("R004"), 3)
    SetPlayerTechResearched(Player(1), FourCC("R005"), 1)
    SetPlayerTechResearched(Player(1), FourCC("R006"), 1)
    SetPlayerTechResearched(Player(1), FourCC("R007"), 1)
    SetPlayerTechResearched(Player(1), FourCC("R008"), 1)
    SetPlayerTechResearched(Player(1), FourCC("R009"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rhac"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Rhde"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rhan"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rhpt"), 2)
    SetPlayerTechResearched(Player(1), FourCC("Rhst"), 2)
    SetPlayerTechResearched(Player(1), FourCC("Rhla"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Rhri"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rhlh"), 2)
    SetPlayerTechResearched(Player(1), FourCC("Rhfl"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rhss"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rhrt"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rhfc"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rhfs"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rhcd"), 1)
    SetPlayerTechResearched(Player(1), FourCC("R000"), 1)
    SetPlayerTechResearched(Player(1), FourCC("R001"), 3)
    SetPlayerTechResearched(Player(1), FourCC("R002"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Rome"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Rora"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Roar"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Rwdm"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Ropg"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Robs"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rows"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Roen"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rowd"), 2)
    SetPlayerTechResearched(Player(1), FourCC("Rost"), 2)
    SetPlayerTechResearched(Player(1), FourCC("Rotr"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rolf"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rowt"), 2)
    SetPlayerTechResearched(Player(1), FourCC("Rorb"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Robf"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rume"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Rura"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Ruar"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Ruac"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rugf"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Ruwb"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rusf"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(1), FourCC("Ruba"), 2)
    SetPlayerTechResearched(Player(1), FourCC("Rufb"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rusl"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rucr"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Ruex"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rnen"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rnsw"), 2)
    SetPlayerTechResearched(Player(1), FourCC("Rnsi"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rnat"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Rnam"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Rnsb"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Resm"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Resw"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Rema"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Rerh"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Renb"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Reuv"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Resc"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Reib"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Remk"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Redt"), 2)
    SetPlayerTechResearched(Player(1), FourCC("Redc"), 2)
    SetPlayerTechResearched(Player(1), FourCC("Resi"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Recb"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Reht"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Repb"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rers"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rehs"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Reeb"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Reec"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rews"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rovs"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Robk"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rosp"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Rupc"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rusm"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rubu"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rusp"), 1)
    SetPlayerTechResearched(Player(1), FourCC("Rgfo"), 3)
    SetPlayerTechResearched(Player(1), FourCC("Rguv"), 1)
    SetPlayerTechMaxAllowed(Player(1), FourCC("Rhse"), 0)
    SetPlayerTechMaxAllowed(Player(1), FourCC("Rhpm"), 0)
    SetPlayerTechMaxAllowed(Player(1), FourCC("Ropm"), 0)
    SetPlayerTechMaxAllowed(Player(1), FourCC("Rupm"), 0)
    SetPlayerTechMaxAllowed(Player(1), FourCC("Repm"), 0)
end

function InitUpgrades_Player2()
    SetPlayerTechResearched(Player(2), FourCC("Rhme"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Rhra"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Rhhb"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rhar"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Rhgb"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rhac"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Rhde"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rhan"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rhpt"), 2)
    SetPlayerTechResearched(Player(2), FourCC("Rhst"), 2)
    SetPlayerTechResearched(Player(2), FourCC("Rhla"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Rhri"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rhlh"), 2)
    SetPlayerTechResearched(Player(2), FourCC("Rhfl"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rhss"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rhrt"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rhfc"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rhfs"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rhcd"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rome"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Rora"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Roar"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Rwdm"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Ropg"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Robs"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rows"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Roen"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rowd"), 2)
    SetPlayerTechResearched(Player(2), FourCC("Rost"), 2)
    SetPlayerTechResearched(Player(2), FourCC("Rotr"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rolf"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rowt"), 2)
    SetPlayerTechResearched(Player(2), FourCC("Rorb"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Robf"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rume"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Rura"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Ruar"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Ruac"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rugf"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Ruwb"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rusf"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(2), FourCC("Ruba"), 2)
    SetPlayerTechResearched(Player(2), FourCC("Rufb"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rusl"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rucr"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Ruex"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rnen"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rnsw"), 2)
    SetPlayerTechResearched(Player(2), FourCC("Rnsi"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rnat"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Rnam"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Rnsb"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Resm"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Resw"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Rema"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Rerh"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Renb"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Reuv"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Resc"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Reib"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Remk"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Redt"), 2)
    SetPlayerTechResearched(Player(2), FourCC("Redc"), 2)
    SetPlayerTechResearched(Player(2), FourCC("Resi"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Recb"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Reht"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Repb"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rers"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rehs"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Reeb"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Reec"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rews"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rovs"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Robk"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rosp"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Rupc"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rusm"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rubu"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rusp"), 1)
    SetPlayerTechResearched(Player(2), FourCC("Rgfo"), 3)
    SetPlayerTechResearched(Player(2), FourCC("Rguv"), 1)
    SetPlayerTechMaxAllowed(Player(2), FourCC("Rhse"), 0)
    SetPlayerTechMaxAllowed(Player(2), FourCC("Rhpm"), 0)
    SetPlayerTechMaxAllowed(Player(2), FourCC("Ropm"), 0)
    SetPlayerTechMaxAllowed(Player(2), FourCC("Rupm"), 0)
    SetPlayerTechMaxAllowed(Player(2), FourCC("Repm"), 0)
end

function InitUpgrades_Player3()
    SetPlayerTechResearched(Player(3), FourCC("Rhme"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Rhra"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Rhhb"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rhar"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Rhgb"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rhac"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Rhde"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rhan"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rhpt"), 2)
    SetPlayerTechResearched(Player(3), FourCC("Rhst"), 2)
    SetPlayerTechResearched(Player(3), FourCC("Rhla"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Rhri"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rhlh"), 2)
    SetPlayerTechResearched(Player(3), FourCC("Rhfl"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rhss"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rhrt"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rhfc"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rhfs"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rhcd"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rome"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Rora"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Roar"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Rwdm"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Ropg"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Robs"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rows"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Roen"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rowd"), 2)
    SetPlayerTechResearched(Player(3), FourCC("Rost"), 2)
    SetPlayerTechResearched(Player(3), FourCC("Rotr"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rolf"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rowt"), 2)
    SetPlayerTechResearched(Player(3), FourCC("Rorb"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Robf"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rume"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Rura"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Ruar"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Ruac"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rugf"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Ruwb"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rusf"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(3), FourCC("Ruba"), 2)
    SetPlayerTechResearched(Player(3), FourCC("Rufb"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rusl"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rucr"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Ruex"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rnen"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rnsw"), 2)
    SetPlayerTechResearched(Player(3), FourCC("Rnsi"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rnat"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Rnam"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Rnsb"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Resm"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Resw"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Rema"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Rerh"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Renb"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Reuv"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Resc"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Reib"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Remk"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Redt"), 2)
    SetPlayerTechResearched(Player(3), FourCC("Redc"), 2)
    SetPlayerTechResearched(Player(3), FourCC("Resi"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Recb"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Reht"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Repb"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rers"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rehs"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Reeb"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Reec"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rews"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rovs"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Robk"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rosp"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Rupc"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rusm"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rubu"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rusp"), 1)
    SetPlayerTechResearched(Player(3), FourCC("Rgfo"), 3)
    SetPlayerTechResearched(Player(3), FourCC("Rguv"), 1)
    SetPlayerTechMaxAllowed(Player(3), FourCC("Rhse"), 0)
    SetPlayerTechMaxAllowed(Player(3), FourCC("Rhpm"), 0)
    SetPlayerTechMaxAllowed(Player(3), FourCC("Ropm"), 0)
    SetPlayerTechMaxAllowed(Player(3), FourCC("Rupm"), 0)
    SetPlayerTechMaxAllowed(Player(3), FourCC("Repm"), 0)
end

function InitUpgrades_Player4()
    SetPlayerTechResearched(Player(4), FourCC("Rhme"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Rhra"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Rhhb"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rhar"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Rhgb"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rhac"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Rhde"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rhan"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rhpt"), 2)
    SetPlayerTechResearched(Player(4), FourCC("Rhst"), 2)
    SetPlayerTechResearched(Player(4), FourCC("Rhla"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Rhri"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rhlh"), 2)
    SetPlayerTechResearched(Player(4), FourCC("Rhfl"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rhss"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rhrt"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rhfc"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rhfs"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rhcd"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rome"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Rora"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Roar"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Rwdm"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Ropg"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Robs"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rows"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Roen"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rowd"), 2)
    SetPlayerTechResearched(Player(4), FourCC("Rost"), 2)
    SetPlayerTechResearched(Player(4), FourCC("Rotr"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rolf"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rowt"), 2)
    SetPlayerTechResearched(Player(4), FourCC("Rorb"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Robf"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rume"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Rura"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Ruar"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Ruac"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rugf"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Ruwb"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rusf"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(4), FourCC("Ruba"), 2)
    SetPlayerTechResearched(Player(4), FourCC("Rufb"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rusl"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rucr"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Ruex"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rnen"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rnsw"), 2)
    SetPlayerTechResearched(Player(4), FourCC("Rnsi"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rnat"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Rnam"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Rnsb"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Resm"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Resw"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Rema"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Rerh"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Renb"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Reuv"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Resc"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Reib"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Remk"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Redt"), 2)
    SetPlayerTechResearched(Player(4), FourCC("Redc"), 2)
    SetPlayerTechResearched(Player(4), FourCC("Resi"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Recb"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Reht"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Repb"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rers"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rehs"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Reeb"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Reec"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rews"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rovs"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Robk"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rosp"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Rupc"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rusm"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rubu"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rusp"), 1)
    SetPlayerTechResearched(Player(4), FourCC("Rgfo"), 3)
    SetPlayerTechResearched(Player(4), FourCC("Rguv"), 1)
    SetPlayerTechMaxAllowed(Player(4), FourCC("Rhse"), 0)
    SetPlayerTechMaxAllowed(Player(4), FourCC("Rhpm"), 0)
    SetPlayerTechMaxAllowed(Player(4), FourCC("Ropm"), 0)
    SetPlayerTechMaxAllowed(Player(4), FourCC("Rupm"), 0)
    SetPlayerTechMaxAllowed(Player(4), FourCC("Repm"), 0)
end

function InitUpgrades_Player5()
    SetPlayerTechResearched(Player(5), FourCC("Rhme"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Rhra"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Rhhb"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rhar"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Rhgb"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rhac"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Rhde"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rhan"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rhpt"), 2)
    SetPlayerTechResearched(Player(5), FourCC("Rhst"), 2)
    SetPlayerTechResearched(Player(5), FourCC("Rhla"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Rhri"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rhlh"), 2)
    SetPlayerTechResearched(Player(5), FourCC("Rhfl"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rhss"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rhrt"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rhfc"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rhfs"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rhcd"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rome"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Rora"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Roar"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Rwdm"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Ropg"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Robs"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rows"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Roen"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rowd"), 2)
    SetPlayerTechResearched(Player(5), FourCC("Rost"), 2)
    SetPlayerTechResearched(Player(5), FourCC("Rotr"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rolf"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rowt"), 2)
    SetPlayerTechResearched(Player(5), FourCC("Rorb"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Robf"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rume"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Rura"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Ruar"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Ruac"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rugf"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Ruwb"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rusf"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(5), FourCC("Ruba"), 2)
    SetPlayerTechResearched(Player(5), FourCC("Rufb"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rusl"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rucr"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Ruex"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rnen"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rnsw"), 2)
    SetPlayerTechResearched(Player(5), FourCC("Rnsi"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rnat"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Rnam"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Rnsb"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Resm"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Resw"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Rema"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Rerh"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Renb"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Reuv"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Resc"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Reib"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Remk"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Redt"), 2)
    SetPlayerTechResearched(Player(5), FourCC("Redc"), 2)
    SetPlayerTechResearched(Player(5), FourCC("Resi"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Recb"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Reht"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Repb"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rers"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rehs"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Reeb"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Reec"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rews"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rovs"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Robk"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rosp"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Rupc"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rusm"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rubu"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rusp"), 1)
    SetPlayerTechResearched(Player(5), FourCC("Rgfo"), 3)
    SetPlayerTechResearched(Player(5), FourCC("Rguv"), 1)
    SetPlayerTechMaxAllowed(Player(5), FourCC("Rhse"), 0)
    SetPlayerTechMaxAllowed(Player(5), FourCC("Rhpm"), 0)
    SetPlayerTechMaxAllowed(Player(5), FourCC("Ropm"), 0)
    SetPlayerTechMaxAllowed(Player(5), FourCC("Rupm"), 0)
    SetPlayerTechMaxAllowed(Player(5), FourCC("Repm"), 0)
end

function InitUpgrades_Player6()
    SetPlayerTechResearched(Player(6), FourCC("Rhme"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Rhra"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Rhhb"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rhar"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Rhgb"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rhac"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Rhde"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rhan"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rhpt"), 2)
    SetPlayerTechResearched(Player(6), FourCC("Rhst"), 2)
    SetPlayerTechResearched(Player(6), FourCC("Rhla"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Rhri"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rhlh"), 2)
    SetPlayerTechResearched(Player(6), FourCC("Rhfl"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rhss"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rhrt"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rhfc"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rhfs"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rhcd"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rome"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Rora"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Roar"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Rwdm"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Ropg"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Robs"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rows"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Roen"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rowd"), 2)
    SetPlayerTechResearched(Player(6), FourCC("Rost"), 2)
    SetPlayerTechResearched(Player(6), FourCC("Rotr"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rolf"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rowt"), 2)
    SetPlayerTechResearched(Player(6), FourCC("Rorb"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Robf"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rume"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Rura"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Ruar"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Ruac"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rugf"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Ruwb"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rusf"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(6), FourCC("Ruba"), 2)
    SetPlayerTechResearched(Player(6), FourCC("Rufb"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rusl"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rucr"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Ruex"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rnen"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rnsw"), 2)
    SetPlayerTechResearched(Player(6), FourCC("Rnsi"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rnat"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Rnam"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Rnsb"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Resm"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Resw"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Rema"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Rerh"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Renb"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Reuv"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Resc"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Reib"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Remk"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Redt"), 2)
    SetPlayerTechResearched(Player(6), FourCC("Redc"), 2)
    SetPlayerTechResearched(Player(6), FourCC("Resi"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Recb"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Reht"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Repb"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rers"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rehs"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Reeb"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Reec"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rews"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rovs"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Robk"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rosp"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Rupc"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rusm"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rubu"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rusp"), 1)
    SetPlayerTechResearched(Player(6), FourCC("Rgfo"), 3)
    SetPlayerTechResearched(Player(6), FourCC("Rguv"), 1)
    SetPlayerTechMaxAllowed(Player(6), FourCC("Rhse"), 0)
    SetPlayerTechMaxAllowed(Player(6), FourCC("Rhpm"), 0)
    SetPlayerTechMaxAllowed(Player(6), FourCC("Ropm"), 0)
    SetPlayerTechMaxAllowed(Player(6), FourCC("Rupm"), 0)
    SetPlayerTechMaxAllowed(Player(6), FourCC("Repm"), 0)
end

function InitUpgrades_Player7()
    SetPlayerTechResearched(Player(7), FourCC("Rhme"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Rhra"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Rhhb"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rhar"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Rhgb"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rhac"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Rhde"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rhan"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rhpt"), 2)
    SetPlayerTechResearched(Player(7), FourCC("Rhst"), 2)
    SetPlayerTechResearched(Player(7), FourCC("Rhla"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Rhri"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rhlh"), 2)
    SetPlayerTechResearched(Player(7), FourCC("Rhfl"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rhss"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rhrt"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rhfc"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rhfs"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rhcd"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rome"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Rora"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Roar"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Rwdm"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Ropg"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Robs"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rows"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Roen"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rowd"), 2)
    SetPlayerTechResearched(Player(7), FourCC("Rost"), 2)
    SetPlayerTechResearched(Player(7), FourCC("Rotr"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rolf"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rowt"), 2)
    SetPlayerTechResearched(Player(7), FourCC("Rorb"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Robf"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rume"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Rura"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Ruar"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Ruac"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rugf"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Ruwb"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rusf"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(7), FourCC("Ruba"), 2)
    SetPlayerTechResearched(Player(7), FourCC("Rufb"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rusl"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rucr"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Ruex"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rnen"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rnsw"), 2)
    SetPlayerTechResearched(Player(7), FourCC("Rnsi"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rnat"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Rnam"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Rnsb"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Resm"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Resw"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Rema"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Rerh"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Renb"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Reuv"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Resc"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Reib"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Remk"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Redt"), 2)
    SetPlayerTechResearched(Player(7), FourCC("Redc"), 2)
    SetPlayerTechResearched(Player(7), FourCC("Resi"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Recb"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Reht"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Repb"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rers"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rehs"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Reeb"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Reec"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rews"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rovs"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Robk"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rosp"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Rupc"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rusm"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rubu"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rusp"), 1)
    SetPlayerTechResearched(Player(7), FourCC("Rgfo"), 3)
    SetPlayerTechResearched(Player(7), FourCC("Rguv"), 1)
    SetPlayerTechMaxAllowed(Player(7), FourCC("Rhse"), 0)
    SetPlayerTechMaxAllowed(Player(7), FourCC("Rhpm"), 0)
    SetPlayerTechMaxAllowed(Player(7), FourCC("Ropm"), 0)
    SetPlayerTechMaxAllowed(Player(7), FourCC("Rupm"), 0)
    SetPlayerTechMaxAllowed(Player(7), FourCC("Repm"), 0)
end

function InitUpgrades_Player8()
    SetPlayerTechResearched(Player(8), FourCC("Rhme"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Rhra"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Rhhb"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rhar"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Rhgb"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rhac"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Rhde"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rhan"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rhpt"), 2)
    SetPlayerTechResearched(Player(8), FourCC("Rhst"), 2)
    SetPlayerTechResearched(Player(8), FourCC("Rhla"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Rhri"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rhlh"), 2)
    SetPlayerTechResearched(Player(8), FourCC("Rhfl"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rhss"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rhrt"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rhfc"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rhfs"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rhcd"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rome"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Rora"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Roar"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Rwdm"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Ropg"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Robs"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rows"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Roen"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rowd"), 2)
    SetPlayerTechResearched(Player(8), FourCC("Rost"), 2)
    SetPlayerTechResearched(Player(8), FourCC("Rotr"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rolf"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rowt"), 2)
    SetPlayerTechResearched(Player(8), FourCC("Rorb"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Robf"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rume"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Rura"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Ruar"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Ruac"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rugf"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Ruwb"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rusf"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(8), FourCC("Ruba"), 2)
    SetPlayerTechResearched(Player(8), FourCC("Rufb"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rusl"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rucr"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Ruex"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rnen"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rnsw"), 2)
    SetPlayerTechResearched(Player(8), FourCC("Rnsi"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rnat"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Rnam"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Rnsb"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Resm"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Resw"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Rema"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Rerh"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Renb"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Reuv"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Resc"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Reib"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Remk"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Redt"), 2)
    SetPlayerTechResearched(Player(8), FourCC("Redc"), 2)
    SetPlayerTechResearched(Player(8), FourCC("Resi"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Recb"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Reht"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Repb"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rers"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rehs"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Reeb"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Reec"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rews"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rovs"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Robk"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rosp"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Rupc"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rusm"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rubu"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rusp"), 1)
    SetPlayerTechResearched(Player(8), FourCC("Rgfo"), 3)
    SetPlayerTechResearched(Player(8), FourCC("Rguv"), 1)
    SetPlayerTechMaxAllowed(Player(8), FourCC("Rhse"), 0)
    SetPlayerTechMaxAllowed(Player(8), FourCC("Rhpm"), 0)
    SetPlayerTechMaxAllowed(Player(8), FourCC("Ropm"), 0)
    SetPlayerTechMaxAllowed(Player(8), FourCC("Rupm"), 0)
    SetPlayerTechMaxAllowed(Player(8), FourCC("Repm"), 0)
end

function InitUpgrades_Player9()
    SetPlayerTechResearched(Player(9), FourCC("Rhme"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Rhra"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Rhhb"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rhar"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Rhgb"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rhac"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Rhde"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rhan"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rhpt"), 2)
    SetPlayerTechResearched(Player(9), FourCC("Rhst"), 2)
    SetPlayerTechResearched(Player(9), FourCC("Rhla"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Rhri"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rhlh"), 2)
    SetPlayerTechResearched(Player(9), FourCC("Rhfl"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rhss"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rhrt"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rhfc"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rhfs"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rhcd"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rome"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Rora"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Roar"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Rwdm"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Ropg"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Robs"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rows"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Roen"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rowd"), 2)
    SetPlayerTechResearched(Player(9), FourCC("Rost"), 2)
    SetPlayerTechResearched(Player(9), FourCC("Rotr"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rolf"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rowt"), 2)
    SetPlayerTechResearched(Player(9), FourCC("Rorb"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Robf"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rume"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Rura"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Ruar"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Ruac"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rugf"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Ruwb"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rusf"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(9), FourCC("Ruba"), 2)
    SetPlayerTechResearched(Player(9), FourCC("Rufb"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rusl"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rucr"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Ruex"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rnen"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rnsw"), 2)
    SetPlayerTechResearched(Player(9), FourCC("Rnsi"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rnat"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Rnam"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Rnsb"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Resm"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Resw"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Rema"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Rerh"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Renb"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Reuv"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Resc"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Reib"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Remk"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Redt"), 2)
    SetPlayerTechResearched(Player(9), FourCC("Redc"), 2)
    SetPlayerTechResearched(Player(9), FourCC("Resi"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Recb"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Reht"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Repb"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rers"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rehs"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Reeb"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Reec"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rews"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rovs"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Robk"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rosp"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Rupc"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rusm"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rubu"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rusp"), 1)
    SetPlayerTechResearched(Player(9), FourCC("Rgfo"), 3)
    SetPlayerTechResearched(Player(9), FourCC("Rguv"), 1)
    SetPlayerTechMaxAllowed(Player(9), FourCC("Rhse"), 0)
    SetPlayerTechMaxAllowed(Player(9), FourCC("Rhpm"), 0)
    SetPlayerTechMaxAllowed(Player(9), FourCC("Ropm"), 0)
    SetPlayerTechMaxAllowed(Player(9), FourCC("Rupm"), 0)
    SetPlayerTechMaxAllowed(Player(9), FourCC("Repm"), 0)
end

function InitUpgrades_Player10()
    SetPlayerTechResearched(Player(10), FourCC("Rhme"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Rhra"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Rhhb"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rhar"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Rhgb"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rhac"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Rhde"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rhan"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rhpt"), 2)
    SetPlayerTechResearched(Player(10), FourCC("Rhst"), 2)
    SetPlayerTechResearched(Player(10), FourCC("Rhla"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Rhri"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rhlh"), 2)
    SetPlayerTechResearched(Player(10), FourCC("Rhfl"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rhss"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rhrt"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rhfc"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rhfs"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rhcd"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rome"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Rora"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Roar"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Rwdm"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Ropg"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Robs"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rows"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Roen"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rowd"), 2)
    SetPlayerTechResearched(Player(10), FourCC("Rost"), 2)
    SetPlayerTechResearched(Player(10), FourCC("Rotr"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rolf"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rowt"), 2)
    SetPlayerTechResearched(Player(10), FourCC("Rorb"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Robf"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rume"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Rura"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Ruar"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Ruac"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rugf"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Ruwb"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rusf"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(10), FourCC("Ruba"), 2)
    SetPlayerTechResearched(Player(10), FourCC("Rufb"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rusl"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rucr"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Ruex"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rnen"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rnsw"), 2)
    SetPlayerTechResearched(Player(10), FourCC("Rnsi"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rnat"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Rnam"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Rnsb"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Resm"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Resw"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Rema"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Rerh"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Renb"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Reuv"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Resc"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Reib"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Remk"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Redt"), 2)
    SetPlayerTechResearched(Player(10), FourCC("Redc"), 2)
    SetPlayerTechResearched(Player(10), FourCC("Resi"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Recb"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Reht"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Repb"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rers"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rehs"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Reeb"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Reec"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rews"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rovs"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Robk"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rosp"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Rupc"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rusm"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rubu"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rusp"), 1)
    SetPlayerTechResearched(Player(10), FourCC("Rgfo"), 3)
    SetPlayerTechResearched(Player(10), FourCC("Rguv"), 1)
    SetPlayerTechMaxAllowed(Player(10), FourCC("Rhse"), 0)
    SetPlayerTechMaxAllowed(Player(10), FourCC("Rhpm"), 0)
    SetPlayerTechMaxAllowed(Player(10), FourCC("Ropm"), 0)
    SetPlayerTechMaxAllowed(Player(10), FourCC("Rupm"), 0)
    SetPlayerTechMaxAllowed(Player(10), FourCC("Repm"), 0)
end

function InitUpgrades_Player11()
    SetPlayerTechResearched(Player(11), FourCC("Rhme"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Rhra"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Rhhb"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rhar"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Rhgb"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rhac"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Rhde"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rhan"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rhpt"), 2)
    SetPlayerTechResearched(Player(11), FourCC("Rhst"), 2)
    SetPlayerTechResearched(Player(11), FourCC("Rhla"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Rhri"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rhlh"), 2)
    SetPlayerTechResearched(Player(11), FourCC("Rhfl"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rhss"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rhrt"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rhfc"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rhfs"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rhcd"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rome"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Rora"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Roar"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Rwdm"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Ropg"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Robs"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rows"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Roen"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rowd"), 2)
    SetPlayerTechResearched(Player(11), FourCC("Rost"), 2)
    SetPlayerTechResearched(Player(11), FourCC("Rotr"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rolf"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rowt"), 2)
    SetPlayerTechResearched(Player(11), FourCC("Rorb"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Robf"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rume"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Rura"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Ruar"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Ruac"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rugf"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Ruwb"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rusf"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rune"), 2)
    SetPlayerTechResearched(Player(11), FourCC("Ruba"), 2)
    SetPlayerTechResearched(Player(11), FourCC("Rufb"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rusl"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rucr"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Ruex"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rnen"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rnsw"), 2)
    SetPlayerTechResearched(Player(11), FourCC("Rnsi"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rnat"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Rnam"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Rnsb"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Resm"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Resw"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Rema"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Rerh"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Renb"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Reuv"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Resc"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Remg"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Reib"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Remk"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Redt"), 2)
    SetPlayerTechResearched(Player(11), FourCC("Redc"), 2)
    SetPlayerTechResearched(Player(11), FourCC("Resi"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Recb"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Reht"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Repb"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rers"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rehs"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Reeb"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Reec"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rews"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rovs"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Robk"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rosp"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Rupc"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rusm"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rubu"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rusp"), 1)
    SetPlayerTechResearched(Player(11), FourCC("Rgfo"), 3)
    SetPlayerTechResearched(Player(11), FourCC("Rguv"), 1)
    SetPlayerTechMaxAllowed(Player(11), FourCC("Rhse"), 0)
    SetPlayerTechMaxAllowed(Player(11), FourCC("Rhpm"), 0)
    SetPlayerTechMaxAllowed(Player(11), FourCC("Ropm"), 0)
    SetPlayerTechMaxAllowed(Player(11), FourCC("Rupm"), 0)
    SetPlayerTechMaxAllowed(Player(11), FourCC("Repm"), 0)
end

function InitUpgrades()
    InitUpgrades_Player0()
    InitUpgrades_Player1()
    InitUpgrades_Player2()
    InitUpgrades_Player3()
    InitUpgrades_Player4()
    InitUpgrades_Player5()
    InitUpgrades_Player6()
    InitUpgrades_Player7()
    InitUpgrades_Player8()
    InitUpgrades_Player9()
    InitUpgrades_Player10()
    InitUpgrades_Player11()
end

function InitCustomPlayerSlots()
    SetPlayerStartLocation(Player(0), 0)
    ForcePlayerStartLocation(Player(0), 0)
    SetPlayerColor(Player(0), ConvertPlayerColor(0))
    SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(0), false)
    SetPlayerController(Player(0), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(1), 1)
    ForcePlayerStartLocation(Player(1), 1)
    SetPlayerColor(Player(1), ConvertPlayerColor(1))
    SetPlayerRacePreference(Player(1), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(1), false)
    SetPlayerController(Player(1), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(2), 2)
    ForcePlayerStartLocation(Player(2), 2)
    SetPlayerColor(Player(2), ConvertPlayerColor(2))
    SetPlayerRacePreference(Player(2), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(2), false)
    SetPlayerController(Player(2), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(3), 3)
    ForcePlayerStartLocation(Player(3), 3)
    SetPlayerColor(Player(3), ConvertPlayerColor(3))
    SetPlayerRacePreference(Player(3), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(3), false)
    SetPlayerController(Player(3), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(4), 4)
    ForcePlayerStartLocation(Player(4), 4)
    SetPlayerColor(Player(4), ConvertPlayerColor(4))
    SetPlayerRacePreference(Player(4), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(4), false)
    SetPlayerController(Player(4), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(5), 5)
    ForcePlayerStartLocation(Player(5), 5)
    SetPlayerColor(Player(5), ConvertPlayerColor(5))
    SetPlayerRacePreference(Player(5), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(5), false)
    SetPlayerController(Player(5), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(6), 6)
    ForcePlayerStartLocation(Player(6), 6)
    SetPlayerColor(Player(6), ConvertPlayerColor(6))
    SetPlayerRacePreference(Player(6), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(6), false)
    SetPlayerController(Player(6), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(7), 7)
    ForcePlayerStartLocation(Player(7), 7)
    SetPlayerColor(Player(7), ConvertPlayerColor(7))
    SetPlayerRacePreference(Player(7), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(7), false)
    SetPlayerController(Player(7), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(8), 8)
    ForcePlayerStartLocation(Player(8), 8)
    SetPlayerColor(Player(8), ConvertPlayerColor(8))
    SetPlayerRacePreference(Player(8), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(8), false)
    SetPlayerController(Player(8), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(9), 9)
    ForcePlayerStartLocation(Player(9), 9)
    SetPlayerColor(Player(9), ConvertPlayerColor(9))
    SetPlayerRacePreference(Player(9), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(9), false)
    SetPlayerController(Player(9), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(10), 10)
    ForcePlayerStartLocation(Player(10), 10)
    SetPlayerColor(Player(10), ConvertPlayerColor(10))
    SetPlayerRacePreference(Player(10), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(10), false)
    SetPlayerController(Player(10), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(11), 11)
    ForcePlayerStartLocation(Player(11), 11)
    SetPlayerColor(Player(11), ConvertPlayerColor(11))
    SetPlayerRacePreference(Player(11), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(11), false)
    SetPlayerController(Player(11), MAP_CONTROL_USER)
end

function InitCustomTeams()
    SetPlayerTeam(Player(0), 0)
    SetPlayerTeam(Player(1), 1)
    SetPlayerTeam(Player(2), 1)
    SetPlayerTeam(Player(3), 1)
    SetPlayerTeam(Player(4), 1)
    SetPlayerTeam(Player(5), 1)
    SetPlayerTeam(Player(6), 1)
    SetPlayerTeam(Player(7), 1)
    SetPlayerTeam(Player(8), 1)
    SetPlayerTeam(Player(9), 1)
    SetPlayerTeam(Player(10), 1)
    SetPlayerTeam(Player(11), 1)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(6), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(7), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(8), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(10), true)
    SetPlayerAllianceStateAllyBJ(Player(9), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(10), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(6), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(7), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(8), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(9), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(6), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(7), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(8), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(10), true)
    SetPlayerAllianceStateVisionBJ(Player(9), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(10), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(6), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(7), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(8), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(9), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(10), true)
end

function InitAllyPriorities()
    SetStartLocPrioCount(0, 4)
    SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 1, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 2, 3, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(0, 3, 4, MAP_LOC_PRIO_LOW)
    SetStartLocPrioCount(1, 2)
    SetStartLocPrio(1, 0, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 1, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(2, 3)
    SetStartLocPrio(2, 0, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 1, 4, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(2, 2, 10, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(3, 1)
    SetStartLocPrio(3, 0, 11, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(4, 4)
    SetStartLocPrio(4, 0, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 1, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 2, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 3, 8, MAP_LOC_PRIO_LOW)
    SetStartLocPrioCount(5, 2)
    SetStartLocPrio(5, 0, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 1, 8, MAP_LOC_PRIO_LOW)
    SetStartLocPrioCount(6, 3)
    SetStartLocPrio(6, 0, 9, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 1, 10, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 2, 11, MAP_LOC_PRIO_LOW)
    SetStartLocPrioCount(7, 1)
    SetStartLocPrio(7, 0, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(8, 3)
    SetStartLocPrio(8, 0, 4, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(8, 1, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(8, 2, 7, MAP_LOC_PRIO_LOW)
    SetStartLocPrioCount(9, 1)
    SetStartLocPrio(9, 0, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(10, 3)
    SetStartLocPrio(10, 0, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(10, 1, 5, MAP_LOC_PRIO_LOW)
    SetStartLocPrio(10, 2, 6, MAP_LOC_PRIO_LOW)
    SetStartLocPrioCount(11, 3)
    SetStartLocPrio(11, 0, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(11, 1, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(11, 2, 10, MAP_LOC_PRIO_LOW)
end

function main()
    SetCameraBounds(-28800.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -19968.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 32256.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 29184.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -28800.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 29184.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 32256.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -19968.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    NewSoundEnvironment("Default")
    SetAmbientDaySound("CityScapeDay")
    SetAmbientNightSound("CityScapeNight")
    SetMapMusic("Music", true, 0)
    InitSounds()
    CreateRegions()
    CreateCameras()
    InitUpgrades()
    CreateAllUnits()
    InitBlizzard()
    InitGlobals()
end

function config()
    SetMapName("TRIGSTR_7792")
    SetMapDescription("TRIGSTR_7794")
    SetPlayers(12)
    SetTeams(12)
    SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
    DefineStartLocation(0, -23296.0, 23296.0)
    DefineStartLocation(1, -16128.0, 3520.0)
    DefineStartLocation(2, -8960.0, 1664.0)
    DefineStartLocation(3, 4352.0, 26496.0)
    DefineStartLocation(4, -16384.0, -4352.0)
    DefineStartLocation(5, -9408.0, -9600.0)
    DefineStartLocation(6, 10304.0, -1984.0)
    DefineStartLocation(7, -5376.0, -13504.0)
    DefineStartLocation(8, -14528.0, -14592.0)
    DefineStartLocation(9, 13504.0, -13376.0)
    DefineStartLocation(10, -704.0, -448.0)
    DefineStartLocation(11, 12352.0, 12288.0)
    InitCustomPlayerSlots()
    InitCustomTeams()
    InitAllyPriorities()
end


local function __module_0()
    local Unit = {}
    Unit.__index = Unit
    
    local allUnits = {}
    
    unit = {}
    unit.metatable = Unit
    
    function unit.wrap(whichUnit)
        if whichUnit then
            local handleId = GetHandleId(whichUnit)
            if allUnits[handleId] then
                return allUnits[handleId]
            else
                local table = {}
                allUnits[handleId] = table
    
                setmetatable(table, Unit)
                table.handle = whichUnit
                return table
            end
        end
    end
    
    function unit.create(whichPlayer, typeId, x, y, facingDeg)
        return unit.wrap(CreateUnit(whichPlayer.handle, typeId, x, y, facingDeg))
    end
    
    local function toRawCode(int)
        local res = ''
        for i = 1, 4 do
            res = string.char(math.floor(int % 256)) .. res
            int = int / 256
    	end
    	return res
    end
    
    function Unit:getTypeId()
        return toRawCode(GetUnitTypeId(self.handle))
    end
    
    function Unit:kill()
        KillUnit(self.handle)
    end
    function Unit:remove()
        RemoveUnit(self.handle)
        -- self.handle = nil
    end
    function Unit:show(boolShow)
        ShowUnit(self.handle, boolShow)
    end
    
    
    --SetUnitState
    function Unit:setX(x)
        SetUnitX(self.handle, x)
    end
    function Unit:setY(y)
        SetUnitY(self.handle, y)
    end
    
    function Unit:setPosition(x, y)
        SetUnitPosition(self.handle, x, y)
    end
    
    function Unit:getX()
        return GetUnitX(self.handle)
    end
    
    function Unit:getY()
        return GetUnitY(self.handle)
    end
    
    function Unit:setPosition(x, y)
        SetUnitPosition(self.handle, x, y)
    end
    -- SetUnitPositionLoc
    function Unit:setFacing(facingAngleDeg)
        SetUnitFacing(self.handle, facingAngleDeg)
    end
    -- SetUnitFacingTimed
    -- SetUnitMoveSpeed
    -- SetUnitFlyHeight
    -- SetUnitTurnSpeed
    -- SetUnitPropWindow
    -- SetUnitAcquireRange
    -- SetUnitCreepGuard
    
    function Unit:addAbility(strAbilCode)
        UnitAddAbility(self.handle, FourCC(strAbilCode))
    end
    function Unit:removeAbility(strAbilCode)
        UnitRemoveAbility(self.handle, FourCC(strAbilCode))
    end
    function Unit:getAbilityLevel(strAbilCode)
        return GetUnitAbilityLevel(self.handle, FourCC(strAbilCode))
    end
end
__modules["unit"] = {initialized = false, cached = nil, loader = __module_0}
local function __module_1()
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
end
__modules["player"] = {initialized = false, cached = nil, loader = __module_1}
local function __module_2()
    local GenericUnitEvent = {}
    return GenericUnitEvent
end
__modules["unitevents.generic"] = {initialized = false, cached = nil, loader = __module_2}
local function __module_3()
    require("unit")
    local GenericUnitEvent = require("unitevents.generic")
    
    -- TODO: Cache target of spellId after first cast. For Channel spells, check their special fields.
    
    local onSpellCastFuncs = {}
    
    function OnSpellCast()
    
        local target = unit.wrap(GetSpellTargetUnit())
    
        if not target then
            target = GetSpellTargetDestructable()
            if not target then
                target = GetSpellTargetItem()
                if not target then
                    target = {}
                    local x = GetSpellTargetX()
                    local y = GetSpellTargetY()
                    function target.getX() return x end
                    function target.getY() return y end
                end
            end
        end
    
        for _,func in ipairs(onSpellCastFuncs[GetHandleId(GetTriggerEventId())]) do
            local b, e = pcall(func, GetSpellAbilityId(), unit.wrap(GetTriggerUnit()), target)
            if not b then print(e) end
        end
    end
    
    local events = {EVENT_PLAYER_UNIT_SPELL_CHANNEL, EVENT_PLAYER_UNIT_SPELL_CAST, EVENT_PLAYER_UNIT_SPELL_EFFECT,
                              EVENT_PLAYER_UNIT_SPELL_FINISH, EVENT_PLAYER_UNIT_SPELL_ENDCAST}
    
    for _,event in ipairs(events) do
        onSpellCastFuncs[GetHandleId(event)] = {}
    end
    
    local function init()
        local trig = CreateTrigger()
    
        for i=0,bj_MAX_PLAYER_SLOTS do
            local player = Player(i)
    
            for _,event in ipairs(events) do
                TriggerRegisterPlayerUnitEvent(trig, player, event, nil)
            end
        end
    
        TriggerAddCondition(trig, Condition(OnSpellCast))
    end
    
    local function onSpell(event, callback)
        table.insert(onSpellCastFuncs[GetHandleId(event)], callback)
    end
    
    function GenericUnitEvent:onSpellChannel(callback)
       onSpell(EVENT_PLAYER_UNIT_SPELL_CHANNEL, callback)
    end
    
    function GenericUnitEvent:onSpellCast(callback)
        onSpell(EVENT_PLAYER_UNIT_SPELL_CAST, callback)
    end
    
    function GenericUnitEvent:onSpellEffect(callback)
        onSpell(EVENT_PLAYER_UNIT_SPELL_EFFECT, callback)
    end
    
    function GenericUnitEvent:onSpellFinish(callback)
        onSpell(EVENT_PLAYER_UNIT_SPELL_FINISH, callback)
    end
    function GenericUnitEvent:onSpellEndCast(callback)
        onSpell(EVENT_PLAYER_UNIT_SPELL_ENDCAST, callback)
    end
    
    ceres.addHook("main::after", init)
    
    -- Tests
    if false then
        local function initTest()
            GenericUnitEvent:onSpellEffect(function(spellId, trigU, target) print(GetUnitName(trigU)) end)
        end
    
        ceres.addHook("main::after", initTest)
    end
    
    return GenericUnitEvent
    
end
__modules["unitevents.generic.spell"] = {initialized = false, cached = nil, loader = __module_3}
local function __module_4()
    local Event = require("unitevents.generic")
    require("unitevents.generic.spell")
    
    -- TODO: Natives to wrap
    --[[
    native GetAbilityEffectById         takes integer abilityId, effecttype t, integer index returns string
    native GetAbilitySoundById          takes integer abilityId, soundtype t returns string
    
    
    native BlzSetAbilityResearchExtendedTooltip        takes integer abilCode, string researchExtendedTooltip, integer level returns nothing
    native BlzGetAbilityResearchExtendedTooltip        takes integer abilCode, integer level returns string
    ]]--
    
    local Abilities = {}
    Abilities.__index = Abilities
    
    local cachedAbilities = {}
    
    function Abilities:get(abilCode)
        local ability = cachedAbilities[abilCode]
        if ability then
            return ability
        else
            ability = {}
            setmetatable(ability, self)
            ability.code = FourCC(abilCode)
            cachedAbilities[abilCode] = ability
            return ability
        end
    end
    
    -- onCast events
    local funcs = {}
    
    local function OnSpellCast(spellId, trigU, target)
        if funcs[spellId] then
            funcs[spellId](spellId, trigU, target)
        end
    end
    
    function Abilities:onEffect(callback)
        funcs[self.code] = callback
    end
    
    Event:onSpellEffect(OnSpellCast)
    
    
    -- Tooltip methods
    function Abilities:getTooltip(intLevel)
        return BlzGetAbilityTooltip(self.code, intLevel)
    end
    function Abilities:setTooltip(strTooltip, intLevel)
        BlzSetAbilityTooltip(self.code, strTooltip, intLevel)
    end
    
    function Abilities:getActivatedTooltip(intLevel)
        return BlzGetAbilityActivatedTooltip(self.code, intLevel)
    end
    function Abilities:getActivatedTooltip(intLevel)
        BlzSetAbilityActivatedTooltip(self.code, intLevel)
    end
    
    function Abilities:getExtendedTooltip(intLevel)
        return BlzGetAbilityExtendedTooltip(self.code, intLevel)
    end
    -- Setter
    
    function Abilities:getResearchTooltip(intLevel)
        return BlzGetAbilityResearchTooltip(self.code, intLevel)
    end
    -- Setter
    
    -- Icon methods
    function Abilities:getIcon()
        return BlzGetAbilityIcon(self.code)
    end
    -- Setter
    
    function Abilities:getActivatedIcon()
        return BlzGetAbilityActivatedIcon(self.code)
    end
    -- Setter
    
    function Abilities:getPosX()
        return BlzGetAbilityPosX(self.code)
    end
    -- Setter
    
    function Abilities:getPosY()
        return BlzGetAbilityPosY(self.code)
    end
    -- Setter
    
    function Abilities:getActivatedPosX()
        return BlzGetAbilityActivatedPosX(self.code)
    end
    -- Setter
    
    function Abilities:getActivatedPosY()
        return BlzGetAbilityActivatedPosY(self.code)
    end
    -- Setter
    
    -- Other methods
    function Abilities:getManaCost(intLevel)
        return BlzGetAbilityManaCost(self.code, intLevel)
    end
    
    function Abilities:BlzGetAbilityCooldown(intLevel)
        return BlzGetAbilityCooldown(self.code, intLevel)
    end
    
    return Abilities
end
__modules["abilities"] = {initialized = false, cached = nil, loader = __module_4}
local function __module_5()
    local nativeRect = Rect
    local Rect = {}
    Rect.__index = Rect
    
    local function updateValues(rect)
        local handle = rect.handle
        rect._minX = GetRectMinX(handle)
        rect._minY = GetRectMinY(handle)
        rect._maxX = GetRectMaxX(handle)
        rect._maxY = GetRectMaxY(handle)
        rect._centerX = GetRectCenterX(handle)
        rect._centerY = GetRectCenterY(handle)
    end
    
    function Rect:create(minX, minY, maxX, maxY)
        local table = {}
        setmetatable(table, self)
        table.handle = nativeRect(minX, minY, maxX, maxY)
        updateValues(table)
        return table
    end
    
    function Rect:fromWorldBounds()
        local table = {}
        setmetatable(table, self)
        table.handle = GetWorldBounds()
        updateValues(table)
        return table
    end
    
    function Rect:destroy()
        RemoveRect(self.handle)
    end
    
    function Rect:set(minX, minY, maxX, maxY)
        SetRect(self.handle, minX, minY, maxX, maxY)
        updateValues(self)
    end
    function Rect:moveTo(centerX, centerY)
        MoveRectTo(self.handle, centerX, centerY)
        updateValues(self)
    end
    function Rect:getMinX()
        return self._minX
    end
    function Rect:getMinY()
        return self._minY
    end
    function Rect:getMaxX()
        return self._maxX
    end
    function Rect:getMaxY()
        return self._maxY
    end
    function Rect:getCenterX()
        return self._centerX
    end
    function Rect:getCenterY()
        return self._centerY
    end
    
    function Rect:getWidth()
        return self._maxX - self._minX
    end
    function Rect:setWidth(width)
        local halfWidth = width/2
        self:set(self._centerX - halfWidth, self._minY, self._centerX + halfWidth, self._maxY)
    end
    function Rect:getHeight()
        return self._maxY - self._minY
    end
    function Rect:setHeight(height)
        local halfHeight = height/2
        self:set(self._minX, self._centerY - halfHeight, self._maxX, self._centerY + halfHeight)
    end
    
    return Rect
end
__modules["rect"] = {initialized = false, cached = nil, loader = __module_5}
local function __module_6()
    local Lightning = {}
    Lightning.__index = Lightning
    
    function Lightning:create(strCodeName, checkVisibility, x1, y1, x2, y2)
        local table = {}
        setmetatable(table, self)
        table.handle = AddLightning(strCodeName, checkVisibility, x1, y1, x2, y2)
        return table
    end
    
    function Lightning:move(checkVisibility, x1, y1, x2, y2)
        MoveLightning(self.handle, checkVisibility, x1, y1, x2, y2)
    end
    
    function Lightning:destroy()
        return DestroyLightning(self.handle)
    end
    
    return Lightning
end
__modules["lightning"] = {initialized = false, cached = nil, loader = __module_6}
local function __module_7()
    
    local hookutils = {}
    
    
    function hookutils.hookTableAfter(hooks, table)
    
        for methodName,callback in pairs(hooks) do
            local original = table[methodName]
            table[methodName] = function (...) original(...) callback(...) end
        end
    end
    
    
    
    return hookutils
end
__modules["hookutils"] = {initialized = false, cached = nil, loader = __module_7}
local function __module_8()
    local Rect = require("rect")
    local Lightning = require("lightning")
    local hookutils = require("hookutils")
    
    local hooks = {}
    
    function hooks:moveTo()
        if self._lightnings then
            local minX = self:getMinX()
            local minY = self:getMinY()
            local maxX = self:getMaxX()
            local maxY = self:getMaxY()
    
            self._lightnings.top:move(false, minX, maxY, maxX, maxY)
            self._lightnings.bottom:move(false, minX, minY, maxX, minY)
            self._lightnings.left:move(false, minX, minY, minX, maxY)
            self._lightnings.right:move(false, maxX, minY, maxX, maxY)
        end
    end
    hooks.set = hooks.moveTo
    
    function hooks:destroy()
        self:removeLightning()
    end
    
    hookutils.hookTableAfter(hooks, Rect)
    
    function Rect:addLightning()
        if not self._lightnings then
            self._lightnings = {}
    
            local minX = self:getMinX()
            local minY = self:getMinY()
            local maxX = self:getMaxX()
            local maxY = self:getMaxY()
    
            self._lightnings.top = Lightning:create('DRAM', false, minX, maxY, maxX, maxY)
            self._lightnings.bottom = Lightning:create('DRAM', false, minX, minY, maxX, minY)
            self._lightnings.left = Lightning:create('DRAM', false, minX, minY, minX, maxY)
            self._lightnings.right = Lightning:create('DRAM', false, maxX, minY, maxX, maxY)
        end
    end
    
    function Rect:removeLightning()
        if self._lightnings then
            for _,lightning in pairs(self._lightnings) do
                lightning:destroy()
            end
            self._lightnings = nil
        end
    end
    
    
    
    return Rect
    
end
__modules["UserDefinedRects.rectLightning"] = {initialized = false, cached = nil, loader = __module_8}
local function __module_9()
    local WeatherEffect = {}
    WeatherEffect.__index = WeatherEffect
    
    function WeatherEffect:create(rect, strEffectId)
        local table = {}
        setmetatable(table, self)
        table.handle = AddWeatherEffect(rect.handle, FourCC(strEffectId))
        table._isEnabled = false
        table._typeId = strEffectId
        return table
    end
    
    function WeatherEffect:destroy()
        local effect = self.handle
        EnableWeatherEffect(effect, false)  -- If a weather effect is not disabled before being destroyed, its sound remains.
        RemoveWeatherEffect(effect)
    end
    
    function WeatherEffect:isEnabled()
        return self._isEnabled
    end
    
    function WeatherEffect:enable(boolEnable)
        self._isEnabled = boolEnable
        EnableWeatherEffect(effect, boolEnable)
    end
    
    function WeatherEffect:getTypeId()
        return self._typeId
    end
    
    return WeatherEffect
end
__modules["weathereffect"] = {initialized = false, cached = nil, loader = __module_9}
local function __module_10()
    local WeatherEffect = require("weathereffect")
    local Rect = require("rect")
    local hookutils = require("hookutils")
    
    
    local hooks = {}
    
    function hooks:moveTo()
        local effect = self._weatherEffect
    
        if effect then
            local typeId = effect:getTypeId()
            effect:destroy()
            self._weatherEffect = WeatherEffect:create(self, typeId)
            self._weatherEffect:enable(true)
        end
    end
    hooks.set = hooks.moveTo
    
    function hooks:destroy()
        self:removeWeather()
    end
    
    hookutils.hookTableAfter(hooks, Rect)
    
    function Rect:addWeather(strWeatherId)
        if not self._weatherEffect then
            self._weatherEffect = WeatherEffect:create(self, strWeatherId)
            self._weatherEffect:enable(true)
        end
    end
    
    function Rect:changeWeather(strWeatherId)
        local effect = self._weatherEffect
    
        if effect then
            self._weatherEffect:destroy()
            self._weatherEffect = WeatherEffect:create(self, strWeatherId)
            self._weatherEffect:enable(true)
        end
    end
    
    function Rect:removeWeather()
        local effect = self._weatherEffect
    
        if effect then
            effect:destroy()
            self._weatherEffect = nil
        end
    end
end
__modules["UserDefinedRects.rectWeather"] = {initialized = false, cached = nil, loader = __module_10}
local function __module_11()
    local Region = {}
    Region.__index = Region
    
    
    function Region:create()
        local table = {}
        setmetatable(table, self)
        table.handle = CreateRegion()
        return table
    end
    
    
    function Region:addRect(rect)
        RegionAddRect(self.handle, rect.handle)
    end
    function Region:clearRect(rect)
        RegionClearRect(self.handle, rect.handle)
    end
    
    function Region:addCell(x, y)
        RegionAddCell(self.handle, x, y)
    end
    function Region:clearCell(x, y)
        RegionClearCell(self.handle, x, y)
    end
    
    
    return Region
end
__modules["region"] = {initialized = false, cached = nil, loader = __module_11}
local function __module_12()
    local Rect = require("rect")
    local Region = require("region")
    
    --  Za Warudo should be empty.
    local metaWorld     = {}
    --World               = makeReadonly(metaWorld, 'World')
    
    ceres.addHook("main::before", function()
        metaWorld.RECT      = Rect:fromWorldBounds()
        metaWorld.REGION       = Region:create()
    
        metaWorld.MAX_X     = metaWorld.RECT.maxX
        metaWorld.MAX_Y     = metaWorld.RECT.maxY
        metaWorld.MIN_X     = metaWorld.RECT.minX
        metaWorld.MIN_Y     = metaWorld.RECT.minY
    
        metaWorld.REGION:addRect(metaWorld.RECT)
    end)
    
    return metaWorld
end
__modules["worldbounds"] = {initialized = false, cached = nil, loader = __module_12}
local function __module_13()
    local GenericUnitEvent = require("unitevents.generic")
    local worldbounds = require("worldbounds")
    require("unit")
    
    local onEnterMapFuncs = {}
    
    local function OnEnterMap()
        for _,func in ipairs(onEnterMapFuncs) do
            local r,e = pcall(func, unit.wrap(GetFilterUnit()))
            if not r then print(e) end
        end
        return false
    end
    
    function GenericUnitEvent:onEnterMap(callback)
        table.insert(onEnterMapFuncs, callback)
    end
    
    
    ceres.addHook('main::after', function()
        TriggerRegisterEnterRegion(CreateTrigger(), worldbounds.REGION.handle, Filter(OnEnterMap))
    end)
end
__modules["unitevents.generic.entermap"] = {initialized = false, cached = nil, loader = __module_13}
local function __module_14()
    local Abilities = require("abilities")
    local Rect = require("rect")
    require("UserDefinedRects.rectLightning")
    require("UserDefinedRects.rectWeather")
    
    local Event = require("unitevents.generic")
    require("unitevents.generic.entermap")
    
    local hookutils = require("hookutils")
    require("unit")
    
    local GENERATOR_ID = 'udr0'
    
    local ABILS = {}
    ABILS.CREATE_OR_DESTROY   = 'UDR2'
    ABILS.TOGGLE_VISIBILITY   = 'UDRA'
    ABILS.MOVE                = 'UDR4'
    ABILS.MOVE_TERRAIN        = 'UDRT'
    
    ABILS.RETRACT_Y           = 'UDR7'
    ABILS.EXPAND_Y            = 'UDR8'
    ABILS.EXPAND_X            = 'UDR6'
    ABILS.RETRACT_X           = 'UDR5'
    
    ABILS.CHANGE_WEATHER_NEXT = 'AUR0'
    ABILS.CHANGE_WEATHER_PREV = 'AUR1'
    ABILS.TOGGLE_WEATHER      = 'UDR9'
    
    ABILS.LOCK_UNITS          = 'UDR3'
    ABILS.UNLOCK_UNITS        = 'UDRB'
    
    ABILS.PAGE_NEXT = 'UDRQ'
    ABILS.PAGE_PREV = 'UDRR'
    
    ABILS.TOGGLE_FOG = 'UDRS'
    
    ABILS.FOG_STYLE_UP      = 'UDRI'
    ABILS.FOG_STYLE_DOWN    = 'UDRJ'
    
    ABILS.FOG_ZSTART_UP    = 'UDRK'
    ABILS.FOG_ZSTART_DOWN  = 'UDRL'
    
    ABILS.FOG_ZEND_UP      = 'UDRM'
    ABILS.FOG_ZEND_DOWN    = 'UDRN'
    
    ABILS.FOG_DENSITY_UP   = 'UDRO'
    ABILS.FOG_DENSITY_DOWN = 'UDRP'
    
    ABILS.FOG_RED_UP       = 'UDRC'
    ABILS.FOG_RED_DOWN     = 'UDRD'
    
    ABILS.FOG_GREEN_UP     = 'UDRG'
    ABILS.FOG_GREEN_DOWN   = 'UDRH'
    
    ABILS.FOG_BLUE_UP      = 'AUR2'
    ABILS.FOG_BLUE_DOWN    = 'UDRF'
    
    local PAGES = {
        {ABILS.CREATE_OR_DESTROY, ABILS.TOGGLE_VISIBILITY, ABILS.MOVE, ABILS.MOVE_TERRAIN,
         ABILS.RETRACT_X, ABILS.EXPAND_X, ABILS.RETRACT_Y, ABILS.EXPAND_Y, ABILS.LOCK_UNITS, ABILS.UNLOCK_UNITS},
    
        {ABILS.CHANGE_WEATHER_NEXT, ABILS.CHANGE_WEATHER_PREV, ABILS.TOGGLE_WEATHER, ABILS.TOGGLE_FOG, ABILS.FOG_STYLE_UP,
         ABILS.FOG_STYLE_DOWN, ABILS.FOG_ZSTART_UP, ABILS.FOG_ZSTART_DOWN, ABILS.FOG_ZEND_UP, ABILS.FOG_ZEND_DOWN},
    
        {ABILS.FOG_DENSITY_UP, ABILS.FOG_DENSITY_DOWN, ABILS.FOG_RED_UP, ABILS.FOG_RED_DOWN,
        ABILS.FOG_GREEN_UP, ABILS.FOG_GREEN_DOWN, ABILS.FOG_BLUE_UP, ABILS.FOG_BLUE_DOWN}
    }
    
    local function GetUnitCurrentPage(u)
        local currentPage
    
        for i,page in ipairs(PAGES) do
            if u:getAbilityLevel(page[1]) > 0 then
                currentPage = i
            end
        end
        return currentPage
    end
    
    Abilities:get(ABILS.PAGE_NEXT):onEffect(function(_, trigU)
        local currentPage = GetUnitCurrentPage(trigU)
    
        for _,abil in ipairs(PAGES[currentPage]) do
            trigU:removeAbility(abil)
        end
        for _,abil in ipairs(PAGES[currentPage%#PAGES + 1]) do
            trigU:addAbility(abil)
        end
    end)
    
    Abilities:get(ABILS.PAGE_PREV):onEffect(function(_, trigU)
        local currentPage = GetUnitCurrentPage(trigU)
    
        for _,abil in ipairs(PAGES[currentPage]) do
            trigU:removeAbility(abil)
        end
        for _,abil in ipairs(PAGES[(currentPage - 2)%#PAGES + 1]) do
            trigU:addAbility(abil)
        end
    end)
    
    Abilities:get(ABILS.CREATE_OR_DESTROY):onEffect(function(_, trigU)
        if trigU:hasAttachedRect() then
            trigU:destroyAttachedRect()
        else
            trigU:createAttachedRect()
        end
    end)
    
    Abilities:get(ABILS.MOVE):onEffect(function (_,trigU, target)
        print(target.getX())
        trigU:setPosition(target:getX(), target:getY())
    end)
    
    Abilities:get(ABILS.EXPAND_X):onEffect(function (_, trigU)
        local rect = trigU._attachedRect
        if rect then
            rect:setWidth(trigU._attachedRect:getWidth() + 64)
        end
    end)
    
    Abilities:get(ABILS.RETRACT_X):onEffect(function (_, trigU)
        local rect = trigU._attachedRect
        if rect then
            rect:setWidth(trigU._attachedRect:getWidth() - 64)
        end
    end)
    
    Abilities:get(ABILS.EXPAND_Y):onEffect(function (_, trigU)
        local rect = trigU._attachedRect
        if rect then
            rect:setHeight(trigU._attachedRect:getHeight() + 64)
        end
    end)
    
    Abilities:get(ABILS.RETRACT_Y):onEffect(function (_, trigU)
        local rect = trigU._attachedRect
        if rect then
            rect:setHeight(trigU._attachedRect:getHeight() - 64)
        end
    end)
    
    
    
    -- Remove Aatk and Amov on enter map, add first page of abilities
    ceres.addHook('main::after', function()
        Event:onEnterMap(function(trigU)
            print(trigU:getTypeId())
            if trigU:getTypeId() == GENERATOR_ID then
                trigU:removeAbility('Amov')
                trigU:removeAbility('Aatk')
                for _,abil in ipairs(PAGES[1]) do
                    print(abil)
                    trigU:addAbility(abil)
                end
            end
        end)
    end)
    
    -- --------------------------------
    -- Possibly subclass Rect?
    
    -- --------------------------------
    local hooks = {}
    
    local function updatePosition(unitGenerator)
        if unitGenerator._attachedRect then
            unitGenerator._attachedRect:moveTo(unitGenerator:getX(), unitGenerator:getY())
        end
    end
    
    hooks.setX = updatePosition
    hooks.setY = updatePosition
    hooks.setPosition = updatePosition
    
    
    local Unit = unit.metatable
    hookutils.hookTableAfter(hooks, Unit)
    
    function Unit:createAttachedRect()
        if not self._attachedRect then
            local rect = Rect:create(0,0,64,64)
            self._attachedRect = rect
            updatePosition(self)
            rect:addLightning()
            rect:addWeather('RAhr')
        end
    end
    
    function Unit:destroyAttachedRect()
        if self._attachedRect then
            self._attachedRect:destroy()
            self._attachedRect = nil
        end
    end
    
    function Unit:hasAttachedRect()
        if self._attachedRect then return true else return false end
    end
    
    
end
__modules["UserDefinedRects.rectGenerator"] = {initialized = false, cached = nil, loader = __module_14}
local function __module_15()
    require("unit")
    local Player = require("player")
    require("UserDefinedRects.rectGenerator")
    
    
    
    
    
    
    
    local function a()
        local trig = CreateTrigger()
        TriggerRegisterPlayerChatEvent(trig, Player:fromId(0).handle, "-rect", true)
        TriggerAddAction(trig, function()
            print(1)
            local u = unit.create(Player:fromId(0), FourCC('udr0'), 0., 0., 270.)
            print(2, u)
    
        end)
    end
    
    ceres.addHook("main::after",  a)
end
__modules["main"] = {initialized = false, cached = nil, loader = __module_15}

-- ceres post-script start

ceres.__oldMain = main
ceres.__oldConfig = config

function main()
    __ceresMain()
end

function config()
    __ceresConfig()
end

ceres.catch(require("main"))

-- ceres post-script end
