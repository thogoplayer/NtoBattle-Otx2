local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 13)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_HASTE, false, false, 5)
setConditionParam(condition, CONDITION_PARAM_TICKS, 30000)
setConditionFormula(condition, 0.3, -45, 0.3, -45)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return not isBuffID(cid, 5) and doCombat(cid, combat, var)
end