local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_NONE)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_TAIJUTSUDAMAGE)		---balanço nivel 350
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -68, 1, -72, 1)
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)


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
local waittime = 4.0
local storage = 963563

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getCreaturePosition(cid)
local parameters = { cid = cid, var = var}
local targetpos = getCreaturePosition(getCreatureTarget(cid))
local efepos = {x=targetpos.x+2, y=targetpos.y, z=targetpos.z}
local efepos3 = {x=targetpos.x+5, y=targetpos.y, z=targetpos.z}
local efepos2 = {x=targetpos.x+2, y=targetpos.y, z=targetpos.z}
addEvent(doSendMagicEffect, 300, efepos, 909)
addEvent(doSendMagicEffect, 300, efepos3, 910)
exhaustion.set(cid, storage, waittime)
addEvent(doSendMagicEffect, 400, efepos2, 328)
addEvent(onCastSpell1, 300, parameters)
addEvent(onCastSpell2, 800, parameters)
addEvent(doSendMagicEffect, 1, {x = pos.x+1, y = pos.y+0, z = pos.z}, 0)
return true
end 