require('handle')

--  Za Warudo should be empty.
local metaWorld     = {}
--World               = makeReadonly(metaWorld, 'World')

ceres.addHook("main::before", function()
    metaWorld.RECT      = rect.fromWorldBounds()
    metaWorld.REGION       = region.create()

    metaWorld.MAX_X     = metaWorld.RECT.maxX
    metaWorld.MAX_Y     = metaWorld.RECT.maxY
    metaWorld.MIN_X     = metaWorld.RECT.minX
    metaWorld.MIN_Y     = metaWorld.RECT.minY

    metaWorld.REGION:addRect(metaWorld.RECT)
end)

return metaWorld