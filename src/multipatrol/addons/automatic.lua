require('unitevents.generic.order')
local multipatrol = require('multipatrol.core')

local patrolId

---@param orderId integer
---@param trigU Unit
---@param x number
---@param y number
unitevents.generic.onPointOrder(function(orderId, trigU, x, y)
    if orderId == patrolId and not multipatrol.isSystemOrder() then
        if trigU:hasPatrolPath() then
            trigU:addPatrolPoint(x, y)
            trigU:resumePatrol()
        else
            trigU:createPatrolPath(trigU:getX(), trigU:getY(), x, y)
        end
    end
end)

ceres.addHook('main::after', function()
    patrolId = OrderId('patrol')
end)
