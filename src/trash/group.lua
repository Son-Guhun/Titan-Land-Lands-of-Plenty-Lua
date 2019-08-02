local Unit = require("Unit")

local Group = {}
Group.__index = Group

function Group:create()
    local table = {}
    setmetatable(table, Group)

    table.handle = CreateGroup()
    return table
end

function Group:addUnit(whichUnit)
    return GroupAddUnit(self.handle, whichUnit.handle)
end
function Group:removeUnit(whichUnit)
    return GroupRemoveUnit(self.handle, whichUnit.handle)
end


function Group:addGroup(addGroup)
    return BlzGroupAddGroupFast(self.handle, addGroup.handle)
end
function Group:removeGroup(removeGroup)
    return GroupRemoveGroup(self.handle, removeGroup.handle)
end

function Group:clear()
    GroupClear(self.handle)
end

function Group:getSize()
    return BlzGroupGetSize(self.handle)
end

function Group:firstOf()
    return Unit:wrap(FirstOfGroup(self.handle))
end
function Group:unitAt(index)
    return Unit:wrap(BlzGroupUnitAt(self.handle, index))
end

function Group:enumUnitsOfType(strUnitName)
    return GroupEnumUnitsOfType(self.handle, strUnitName, nil)
end
function Group:enumUnitsOfPlayer(whichPlayer)
    return GroupEnumUnitsOfPlayer(self.handle, whichPlayer.handle, nil)
end
function Group:enumUnitsInRect(whichRect)
    GroupEnumUnitsInRect(self.handle, whichRect.handle, nil)
end



function Group:add()
    -- Adds both units and groups
end

function Group:remove()
    -- Adds both units and groups
end

function Group:iter()
    local index = 0
    local group = self.handle
    return function()
        local i = index
        index = i + 1
        return Unit:wrap(BlzGroupUnitAt(group, i))
    end
end

function Group:consume()
    return function()
        local u = self:firstOf()
        if u then
            self:removeUnit(u)
            return u
        else
            self:destroy()
        end
    end
end


return Group