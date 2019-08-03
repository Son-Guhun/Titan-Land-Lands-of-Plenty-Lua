local decobuilders = require('LoP.decobuilders')

RGB_SPECIAL = {255, 165, 0, 255}
RGB_BASIC = {255, 255, 255, 255}
RGB_ADVANCED = {255, 0, 0, 255}

local function initDecoTents()
    local decoRect = gg_rct_Deco_Tents_Rect

    local xStep = 256.
    local yStep = 192.

    local xMax = GetRectMaxX(decoRect) - xStep
    local xMin = GetRectMinX(decoRect)
    local yMax = GetRectMaxY(decoRect)
    local yMin = GetRectMinY(decoRect)

    local xStart = xMin + xStep/2.
    local yStart = yMin + yStep/2.
    local xCur = xStart
    local yCur = yStart

    print('hello')
    local function createTents(array, name, RGB)
        local decoTentCount = 1
        local i = 1
        while i <= #array do
            print('Tent:', decoTentCount)
            local decoTent = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('n03H'), xCur, yCur, bj_UNIT_FACING)
            BlzSetUnitName(decoTent, "Deco Tent " .. name .. " " .. I2S(decoTentCount))
            SetUnitVertexColor(decoTent, table.unpack(RGB))

            local j = 0
            while j < bj_MAX_STOCK_UNIT_SLOTS and i <= #array do
                print('Deco', i, ':', array[i])
                AddUnitToStock(decoTent, FourCC(array[i]), 1, 3)
                i, j = i+1, j+1
            end

            xCur = xCur + xStep
            if xCur > xMax then
                yCur = yCur + yStep
                xCur = xStart
            end
            decoTentCount = decoTentCount + 1
        end
    end

    createTents(decobuilders.typeIds.specialDecos, 'Special', RGB_SPECIAL)
    createTents(decobuilders.typeIds.basicDecos, 'Basic', RGB_BASIC)
    createTents(decobuilders.typeIds.advancedDecos, 'Advanced', RGB_ADVANCED)

    print('done')
end

return initDecoTents

