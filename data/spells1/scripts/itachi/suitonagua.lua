local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_SUITONDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 134)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -45, 1, -50, 1)

function onCastSpell(cid, var)
local waittime = 1.0
local storage = 10343432

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 159)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
