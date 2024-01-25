local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 0)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -120, 1, -130, 1)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 1.5
local storage = 774372

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(position1, 121)
return doCombat(cid, combat, var)
end