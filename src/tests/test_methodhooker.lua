-- Example usage

local test = MethodHooker.hookableMetatable()


function test:create()
    local table = {}
    setmetatable(table, self)
    return table
end

function test:test() print(1) end

local hooks = MethodHooker:create()

function hooks:test()
    print(0)
end

local hooksAfter = MethodHooker:create()

function hooksAfter:test()
    print(2)
end

local function aaa()
    local table = test:create()
    hooks:hookBefore(table)
    hooksAfter:hookAfter(table)
    table:test()
end

ceres.addHook("main::after",  aaa)