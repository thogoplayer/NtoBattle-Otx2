local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_NONE)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_FUUTONDAMAGE)		---cura nivel 300
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -20, 1, -21, 1)


arr1 = {
	{0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 3, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0}
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
local waittime = 2.0
local storage = 774372

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getCreaturePosition(cid)
local parameters = { cid = cid, var = var}
local targetpos = getCreaturePosition(getCreatureTarget(cid))
local efepos = {x=targetpos.x+2, y=targetpos.y+1, z=targetpos.z}
local efepos2 = {x=targetpos.x+1, y=targetpos.y+2, z=targetpos.z}
local efepos3 = {x=targetpos.x, y=targetpos.y, z=targetpos.z}
local efepos4 = {x=targetpos.x+1, y=targetpos.y, z=targetpos.z}
local efepos5 = {x=targetpos.x, y=targetpos.y+1, z=targetpos.z}
local efepos6 = {x=targetpos.x, y=targetpos.y, z=targetpos.z}
addEvent(doSendMagicEffect, 100, efepos, 439)
addEvent(doSendMagicEffect, 300, efepos2, 439)
addEvent(doSendMagicEffect, 500, efepos3, 439)
addEvent(doSendMagicEffect, 700, efepos4, 439)
addEvent(doSendMagicEffect, 900, efepos5, 439)
exhaustion.set(cid, storage, waittime)
addEvent(doSendMagicEffect, 1100, efepos6, 439)
addEvent(onCastSpell1, 300, parameters)
addEvent(onCastSpell2, 200, parameters)
addEvent(onCastSpell2, 600, parameters)
addEvent(onCastSpell2, 1100, parameters)
addEvent(doSendMagicEffect, 1, {x = pos.x+1, y = pos.y+0, z = pos.z}, 0)
return true
end 