local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_SUITONDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, false)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -21.2, 1, -20.2, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_SUITONDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 0)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -20.2, 1, -22.2, 1)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_SUITONDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat3, COMBAT_PARAM_BLOCKARMOR, false)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 0)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -22.2, 1, -20.2, 1)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_SUITONDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat4, COMBAT_PARAM_BLOCKARMOR, false)
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, 0)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -20.2, 1, -21.2, 1)


arr1 = {
	{0, 0, 0, 0, 0, 0, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 3, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 0, 0, 0, 0, 0, 0}
}

arr2 = {
	{0, 0, 0, 0, 0, 0, 0},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 3, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{0, 0, 0, 0, 0, 0, 0}
}

arr3 = {
	{0, 0, 0, 0, 0, 0, 0},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 3, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1},
	{0, 0, 0, 0, 0, 0, 0}
}

arr4 = {
	{0, 0, 0, 0, 0, 0, 0},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 3, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{0, 0, 0, 0, 0, 0, 0}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat3, parameters.var)
end

local function onCastSpell4(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat4, parameters.var)
end
 
function onCastSpell(cid, var)
local waittime = 0.9-- Tempo de exhaustion
local storage = 103434
if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y-1, z=getCreaturePosition(cid).z}
local position2 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y-1, z=getCreaturePosition(cid).z}
local position3 = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
local position4 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
local position5 = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position6 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position7 = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y+3, z=getCreaturePosition(cid).z}
local position8 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y+3, z=getCreaturePosition(cid).z}
local position9 = {x=getCreaturePosition(cid).x-2, y=getCreaturePosition(cid).y+3, z=getCreaturePosition(cid).z}
local position10 = {x=getCreaturePosition(cid).x-2, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position11 = {x=getCreaturePosition(cid).x-1, y=getCreaturePosition(cid).y+3, z=getCreaturePosition(cid).z}
local position12 = {x=getCreaturePosition(cid).x-1, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position13 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y+3, z=getCreaturePosition(cid).z}
local position14 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position15 = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y+3, z=getCreaturePosition(cid).z}
local position16 = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position17 = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y+3, z=getCreaturePosition(cid).z}
local position18 = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position19 = {x=getCreaturePosition(cid).x+4, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position20 = {x=getCreaturePosition(cid).x+4, y=getCreaturePosition(cid).y+3, z=getCreaturePosition(cid).z}
exhaustion.set(cid, storage, waittime)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 200, parameters)
addEvent(onCastSpell2, 300, parameters)
addEvent(onCastSpell2, 400, parameters)
doSendMagicEffect(position1, 170)
doSendMagicEffect(position2, 171)
doSendMagicEffect(position3, 170)
doSendMagicEffect(position4, 171)
doSendMagicEffect(position5, 170)
doSendMagicEffect(position6, 171)
doSendMagicEffect(position7, 170)
doSendMagicEffect(position8, 171)
doSendMagicEffect(position9, 173)
doSendMagicEffect(position10, 172)
doSendMagicEffect(position11, 173)
doSendMagicEffect(position12, 172)
doSendMagicEffect(position13, 173)
doSendMagicEffect(position14, 172)
doSendMagicEffect(position15, 173)
doSendMagicEffect(position16, 172)
doSendMagicEffect(position17, 173)
doSendMagicEffect(position18, 172)
doSendMagicEffect(position19, 172)
doSendMagicEffect(position20, 173)
return true
end 