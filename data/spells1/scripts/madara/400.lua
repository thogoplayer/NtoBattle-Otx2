local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_NONE)		---ataque nivel 400

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -72, 1, -75, 1)


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
local waittime = 5.5
local storage = 663563

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getCreaturePosition(cid)
local parameters = { cid = cid, var = var}
local targetpos = getCreaturePosition(getCreatureTarget(cid))
local efepos = {x=targetpos.x+3, y=targetpos.y, z=targetpos.z}
local efepos3 = {x=targetpos.x, y=targetpos.y+1, z=targetpos.z}
local efepos4 = {x=targetpos.x, y=targetpos.y-1, z=targetpos.z}
local efepos5 = {x=targetpos.x+2, y=targetpos.y-1, z=targetpos.z}
local efepos6 = {x=targetpos.x+2, y=targetpos.y+1, z=targetpos.z}
local efepos7 = {x=targetpos.x+1, y=targetpos.y, z=targetpos.z}
local efepos8 = {x=targetpos.x+4, y=targetpos.y, z=targetpos.z}
local efepos2 = {x=targetpos.x+1, y=targetpos.y+3, z=targetpos.z}
addEvent(doSendMagicEffect, 400, efepos, 616)
addEvent(doSendMagicEffect, 700, efepos3, 95)
addEvent(doSendMagicEffect, 700, efepos4, 95)
addEvent(doSendMagicEffect, 700, efepos5, 95)
addEvent(doSendMagicEffect, 700, efepos6, 95)
addEvent(doSendMagicEffect, 700, efepos7, 95)
addEvent(doSendMagicEffect, 700, efepos8, 51)
exhaustion.set(cid, storage, waittime)
addEvent(doSendMagicEffect, 600, efepos2, 0)
addEvent(onCastSpell1, 400, parameters)
addEvent(onCastSpell2, 600, parameters)
addEvent(doSendMagicEffect, 1, {x = pos.x+3, y = pos.y+0, z = pos.z}, 501)
return true
end 