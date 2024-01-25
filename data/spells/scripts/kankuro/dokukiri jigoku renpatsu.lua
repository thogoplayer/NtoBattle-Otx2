local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 190)
setCombatParam(combat1, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -8.3, 1, -10.3, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 190)
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -8.3, 1, -10.3, 1)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 190)
setCombatParam(combat3, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat3, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -8.3, 1, -10.3, 1)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 190)
setCombatParam(combat4, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat4, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -8.3, 1, -10.3, 1)

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat5, COMBAT_PARAM_EFFECT, 190)
setCombatParam(combat5, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat5, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -8.3, 1, -10.3, 1)


local condition1 = createConditionObject(CONDITION_POISON)
addDamageCondition(condition1, 50, 1000, -10000)
setCombatCondition(combat1, condition1)

local condition2 = createConditionObject(CONDITION_POISON)
addDamageCondition(condition2, 50, 1000, -10000)
setCombatCondition(combat5, condition2)


local arr1 = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}

local arr2 = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}

local arr3 = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}

local arr4 = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}

local arr5 = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
local area5 = createCombatArea(arr5)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
setCombatArea(combat5, area5)

local function onCastSpell1(parameters)
    return isCreature(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
    return isCreature(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
    return isCreature(parameters.cid) and doCombat(parameters.cid, combat3, parameters.var)
end

local function onCastSpell4(parameters)
    return isCreature(parameters.cid) and doCombat(parameters.cid, combat4, parameters.var)
end

local function onCastSpell5(parameters)
    return isCreature(parameters.cid) and doCombat(parameters.cid, combat5, parameters.var)
end

function onCastSpell(cid, var)
local parameters = {cid = cid, var = var}

if exhaustion.check(cid, 13115) == true then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

exhaustion.set(cid, 13115, 1)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 500, parameters)
addEvent(onCastSpell3, 900, parameters)
addEvent(onCastSpell4, 1400, parameters)
addEvent(onCastSpell5, 1900, parameters)
return true
end