local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -80.3, 1, -90.3, 1)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

local function effect15(position1)
doSendMagicEffect(position1, 0)
end

function onCastSpell(cid, var)

if isPlayer(cid) and exhaustion.check(cid, 13155) == true then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end
local poss = getCreaturePosition(getCreatureTarget(cid))

local function Flame_Shoot()
if isCreature(cid) then
local pos2 = {x=poss.x+(math.random(-2,2)), y=poss.y-(math.random(2,3)), z=poss.z}
local pos3 = {x=poss.x+(math.random(-2,2)), y=poss.y+(math.random(-2,2)), z=poss.z}
local pos4 = {x=pos2.x, y=pos2.y+2, z=pos2.z}
local pos5 = {x=poss.x+(math.random(-2,2)), y=poss.y-(math.random(2,3)), z=poss.z}
local pos6 = {x=pos5.x, y=pos5.y+2, z=pos5.z}
addEvent(doSendDistanceShoot, 1800,pos2, pos4, 88)
addEvent(doSendDistanceShoot, 1800,pos5, pos6, 88)
doSendMagicEffect(pos2, 517)
addEvent(Flame_Shoot, 500)
addEvent(doSendMagicEffect, 1900,pos4, 462)
addEvent(doSendMagicEffect, 1900,pos6, 462)
end
return true
end


local position = {x=getThingPosition(cid).x, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+3, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local parameters = { cid = cid, var = var}
doSendMagicEffect(position, 48)
addEvent(Flame_Shoot, 500)
addEvent(stopEvent, 5000, Flame_Shoot)
exhaustion.set(cid, 13155, 1.2)
addEvent(onCastSpell1, 350, parameters)
addEvent(effect15, 350, position1)
return true
end
