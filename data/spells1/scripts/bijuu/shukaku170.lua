local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_NONE)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 148)
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -38, 1, -43, 1)


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
local waittime = 1.5
local storage = 665778
local storag2 = 10215

if isPlayer(cid) and getPlayerStorageValue(cid, storag2) < 1 then
doPlayerSendCancel(cid, "Voce precisa estar no Modo Bijuu para usar esta spell.")
return false
end

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getCreaturePosition(cid)
local parameters = { cid = cid, var = var}
local targetpos = getCreaturePosition(getCreatureTarget(cid))
local efepos = {x=targetpos.x+3, y=targetpos.y, z=targetpos.z}
local efepos2 = {x=targetpos.x+1, y=targetpos.y, z=targetpos.z}
local efepos3 = {x=targetpos.x, y=targetpos.y, z=targetpos.z}
local efepos4 = {x=targetpos.x, y=targetpos.y-1, z=targetpos.z}
local efepos5 = {x=targetpos.x, y=targetpos.y-2, z=targetpos.z}
local efepos6 = {x=targetpos.x, y=targetpos.y-3, z=targetpos.z}
local efepos7 = {x=targetpos.x+1, y=targetpos.y-3, z=targetpos.z}
local efepos8 = {x=targetpos.x+1, y=targetpos.y-2, z=targetpos.z}
local efepos9 = {x=targetpos.x+1, y=targetpos.y-1, z=targetpos.z}
local efepos10 = {x=targetpos.x+1, y=targetpos.y, z=targetpos.z}
local efepos11 = {x=targetpos.x+2, y=targetpos.y+1, z=targetpos.z}
local efepos12 = {x=targetpos.x+2, y=targetpos.y-1, z=targetpos.z}
local efepos13 = {x=targetpos.x+1, y=targetpos.y+1, z=targetpos.z}
local efepos14 = {x=targetpos.x-1, y=targetpos.y, z=targetpos.z}
local efepos15 = {x=targetpos.x-1, y=targetpos.y-1, z=targetpos.z}
local efepos16 = {x=targetpos.x-1, y=targetpos.y-2, z=targetpos.z}
local efepos17 = {x=targetpos.x-1, y=targetpos.y-3, z=targetpos.z}
local efepos18 = {x=targetpos.x+2, y=targetpos.y-3, z=targetpos.z}
local efepos19 = {x=targetpos.x+2, y=targetpos.y-2, z=targetpos.z}
local efepos20 = {x=targetpos.x+2, y=targetpos.y-1, z=targetpos.z}
local efepos21 = {x=targetpos.x+2, y=targetpos.y, z=targetpos.z}
local efepos22 = {x=targetpos.x+2, y=targetpos.y, z=targetpos.z}
local efepos23 = {x=targetpos.x+3, y=targetpos.y, z=targetpos.z}
local efepos24 = {x=targetpos.x+1, y=targetpos.y, z=targetpos.z}
local efepos25 = {x=targetpos.x+2, y=targetpos.y+1, z=targetpos.z}
local efepos26 = {x=targetpos.x, y=targetpos.y+1, z=targetpos.z}
local efepos27 = {x=targetpos.x-1, y=targetpos.y+1, z=targetpos.z}
local efepos28 = {x=targetpos.x-1, y=targetpos.y, z=targetpos.z}
local efepos29 = {x=targetpos.x-1, y=targetpos.y-1, z=targetpos.z}
local efepos30 = {x=targetpos.x, y=targetpos.y-1, z=targetpos.z}
local efepos31 = {x=targetpos.x+1, y=targetpos.y-1, z=targetpos.z}
local efepos32 = {x=targetpos.x+2, y=targetpos.y-1, z=targetpos.z}
local efepos33 = {x=targetpos.x+3, y=targetpos.y-1, z=targetpos.z}
local efepos34 = {x=targetpos.x-2, y=targetpos.y-1, z=targetpos.z}
local efepos35 = {x=targetpos.x-2, y=targetpos.y, z=targetpos.z}
local efepos36 = {x=targetpos.x-1, y=targetpos.y-1, z=targetpos.z}
local efepos37 = {x=targetpos.x, y=targetpos.y-1, z=targetpos.z}
addEvent(doSendMagicEffect, 200, efepos, 26)
addEvent(doSendMagicEffect, 300, efepos2, 181)
addEvent(doSendMagicEffect, 300, efepos3, 194)
addEvent(doSendMagicEffect, 400, efepos4, 194)
addEvent(doSendMagicEffect, 500, efepos5, 194)
addEvent(doSendMagicEffect, 600, efepos6, 194)
addEvent(doSendMagicEffect, 600, efepos7, 194)
addEvent(doSendMagicEffect, 500, efepos8, 194)
addEvent(doSendMagicEffect, 400, efepos9, 194)
addEvent(doSendMagicEffect, 300, efepos10, 194)
addEvent(doSendMagicEffect, 300, efepos11, 283)
addEvent(doSendMagicEffect, 500, efepos12, 283)
addEvent(doSendMagicEffect, 500, efepos13, 52)
addEvent(doSendMagicEffect, 300, efepos14, 194)
addEvent(doSendMagicEffect, 400, efepos15, 194)
addEvent(doSendMagicEffect, 500, efepos16, 194)
addEvent(doSendMagicEffect, 600, efepos17, 194)
addEvent(doSendMagicEffect, 600, efepos18, 194)
addEvent(doSendMagicEffect, 500, efepos19, 194)
addEvent(doSendMagicEffect, 400, efepos20, 194)
addEvent(doSendMagicEffect, 300, efepos21, 194)
addEvent(doSendMagicEffect, 500, efepos22, 52)
addEvent(doSendMagicEffect, 500, efepos23, 0)
addEvent(doSendMagicEffect, 500, efepos24, 52)
addEvent(doSendMagicEffect, 500, efepos25, 0)
addEvent(doSendMagicEffect, 500, efepos26, 52)
addEvent(doSendMagicEffect, 500, efepos27, 52)
addEvent(doSendMagicEffect, 500, efepos28, 52)
addEvent(doSendMagicEffect, 500, efepos29, 52)
addEvent(doSendMagicEffect, 500, efepos30, 52)
addEvent(doSendMagicEffect, 500, efepos31, 52)
addEvent(doSendMagicEffect, 500, efepos32, 52)
addEvent(doSendMagicEffect, 500, efepos33, 0)
addEvent(doSendMagicEffect, 500, efepos34, 52)
addEvent(doSendMagicEffect, 500, efepos35, 52)
addEvent(doSendMagicEffect, 500, efepos36, 52)
addEvent(doSendMagicEffect, 500, efepos37, 52)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 400, parameters)
addEvent(onCastSpell2, 100, parameters)
addEvent(doSendMagicEffect, 1, {x = pos.x+3, y = pos.y+0, z = pos.z}, 0)
return true
end 