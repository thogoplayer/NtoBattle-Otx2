local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_YINDAMAGE)		---ataque nivel 350
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -67, 1, -72, 1)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 4.0
local storage = 963563

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}
local pos = getCreaturePosition(cid)
exhaustion.set(cid, storage, waittime)
addEvent(doSendMagicEffect, 1, {x = pos.x+3, y = pos.y+0, z = pos.z}, 0)
doSendMagicEffect(position1, 335)
return doCombat(cid, combat, var)
end
