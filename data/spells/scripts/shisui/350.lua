local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENTONDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -68, 1, -72, 1)



function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 4.0 -- Tempo de exhaustion
local storage = 963563
if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+0, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
exhaustion.set(cid, storage, waittime)
local pos = getCreaturePosition(cid)
addEvent(doSendMagicEffect, 1, {x = pos.x+5, y = pos.y, z = pos.z}, 0)
doSendMagicEffect(position1, 530)
return doCombat(cid, combat, var)
end
