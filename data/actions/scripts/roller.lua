RollerCoaster = {}
RollerCids = {}

function RollerCoaster:onchangeLevel(cid, fromZ, toZ)
return TRUE
end

function RollerCoaster:onmove(cid, rail, railInfo, pos)
return TRUE
end

function RollerCoaster:onchangeSpeed(cid, power)
if power == 2 then
doSendAnimatedText(getCreaturePosition(cid),"TROC TROC",20)
else
doSendAnimatedText(getCreaturePosition(cid),"TSSSIIIIII",20)
end
return TRUE
end

function RollerCoaster:onTypeChange(cid, fromType, toType)
return TRUE
end

function RollerCoaster:onExitQuery(cid)
RollerCids[cid] = nil
return TRUE
end

function RollerCoaster:onExit(cid)
return TRUE
end

function RollerCoaster:onEnterQuery(cid, cart)
return TRUE
end

function RollerCoaster:onEnter(cid, cartID)
return TRUE
end 
-- End Lib

local TRAINS = {7131, 7132}
local all = {7121, 7122, 7123, 7124, 7125, 7126, 7133, 7134, 7135, 7136}

local ACTION_TRAIN = {1001, 1002}

local RAILS = {
{id = all[1], dirs = {{dir = SOUTH, out = 2},{dir = NORTH, out = 2}}}, 
{id = all[2], dirs = {{dir = EAST, out = 1},{dir = WEST, out = 1}}},
{id = all[3], dirs = {{dir = EAST, out = 1},{dir = SOUTH, out = 2}}},
{id = all[4], dirs = {{dir = WEST, out = 1},{dir = SOUTH, out = 2}}},
{id = all[5], dirs = {{dir = EAST, out = 1},{dir = NORTH, out = 2}}},
{id = all[6], dirs = {{dir = WEST, out = 1},{dir = NORTH, out = 2}}},
{id = all[7], stop = 1},
{id = all[8], stop = 1},
{id = all[9], stop = 1},
{id = all[10], stop = 1},
}

local SLOW = 125
local FAST = 50
local INCREASE = 50
local DECREASE = 50
local DOWN_INCREASE = 450
local UP_DECREASE = 155

local INFOS = {}

TRUE = 1
FALSE = 0


function getRail(pos)
local stack = 1 
local found = 0
local rail
repeat
pos.stackpos = stack
rail = getThingfromPos(pos)
if rail.itemid == 0 then
break
end
for i, r in ipairs(RAILS) do
if (rail.itemid == r.id) then
found = 1
break
end 
end
stack = stack + 1
until (found == 1)
return rail
end

function moveTrain(cid)
local params, pos, rail, newid
local dir = -1
if isCreature(cid) then
params = INFOS[cid]
pos = getCreaturePosition(cid)
rail = getRail(pos)
for i,r in ipairs(RAILS) do
if rail.itemid == r.id then
if RollerCoaster:onmove(cid, rail, r, pos) == FALSE then
table.remove(INFOS, cid)
return 1
end 
if r.stop ~= nil then
if r.stop == 1 then
RollerCoaster:onExitQuery(cid)
addEvent(exitTrain, 200, cid)
return 1
end
end 
local change = rail.actionid - 1000
local power = 0
local power = change

doChangeType(cid, r.id, INFOS[cid].beforeid)
info = r.dirs[INFOS[cid].type]
dir = info.dir 
if power == 1 or power == 2 then
if RollerCoaster:onchangeSpeed(cid, power) then
if power == 2 then
INFOS[cid].speed = INFOS[cid].speed - INCREASE
elseif power == 1 then
INFOS[cid].speed = INFOS[cid].speed + DECREASE
end
end
end
if INFOS[cid].currZ ~= pos.z then
if RollerCoaster:onchangeLevel(cid, INFOS[cid].currZ, pos.z) then
if INFOS[cid].currZ > pos.z then
INFOS[cid].speed = INFOS[cid].speed + UP_DECREASE
elseif params.currZ < pos.z then 
params.speed = params.speed - DOWN_INCREASE
end 
end 
end
if params.speed < 1 then
params.speed = 1
end
params.currZ = pos.z
newid = TRAINS[info.out]
INFOS[cid].beforeid = r.id
break
end
end
end 
if dir ~= -1 then
doSetItemOutfit(cid, newid, -1)
doMoveCreature(cid, dir)
addEvent(moveTrain, params.speed, cid)
else
RollerCoaster:onExitQuery(cid)
addEvent(exitTrain, 2000, cid)
end
end

function exitTrain(cid)
table.remove(INFOS, cid)
RollerCoaster:onExit(cid)
doSetItemOutfit(cid, TRAINS[1], 0)
local pos = getCreaturePosition(cid)
pos.y = pos.y - 1
doTeleportThing(cid, pos, 1)
doCreatureSetNoMove(cid, 0)
end

function enterTrain(cid, item, type) 
if RollerCoaster:onEnter(cid, item) then
doSetItemOutfit(cid, item, -1)
local pos = getCreaturePosition(cid)
table.insert(INFOS, cid, {type = type, speed = SLOW, currZ = pos.z}) 
addEvent(moveTrain, 1000, cid)
end
end

function getSpeed(cid)
if INFOS[cid].speed ~= nil then
return INFOS[cid].speed
end
return FALSE
end

function setSpeed(cid, speed)
if INFOS[cid].speed ~= nil then
INFOS[cid].speed = speed
return TRUE
end
return FALSE
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
if isInArray(ACTION_TRAIN, item.actionid) then
if RollerCoaster:onEnterQuery(cid, item) and RollerCids[cid] == nil then
doTeleportThing(cid, toPosition, 1)
doCreatureSetNoMove(cid, 1)
RollerCids[cid] = addEvent(enterTrain, 500, cid, item.itemid, item.actionid-1000)
end
end
return TRUE
end


----"No Scripting Needed" System-----
local change = {}
change[all[1]] = {all[3], all[4]}
change[all[2]] = {all[4], all[6]}
change[all[3]] = {all[1], all[4], all[6]}
change[all[4]] = {all[1], all[2], all[3], all[5], all[6]}
change[all[5]] = {all[4]}
change[all[6]] = {all[2], all[3], all[4]}
change[all[7]] = {}
change[all[8]] = {}
change[all[9]] = {}
change[all[10]] = {}

function doChangeType(cid, id, beforeID)
if table.getn(change[id]) > 0 then
if isInArray(change[id],beforeID) then
if INFOS[cid].type == 1 then
INFOS[cid].type = 2
else
INFOS[cid].type = 1
end
end
end
end