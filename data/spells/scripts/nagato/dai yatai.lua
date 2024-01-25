local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 12)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 214)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -80, 1, -90, 1)


arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)

setCombatArea(combat1, area1)

 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 

function onCastSpell(cid, var)
local waittime = 1.0 -- Tempo de exhaustion
local storage = 523555

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local parameters = { cid = cid, var = var}
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell1, 200, parameters)
return true
end 