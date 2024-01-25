local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, 215)

function onGetFormulaValues1(cid, level, maglevel)
min = - (DAMAGE_FACTOR_LEVEL100 * level + DAMAGE_FACTOR_SKILL100 * maglevel)/1 * 0.75 
max = - (DAMAGE_FACTOR_LEVEL100 * level + DAMAGE_FACTOR_SKILL100 * maglevel)/1 * 1.25
return min, max 
end

setCombatCallback(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues1")

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, 215)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -0, -0, -0, -0)


arr1 = {
	{1, 0, 1, 0, 1},
	{1, 1, 1, 1, 1},
	{1, 1, 2, 1, 1},
	{1, 1, 1, 1, 0},
	{1, 0, 1, 0, 1}
}

arr2 = {
	{1, 0, 1, 0, 1},
	{1, 1, 1, 1, 1},
	{1, 1, 2, 1, 1},
	{1, 1, 1, 1, 0},
	{1, 0, 1, 0, 1}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
 
local function onCastSpell1(parameters)
	if not isCreature(parameters.cid) then
		return false
	end
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
	if not isCreature(parameters.cid) then
		return false
	end
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end
 
function onCastSpell(cid, var)



local parameters = { cid = cid, var = var}
local pos = getCreaturePosition(cid)
addEvent(doSendMagicEffect, 1, {x = pos.x+2, y = pos.y, z = pos.z}, 1191)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 200, parameters)
 
return TRUE
end
