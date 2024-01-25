local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)	---balanço nivel 250
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 73)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 548)
setCombatParam(combat1, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -45, 1, -50, 1)

arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr1)
local area3 = createCombatArea(arr1)
setCombatArea(combat1, area1)
setCombatArea(combat1, area1)
setCombatArea(combat1, area1)
 
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
local position = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 200, parameters)
doSendMagicEffect(position, 363)
return true
end 