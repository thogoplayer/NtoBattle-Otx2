local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -70.2, 1, -90.2, 1)

function onCastSpell(cid, var)
local waittime = 1.0 -- Tempo de exhaustion
local storage = 115831

if isPlayer(cid) then
if exhaustion.check(cid, storage) then
return false
end
exhaustion.set(cid, storage, waittime)
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
local pos = getCreaturePosition(cid)
addEvent(doSendMagicEffect, 1, {x = pos.x+1, y = pos.y+0, z = pos.z}, 0)
doSendMagicEffect(position1, 405)
return doCombat(cid, combat, var)
end
