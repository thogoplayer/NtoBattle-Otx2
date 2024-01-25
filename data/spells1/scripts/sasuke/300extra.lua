local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, CONDITION_KATON)   ---ataque nivel 300
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -55, 1, -60, 1)

local distance = createCombatObject()
setCombatParam(distance, COMBAT_PARAM_DISTANCEEFFECT, 39)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 2.0-- Tempo de exhaustion
local storage = 774372

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local pos = getCreaturePosition(cid)
exhaustion.set(cid, storage, waittime)
addEvent(doSendMagicEffect, 100, position1, 74)
addEvent(doCombat, 100, cid, distance, var)
addEvent(doCombat, 100, cid, combat, var)
return true
end


