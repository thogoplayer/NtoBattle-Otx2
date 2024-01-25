local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat, COMBAT_PARAM_DISTANCEFFECT, 1)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -170, 1, -180, 1)

function onCastSpell(cid, var)
local waittime = 2.0
local storage = 663563

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 701)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
