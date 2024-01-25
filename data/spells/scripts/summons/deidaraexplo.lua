local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 28)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -30.2, 1, -40.2, 1)

function onCastSpell(cid, var)
local waittime = 2.0 -- Tempo de exhaustion
local storage = 115856
if isPlayer(cid) then
if exhaustion.check(cid, storage) then
return false
end
exhaustion.set(cid, storage, waittime)
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 214)
return doCombat(cid, combat, var)
end
