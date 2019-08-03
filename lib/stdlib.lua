require('handle')

require('abilities')

require('hookutils')

require('unitevents.generic')


function math.distance(x0, y0, x, y)
    local deltaX,deltaY = x-x0,y-y0
    return math.sqrt(deltaX*deltaX + deltaY*deltaY)
end

stdlib = {}
function stdlib.DO_NOTHING() end