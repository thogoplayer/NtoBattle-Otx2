local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)		---ataque nivel 170
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -35, 1, -40, 1)

local distance = createCombatObject()
setCombatParam(distance, COMBAT_PARAM_DISTANCEEFFECT, 25)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 1.5-- Tempo de exhaustion
local storage = 665778

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local pos = getCreaturePosition(cid)
exhaustion.set(cid, storage, waittime)
addEvent(doSendMagicEffect, 100, position1, 917)
addEvent(doCombat, 100, cid, distance, var)
return addEvent(doCombat, 200, cid, combat, var)
end
