local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)		---balanço nivel 50
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -8, 1, -9, 1)


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
setCombatArea(combat, area1)
 
local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 0.9 -- Tempo de exhaustion
local storage = 665778


if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end

local parameters = { cid = cid, var = var}
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
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell1, 200, parameters)
exhaustion.set(cid, storage, waittime)
return true
end 