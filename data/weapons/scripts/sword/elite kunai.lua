local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1, 0, 1, 0)


function onUseWeapon(cid, var)
local targetpos = getCreaturePosition(getCreatureTarget(cid))
local pos = {x=targetpos.x, y=targetpos.y, z=targetpos.z}
doSendMagicEffect(pos, 1071)
	return doCombat(cid, combat, var)
end
