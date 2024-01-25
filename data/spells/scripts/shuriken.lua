local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 5)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -2, -20, -2, -30, 8, 8, 2.1, 2.9)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
