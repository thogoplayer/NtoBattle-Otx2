-- local combat = createCombatObject()
-- setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)		---balanço nivel 300
-- setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 138)
-- setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
-- setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
-- setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -17, 1, -18.5, 1)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 2.0
local storage = 774372

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
-- local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
-- doSendMagicEffect(position1, 0)
-- exhaustion.set(cid, storage, waittime)
-- addEvent(doCombat,100,cid, combat, var)
-- addEvent(doCombat,300,cid, combat, var)
-- addEvent(doCombat,500,cid, combat, var)
-- return doCombat(cid, combat, var)
-- end

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)		---balanço nivel 300
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -50, 1, -55, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 1076)

arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 3, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 3, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end


function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 2.0
local storage = 774372
if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end

local parameters = {cid = cid, var = var}
local position = getCreaturePosition(cid)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 100, parameters)
addEvent(onCastSpell1, 100, parameters)
for i = 1, 40 do
doSendDistanceShoot(position, {x=position.x+math.random(-5,5), y=position.y+math.random(-5,5), z=position.z}, 132)
end
return TRUE
end



