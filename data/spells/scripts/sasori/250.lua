local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)		---ataque nivel 400
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -45, 1, -50, 1)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 2.0 -- Tempo de exhaustion
local storage = 774372

if exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local pos = getCreaturePosition(cid)
exhaustion.set(cid, storage, waittime)
addEvent(doSendMagicEffect, 1, {x = pos.x+1, y = pos.y, z = pos.z}, 0)
doSendMagicEffect(position1, 219)
return doCombat(cid, combat, var)
end
