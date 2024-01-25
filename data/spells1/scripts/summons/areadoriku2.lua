local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 695)

local area1 = createCombatArea(AREA_BEAM11)
setCombatArea(combat1, area1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setAttackFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 6, 12)

local area2 = createCombatArea(AREA_CROSS5X5)
setCombatArea(combat2, area2)

function onCastSpell(cid, var)
doCombat(cid, combat1, var)
addEvent(doCombat,500,cid, combat2, var)
return true
end
