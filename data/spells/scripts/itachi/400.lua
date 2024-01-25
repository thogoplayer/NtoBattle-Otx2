local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_YINDAMAGE)		---ataque nivel 400
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -78, 1, -82, 1)

local distance = createCombatObject()
setCombatParam(distance, COMBAT_PARAM_DISTANCEEFFECT, 153)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 5.5-- Tempo de exhaustion
local storage = 663563

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
local pos = getCreaturePosition(cid)
exhaustion.set(cid, storage, waittime)
doSendMagicEffect({x = pos.x+3, y = pos.y, z = pos.z}, 285)
addEvent(doSendMagicEffect, 200, position1, 286)
addEvent(doCombat, 100, cid, distance, var)
return addEvent(doCombat, 300, cid, combat, var)
end
