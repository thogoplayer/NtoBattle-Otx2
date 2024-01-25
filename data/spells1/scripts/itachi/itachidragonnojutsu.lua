local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_KATONDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, false)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -7.5, 1, -10, 1)



arr1 = {
	{0, 0, 0, 0, 0, 0, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 3, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 0, 0, 0, 0, 0, 0}
}


local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 0.9
local storage = 899123

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end

local position1 = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y-2, z=getCreaturePosition(cid).z}
local position2 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y-2, z=getCreaturePosition(cid).z}
local position3 = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y-1, z=getCreaturePosition(cid).z}
local position4 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y-1, z=getCreaturePosition(cid).z}
local position5 = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position6 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local position7 = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local position8 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position9 = {x=getCreaturePosition(cid).x-2, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position10 = {x=getCreaturePosition(cid).x-2, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local position11 = {x=getCreaturePosition(cid).x-1, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position12 = {x=getCreaturePosition(cid).x-1, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local position13 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position14 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local position15 = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position16 = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local parameters = { cid = cid, var = var}
doSendMagicEffect(position1, 104)
doSendMagicEffect(position2, 105)
doSendMagicEffect(position3, 104)
doSendMagicEffect(position4, 105)
doSendMagicEffect(position5, 104)
doSendMagicEffect(position6, 105)
doSendMagicEffect(position7, 104)
doSendMagicEffect(position8, 105)
doSendMagicEffect(position9, 107)
doSendMagicEffect(position10, 106)
doSendMagicEffect(position11, 107)
doSendMagicEffect(position12, 106)
doSendMagicEffect(position13, 107)
doSendMagicEffect(position14, 106)
doSendMagicEffect(position15, 107)
doSendMagicEffect(position16, 106)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell1, 200, parameters)
return true
end 