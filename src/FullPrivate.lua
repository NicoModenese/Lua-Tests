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

local function newAccount(accName)
    local self = {
        accName = accName or "",
        keystones = {}
    }
    
    local function getName()
        return self.accName
    end
    
    local function addKeystone(keystone)
        self.keystones[keystone.getCharName()] = keystone
    end
    
    local function getKeystones()
        return self.keystones
    end
    
    return {
        getName = getName,
        addKeystone = addKeystone,
        getKeystones = getKeystones
    }
end


local function UnitName(name)
    if name == "player" then
        return "Draintrain"
    end
end

if not keysDB then
    keysDB = {}
end

myAccName = "Fatally"

myAcc = newAccount(myAccName)
myAcc.addKeystone(newKeystone("Draintrain", 101, 14))
myAcc.addKeystone(newKeystone("Waklj", 102, 13))

anotherAcc = newAccount("Ionic")
anotherAcc.addKeystone(newKeystone("Daro", 102, 16))
anotherAcc.addKeystone(newKeystone("Funfunfun", 101, 14))

keysDB[myAcc.getName()] = myAcc
keysDB[anotherAcc.getName()] = anotherAcc

--keysDB[myAccName].keys[2] = "ok"

for accName, acc in pairs(keysDB) do
    print(accName)
    for charName, key in pairs(acc.getKeystones()) do
        print(charName)
        print(key.toString())
    end
end



