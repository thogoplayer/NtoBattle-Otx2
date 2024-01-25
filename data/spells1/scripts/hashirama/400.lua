local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MOKUTONDAMAGE)		---cura nivel 350
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 0)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -75, 1, -80, 1)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 5.5
local storage = 663563

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+3, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 516)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end


