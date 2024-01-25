local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_RAITONDAMAGE)		---ataque nivel 350
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -65, 1, -70, 1)

local condition = createConditionObject(CONDITION_RAITON)
addDamageCondition(condition, 6, 3000, -1400)
setCombatCondition(combat,condition)

function onCastSpell(cid, var)
if isSelado(cid) then return false end
local waittime = 4.0 -- Tempo de exhaustion
local storage = 963563

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 273)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
