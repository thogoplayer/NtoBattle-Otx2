local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 113)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -65.2, 1, -75.2, 1)

function onCastSpell(cid, var)
local waittime = 1.0 -- Tempo de exhaustion
local storage = 1158001

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
exhaustion.set(cid, storage, waittime)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local position2 = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
doSendMagicEffect(position1, 20)
doSendMagicEffect(position2, 0)
return doCombat(cid, combat, var)
end
