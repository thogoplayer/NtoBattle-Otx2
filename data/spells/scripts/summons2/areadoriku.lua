local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 735)
setCombatParam(combat1, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, false)
setAttackFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 6, 12)

local area1 = createCombatArea(AREA_CROSS5X5Rikudou1)
setCombatArea(combat1, area1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 735)
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setAttackFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 6, 12)

local area2 = createCombatArea(AREA_CROSS5X5Rikudou2)
setCombatArea(combat2, area2)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 735)
setCombatParam(combat3, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat3, COMBAT_PARAM_BLOCKARMOR, false)
setAttackFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 6, 12)

local area3 = createCombatArea(AREA_CROSS5X5Rikudou3)
setCombatArea(combat3, area3)

function onCastSpell(cid, var)
doCombat(cid, combat1, var)
addEvent(doCombat,500,cid, combat2, var)
addEvent(doCombat,900,cid, combat3, var)
return true
end
