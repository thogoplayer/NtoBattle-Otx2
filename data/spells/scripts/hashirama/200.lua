local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_MOKUTONDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -25, 1, -30, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_MOKUTONDAMAGE)	---defesa nivel 400
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -25, 1, -30, 1)


arr1 = {
	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 1, 1, 1, 0, 0},
	{1, 1, 1, 3, 1, 1, 1},
	{0, 0, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 1, 0, 0, 0}
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
if isSelado(cid) then return false end
local waittime = 1.0
local storage = 899123

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var}


addEvent(effect, 100, target, {1, 0}, 716)
addEvent(effect, 100, target, {2, 0}, 716)
addEvent(effect, 100, target, {2, 1}, 716)
addEvent(effect, 100, target, {1, 1}, 716)
addEvent(effect, 100, target, {0, 1}, 716)
addEvent(effect, 100, target, {0, 0}, 716)
addEvent(effect, 100, target, {0, -1}, 716)
addEvent(effect, 100, target, {1, -1}, 716)
addEvent(effect, 100, target, {2, -1}, 716)
addEvent(effect, 100, target, {3, 0}, 716)
addEvent(effect, 100, target, {4, 0}, 716)
addEvent(effect, 100, target, {-1, 0}, 716)
addEvent(effect, 100, target, {-2, 0}, 716)
addEvent(effect, 100, target, {1, 2}, 716)
addEvent(effect, 100, target, {1, 3}, 716)
addEvent(effect, 100, target, {1, -2}, 716)
addEvent(effect, 100, target, {1, -3}, 716)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 100, parameters)
return true
end 