local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_BAKUTONDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, false)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 1)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 214)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -20, 1, -25, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_BAKUTONDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 33)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 941)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -20, 1, -25, 1)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_BAKUTONDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat3, COMBAT_PARAM_BLOCKARMOR, false)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 42)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 4)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -20, 1, -25, 1)

arr1 = {
	{3}
}

arr2 = {
	{3}
}

arr3 = {
	{1, 1, 1},
	{1, 3, 1},
	{1, 1, 1}
}



local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat3, parameters.var)
end


function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 2.0
local storage = 774372

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local parameters = { cid = cid, var = var}
local position = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell2, 300, parameters)
addEvent(onCastSpell3, 400, parameters)
doSendMagicEffect(position, 1014)
return true
end 