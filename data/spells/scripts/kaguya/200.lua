local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_YINDAMAGE)	---ataque nivel 200
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -25, 1, -30, 1)

local distance = createCombatObject()
setCombatParam(distance, COMBAT_PARAM_DISTANCEEFFECT, 0)


function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 1.0-- Tempo de exhaustion
local storage = 899123


if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+3, z=getThingPosition(getCreatureTarget(cid)).z}
local pos = getCreaturePosition(cid)
exhaustion.set(cid, storage, waittime)
doSendMagicEffect({x = pos.x+3, y = pos.y+1, z = pos.z}, 972)
addEvent(doSendMagicEffect, 200, position1, 814)
addEvent(doCombat, 200, cid, distance, var)
return addEvent(doCombat, 400, cid, combat, var)
end
