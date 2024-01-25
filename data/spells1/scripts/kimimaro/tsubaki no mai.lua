local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -90.3, 1, -100.3, 1)

function onCastSpell(cid, var)
local waittime = 1.0
local storage = 512123126543

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}
local pos = getCreaturePosition(cid)
addEvent(doSendMagicEffect, 1, {x = pos.x+1, y = pos.y+3, z = pos.z}, 541)
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(position1, 514)
return doCombat(cid, combat, var)
end
