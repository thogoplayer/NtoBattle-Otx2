local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_RAITONDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -35, 1, -40, 1)		---ataque nivel 170

function onCastSpell(cid, var)
if isSelado(cid) then return false end
local waittime = 1.5 -- Tempo de exhaustion
local storage = 665778
if isPlayer(cid) then
if exhaustion.check(cid, storage) then
return false
end
exhaustion.set(cid, storage, waittime)
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+3, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 1004)
return doCombat(cid, combat, var)
end
