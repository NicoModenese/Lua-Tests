--[[local function newAccount(accName)
    -- account initialization
    local self = {
        accName = accName or "dummy"
        keys = {}
    }
    
    -- get and set function block
    local function getAccName()
        return self.accName
    end
    
    -- return reference to private functions
    return {
        getAccName = getAccName
    }
end]]

local function newKeystone(charName, dungeonID, level)
    -- object initialization
    local self = {
        charName = charName or "",
        dungeonID = dungeonID or -1,
        level = level or -1
    }

    -- dungeonID to dungeonName lookup table
    local dungeonIDtoName = {
        [-1] = "",
        [101] = "Maw of Souls",
        [102] = "The Arcway"
    }

    -- get and set function block
    local function getCharName()
        return self.charName
    end

    local function setCharName(charName)
        self.charName = charName
    end

    local function getDungeonID()
        return self.dungeonID
    end

    local function setDungeonID(dungeonID)
        self.dungeonID = dungeonID
    end

    local function getDungeonName()
        return dungeonIDtoName[getDungeonID()]
    end

    local function getLevel()
        return self.level
    end

    local function setLevel(level)
        self.level = level
    end

    -- miscellaneous functions
    local function toString()
        return "Charakter " .. getCharName() .. (getDungeonID() ~= -1 and getLevel() ~= -1 and " hat Instanz '" 
        .. getDungeonName() .. "' auf Level " .. getLevel() .. "." or " besitzt keinen Keystone.")
    end

    -- return reference to private functions
    return {
        getCharName = getCharName,
        setCharName = setCharName,
        getDungeonID = getDungeonID,
        setDungeonID = setDungeonID,
        getDungeonName = getDungeonName,
        getLevel = getLevel,
        setLevel = setLevel,

        toString = toString
    }
end

key1 = newKeystone("Draintrain", 101)
key1.setCharName("Swagger")

account1 = {}
account1.name = "Fatally"
account1[1] = key1
account1[2] = newKeystone("Waklj", 102, 15)

a = account1[1]
a.setLevel(5)


for key, value in ipairs(account1) do
    print(value.toString())
end
print(#account1)

tbl = {
    name = "Fatally",
    keys = {}
}

tbl.keys[1] = newKeystone()

