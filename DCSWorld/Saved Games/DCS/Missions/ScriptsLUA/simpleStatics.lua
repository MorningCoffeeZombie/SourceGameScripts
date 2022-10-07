--[[

@author Wizard#5064 (▼皿▼)

@script Simple Statics

@version 0.0.2

@github link https://github.com/Wizxrd/MissionScripts/tree/main/Simple%20Statics

@description
standalone script to activate and deactivate statics an endless amount of times.

@config
1. include simpleStatics.lua into your mission:
    TRIGGERS: ONCE -> CONDITIONS: TIME MORE (1) -> ACTIONS:DO SCRIPT FILE (simpleStatics.lua)

2. add your static objects in the mission editor with the defined prefix of "LA"
    example: "LA Outpost"

3. add a simple trigger to activate
    TRIGGERS: ONCE -> CONDITIONS: TIME MORE (5) -> ACTIONS: DO SCRIPT (static.activate("LA Outpost"))

4. add a simple trigger to deactivate
    TRIGGERS: ONCE -> CONDITIONS: TIME MORE (10) -> ACTIONS: DO SCRIPT (static.deactivate("LA Outpost"))

@limitations
- static group and unit names must be the same
- you can only activate a static object if you've given it the a name with the prefix "LA"
- you can deactive any static object by name, but any static you deactivate without the prefix "LA" cannot be activated
  again and statics with the prefix "LA" can be activated again
- activating a static that has previously been destroyed will spawn in the desctruction
- if you're in F10 and a static is deactivated within your screens view of the map, it will stick visually to your screen

@features
- any static object name given the prefix "LA" will be deactivated at mission start to mimic the actual late activation option

]]--

-- set true or false to send info and error messages to dcs.log
local _logMsg = true

-- set true or false to send in game messages when activated/deactivated
local _gameMsg = true

-- set a time in seconds for in game messages if enabled
local _msgTime = 10

----------------------------------------------------------------------------------------------------------------------------
-- dont change below here
----------------------------------------------------------------------------------------------------------------------------

static = {}
local staticDB = {}
local staticPrefix = "LA"
local _info = function(msg,...) if _logMsg then env.info("**simpleStatic info:** "..string.format(msg,...)) end end
local _error = function(msg,...) if _logMsg then env.info("**simpleStatic error:** "..string.format(msg,...)) end end
local _msg = function(msg,...) if _gameMsg then trigger.action.outText(string.format(msg,...), _msgTime) end end

local major = 0
local minor = 0
local release = 2

----------------------------------------------------------------------------------------------------------------------------
-- user functions
----------------------------------------------------------------------------------------------------------------------------

-- activate a static object by name if it isn't already activated
-- @param #string staticName
-- you can only use this for statics that have the defined prefix "LA"
function static.activate(staticName)
    if staticDB[staticName] then
        if not StaticObject.getByName(staticName) then
            local staticObj = staticDB[staticName]
            coalition.addStaticObject(staticObj.countryId, staticObj.staticData)
            _info("activated static name %s", staticName)
            _msg("activated static name %s", staticName)
        else
            _error("can't activate already activated static %s", staticName)
        end
    else
        _error("can't find static name %s in staticDB", staticName)
    end
end

-- deactivate a static object by name if it isn't already deactivated
-- @param #string groupPrefix prefix of a set of groups
-- you can use this for any static name that is currently alive in the mission
function static.deactivate(staticName)
    if staticDB[staticName] then -- existst in database
        if StaticObject.getByName(staticName) then
            local staticObj = staticDB[staticName]
            StaticObject.getByName(staticName):destroy()
            _info("deactivated static name %s", staticName)
            _msg("deactivated static name %s", staticName)
        else
            _error("can't deactivate already deactivated static %s", staticName)
        end
    elseif StaticObject.getByName(staticName) then
        StaticObject.getByName(staticName):destroy()
        _info("deactivated static name %s", staticName)
        _msg("deactivated static name %s", staticName)
    else
        _error("can't find static name %s in staticDB", staticName)
    end
end

-- activate a "group" of static objects by a prefix
-- @param #string groupPrefix prefix of a set of groups
-- usable only for static objects with the prefix of "LA"
function static.activateGroups(groupPrefix)
    local addedGroups = {}
    for staticName in pairs(staticDB) do
        if string.find(staticName, groupPrefix) then
            if not StaticObject.getByName(staticName) then
                local staticObj = staticDB[staticName]
                _info("activated static %s under prefix %s", staticName, groupPrefix)
                coalition.addStaticObject(staticObj.countryId, staticObj.staticData)
                addedGroups[#addedGroups+1] = "\n"..staticName
            else
                _error("can't activate static %s under prefix %s", staticName, groupPrefix)
            end
        end
    end

    if addedGroups[1] ~= nil then
        local addedGroupsStr = table.concat(addedGroups)
        _msg("activated groups under prefix %s: %s", groupPrefix, addedGroupsStr)
    end
end

-- deactivate a "group" of static objects by a prefix
-- @param #string staticName prefix
-- usable for any static object that is alive
function static.deactivateGroups(groupPrefix)
    local removedGroups = {}
    for staticName in pairs(staticDB) do
        if string.find(staticName, groupPrefix) then
            if StaticObject.getByName(staticName) then
                _info("deactivated static %s under prefix %s", staticName, groupPrefix)
                StaticObject.getByName(staticName):destroy()
                removedGroups[#removedGroups+1] = "\n"..staticName
            else
                _error("can't deactivate static %s under prefix %s", staticName, groupPrefix)
            end
        end
    end

    if removedGroups[1] ~= nil then
        local removedGroupsStr = table.concat(removedGroups)
        _msg("deactivated groups under prefix %s: %s", groupPrefix, removedGroupsStr)
    end
end

----------------------------------------------------------------------------------------------------------------------------
-- build static database
----------------------------------------------------------------------------------------------------------------------------

-- build the static object database
-- for all all coalitions
-- will only add statics that have the prefix of "LA"
local function buildStaticDB()
    for coaSide, coaData in pairs(env.mission.coalition) do
        if type(coaData) == "table" then
            if coaData.country then -- country has data
                for ctryId, ctryData in pairs(coaData.country) do
                    for objType, objData in pairs(ctryData) do
                        if objType == "static" then
                            for staticId, staticData in pairs(objData.group) do
                                local staticName = staticData.name
                                if string.find(staticName, staticPrefix) then
                                    staticDB[staticData.name] = {
                                        ["name"] = staticData.name,
                                        ["staticData"] = staticData.units[1],
                                        ["countryId"] = ctryData.id
                                    }
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    -- destroy statics once created in staticDB to mimic late activation
    for staticName in pairs(staticDB) do
        _info("late activation set for %s", staticName)
        StaticObject.getByName(staticName):destroy()
    end
end

----------------------------------------------------------------------------------------------------------------------------
-- main
----------------------------------------------------------------------------------------------------------------------------
_info("simpleStatics.lua mk %d.%d.%d succesfully loaded", major, minor, release)

buildStaticDB()