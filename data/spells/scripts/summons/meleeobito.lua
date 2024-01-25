local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 31)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -999, 0, -999, 0)

function onCastSpell(cid, var)
local target = getCreatureTarget(cid)

if isPlayer(target) and getVocationInfo(getPlayerVocation(target)).name == "Obito" then
return TRUE
end

return doCombat(cid, combat, var)
end
