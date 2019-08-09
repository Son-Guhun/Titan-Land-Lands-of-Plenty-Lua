require('stdlib.handle.__all')

worldbounds = {}
--World               = makeReadonly(metaWorld, 'World')

ceres.addHook("main::before", function()
    worldbounds.RECT      = rect.fromWorldBounds()
    worldbounds.REGION    = region.create()

    worldbounds.MAX_X     = worldbounds.RECT:getMaxX()
    worldbounds.MAX_Y     = worldbounds.RECT:getMaxY()
    worldbounds.MIN_X     = worldbounds.RECT:getMinX()
    worldbounds.MIN_Y     = worldbounds.RECT:getMinY()

    worldbounds.REGION:addRect(worldbounds.RECT)
end)

return worldbounds