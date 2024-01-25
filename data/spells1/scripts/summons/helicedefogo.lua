local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 893)
setCombatParam(combat1, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, false)
setAttackFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 6, 12)

local area1 = createCombatArea(AREA_CROSS5X5)
setCombatArea(combat1, area1)


function onCastSpell(cid, var)
doCombat(cid, combat1, var)
return true
end
