local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 1)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 214)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3, 1, -3.5, 1)

arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)

setCombatArea(combat1, area1)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
function onCastSpell(cid, var)
local waittime = 0.9 -- Tempo de exhaustion
local storage = 665778

if exhaustion.check(cid, storage) then
return false
end
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell1, 300, parameters)
addEvent(onCastSpell1, 500, parameters)
addEvent(onCastSpell1, 600, parameters)
return true
end 