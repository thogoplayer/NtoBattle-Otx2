local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)	---defesa nivel 350
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat1, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -65, 1, -70, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 0)

arr1 = {
	{0, 0, 0, 0, 0},
	{0, 1, 1, 1, 0},
	{0, 1, 3, 1, 0},
	{0, 1, 1, 1, 0},
	{0, 0, 0, 0, 0}
}

arr2 = {
	{1, 0, 0, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 2, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0}
}


local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

local function Explosion(cid)
local c_Pos = getCreaturePosition(cid)
local position1 = {x=c_Pos.x+1, y=c_Pos.y, z=c_Pos.z}
local position2 = {x=c_Pos.x-1, y=c_Pos.y, z=c_Pos.z}
local position3 = {x=c_Pos.x, y=c_Pos.y+1, z=c_Pos.z}
local position4 = {x=c_Pos.x, y=c_Pos.y-1, z=c_Pos.z}
local position5 = {x=c_Pos.x+1, y=c_Pos.y+1, z=c_Pos.z}
local position6 = {x=c_Pos.x-1, y=c_Pos.y-1, z=c_Pos.z}
local position7 = {x=c_Pos.x+1, y=c_Pos.y-1, z=c_Pos.z}
local position8 = {x=c_Pos.x-1, y=c_Pos.y+1, z=c_Pos.z}
doSendMagicEffect(position1, 536)
doSendMagicEffect(position2, 536)
doSendMagicEffect(position3, 536)
doSendMagicEffect(position4, 536)
doSendMagicEffect(position5, 536)
doSendMagicEffect(position6, 536)
doSendMagicEffect(position7, 536)
doSendMagicEffect(position8, 536)
return true
end

local function Espada(cid)
local c_Pos = getCreaturePosition(cid)
local position1 = {x=c_Pos.x+1, y=c_Pos.y, z=c_Pos.z}
local position2 = {x=c_Pos.x-1, y=c_Pos.y, z=c_Pos.z}
local position3 = {x=c_Pos.x, y=c_Pos.y+1, z=c_Pos.z}
local position4 = {x=c_Pos.x, y=c_Pos.y-1, z=c_Pos.z}
local position5 = {x=c_Pos.x+1, y=c_Pos.y+1, z=c_Pos.z}
local position6 = {x=c_Pos.x-1, y=c_Pos.y-1, z=c_Pos.z}
local position7 = {x=c_Pos.x+1, y=c_Pos.y-1, z=c_Pos.z}
local position8 = {x=c_Pos.x-1, y=c_Pos.y+1, z=c_Pos.z}
doSendMagicEffect(position1, 315)
doSendMagicEffect(position2, 315)
doSendMagicEffect(position3, 315)
doSendMagicEffect(position4, 315)
doSendMagicEffect(position5, 315)
doSendMagicEffect(position6, 315)
doSendMagicEffect(position7, 315)
doSendMagicEffect(position8, 315)
return true
end
 
function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 4.0 -- Tempo de exhaustion
local storage = 963563

if exhaustion.check(cid, storage) then
return false
end
local parameters = { cid = cid, var = var}
Espada(cid)
addEvent(Explosion, 300, cid)
addEvent(onCastSpell2, 200, parameters)
addEvent(onCastSpell1, 200, parameters)
exhaustion.set(cid, storage, waittime)
return true
end 