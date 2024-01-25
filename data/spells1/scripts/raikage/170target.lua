local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_RAITONDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -35, 1, -40, 1)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local parameters = {cid = cid, var = var}

if isPlayer(cid) and exhaustion.check(cid, 665778) == true then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local t_Pos = getCreaturePosition(getCreatureTarget(cid))
local efepos = {x=t_Pos.x+3, y=t_Pos.y, z=t_Pos.z}
local efepos1 = {x=t_Pos.x+4, y=t_Pos.y, z=t_Pos.z}
local efepos2 = {x=t_Pos.x+5, y=t_Pos.y, z=t_Pos.z}
local efepos3 = {x=t_Pos.x, y=t_Pos.y, z=t_Pos.z}
local efepos4 = {x=t_Pos.x+1, y=t_Pos.y, z=t_Pos.z}
local efepos5 = {x=t_Pos.x+2, y=t_Pos.y, z=t_Pos.z}
local efepos6 = {x=t_Pos.x, y=t_Pos.y+1, z=t_Pos.z}
local efepos7 = {x=t_Pos.x+1, y=t_Pos.y+1, z=t_Pos.z}
local efepos8 = {x=t_Pos.x+2, y=t_Pos.y+1, z=t_Pos.z}
local efepos9 = {x=t_Pos.x, y=t_Pos.y, z=t_Pos.z}
local efepos10 = {x=t_Pos.x+1, y=t_Pos.y, z=t_Pos.z}
local efepos11 = {x=t_Pos.x+2, y=t_Pos.y, z=t_Pos.z}
exhaustion.set(cid, 665778, 1.5)
addEvent(doSendMagicEffect, 200, efepos, 51)
addEvent(doSendMagicEffect, 400, efepos1, 51)
addEvent(doSendMagicEffect, 600, efepos2, 51)
addEvent(doSendMagicEffect, 200, efepos3, 95)
addEvent(doSendMagicEffect, 400, efepos4, 95)
addEvent(doSendMagicEffect, 600, efepos5, 95)
addEvent(doSendMagicEffect, 200, efepos6, 369)
addEvent(doSendMagicEffect, 400, efepos7, 369)
addEvent(doSendMagicEffect, 600, efepos8, 369)
addEvent(doSendMagicEffect, 200, efepos9, 369)
addEvent(doSendMagicEffect, 400, efepos10, 369)
addEvent(doSendMagicEffect, 600, efepos11, 369)
addEvent(onCastSpell1, 400, parameters)
return true
end