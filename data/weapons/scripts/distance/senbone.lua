local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 21)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1, 0, 1, 0)

local critical = createCombatObject()
setCombatParam(critical, COMBAT_PARAM_BLOCKARMOR, false)
setCombatParam(critical, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(critical, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(critical, COMBAT_PARAM_DISTANCEEFFECT, 21)
setCombatFormula(critical, COMBAT_FORMULA_SKILL, 1.1, 0, 1.1, 0)


function onUseWeapon(cid, var)
local chance = 0 -- porcentagem de chance de dar critical
if isCreature(getCreatureTarget(cid)) and math.random(1,100) <= chance then
doCombat(cid, critical, var)
doSendAnimatedText(getCreaturePosition(cid), "CRITICAL!", 0)
else
doCombat(cid, combat, var)
end
return true
end
