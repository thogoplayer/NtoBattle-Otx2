local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_TAIJUTSUDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 185)
setCombatParam(combat1, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -7, 1, -8, 1)


arr1 = {
	{3}
}


local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 0.9 -- Tempo de exhaustion
local storage = 665778

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local parameters = { cid = cid, var = var}
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 200, parameters)
return true
end 