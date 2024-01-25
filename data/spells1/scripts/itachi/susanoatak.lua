local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_YINDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, false)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 41)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -20, 1, -25, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_YINDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 41)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -20, 1, -25, 1)

arr1 = {
	{3}
}



local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)
setCombatArea(combat2, area1)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end
 
function onCastSpell(cid, var)
local waittime = 1.0
local storage = 663563

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end 

local parameters = { cid = cid, var = var}
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell2, 400, parameters)
addEvent(onCastSpell2, 800, parameters)
addEvent(onCastSpell2, 1000, parameters)
return true
end 