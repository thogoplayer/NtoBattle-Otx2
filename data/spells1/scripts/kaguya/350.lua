local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_YINDAMAGE)	---ataque nivel 350
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -65, 1, -70, 1)

local distance = createCombatObject()
setCombatParam(distance, COMBAT_PARAM_DISTANCEEFFECT, 0)


function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 4.0-- Tempo de exhaustion
local storage = 963563


if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+3, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
local pos = getCreaturePosition(cid)
exhaustion.set(cid, storage, waittime)
doSendMagicEffect({x = pos.x+2, y = pos.y+2, z = pos.z}, 0)
addEvent(doSendMagicEffect, 100, position1, 811)
addEvent(doCombat, 200, cid, distance, var)
return addEvent(doCombat, 500, cid, combat, var)
end
