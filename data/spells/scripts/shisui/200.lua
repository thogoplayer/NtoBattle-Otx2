local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_NONE)

local combat2 = createCombatObject(cid)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -27, 1, -30, 1)


arr1 = {
	{0, 0, 0, 0, 0},
	{0, 1, 1, 1, 0},
	{0, 1, 3, 1, 0},
	{0, 1, 1, 1, 0},
	{0, 0, 0, 0, 0}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)
setCombatArea(combat2, area1)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters, cid)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end
 

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 1.0
local storage = 899123

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var}

addEvent(effect, 200, target, {0, 1}, 1066)
addEvent(effect, 400, target, {1, 1}, 1066)
addEvent(effect, 600, target, {2, 1}, 1066)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 400, parameters)
return true
end 