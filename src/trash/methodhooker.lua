local MethodHooker = {}
MethodHooker.__index = MethodHooker

local hookCache = {}

function MethodHooker:create()
    local table = {}
    setmetatable(table, self)
    return table
end

function MethodHooker:hookBefore(table)
    if not table._beforeHooks then
        table._beforeHooks = {}
    end
    table._beforeHooks[self] = true
end


function MethodHooker:hookAfter(table)
    if not table._afterHooks then
        table._afterHooks = {}
    end
    table._afterHooks[self] = true
end

function MethodHooker:unhookAfter(table)
    table._afterHooks[self] = nil
    if next(table._afterHooks) == nil then
        table._afterHooks = nil
    end
end

function MethodHooker:unhookBefore(table)
    table._beforeHooks[self] = nil
    if next(table._beforeHooks) == nil then
        table._beforeHooks = nil
    end
end

local function HookedMethod(table, index)
    local metatable = getmetatable(table)
    local field = metatable[index]
    if type(field) ~= 'function' then
        return field
    end

    local func = hookCache[metatable][index]
    if not func then
        func = function(self, ...)
            if self._beforeHooks then
                for hook,_ in pairs(self._beforeHooks) do
                    if hook[index] then
                        hook[index](self, ...)
                    end
                end
            end
            local value = field(self, ...)
            if self._afterHooks then
                for hook,_ in pairs(self._afterHooks) do
                    if hook[index] then
                        hook[index](self, value, ...)
                    end
                end
            end
            return value
        end
        hookCache[metatable][index] = func
    end
    return func
end

function MethodHooker.hookableMetatable()
    local table = {}
    hookCache[table] = {}
    table.__index = HookedMethod
    return table
end

return MethodHooker