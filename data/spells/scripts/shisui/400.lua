local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENTONDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 105)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -50, 1, -52, 1)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 5.5
local storage = 663563

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+3, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local pos = getCreaturePosition(cid)
addEvent(doSendMagicEffect, 1, {x = pos.x+2, y = pos.y+1, z = pos.z}, 518)
addEvent(doSendMagicEffect, 2, {x = pos.x-3, y = pos.y, z = pos.z}, 519)
addEvent(doSendMagicEffect, 3, {x = pos.x+4, y = pos.y, z = pos.z}, 520)
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(position1, 0)
addEvent(doCombat,100,cid, combat, var)
return doCombat(cid, combat, var)
end
