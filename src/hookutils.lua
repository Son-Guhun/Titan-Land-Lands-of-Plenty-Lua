
local hookutils = {}


function hookutils.hookTableAfter(hooks, table)

    for methodName,callback in pairs(hooks) do
        local original = table[methodName]
        table[methodName] = function (...) original(...) callback(...) end
    end
end



return hookutils