local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_DOTONDAMAGE)		---cura nivel 400
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -75, 1, -80, 1)

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
local efepos = {x=targetpos.x, y=targetpos.y, z=targetpos.z}
local efepos2 = {x=targetpos.x+2, y=targetpos.y, z=targetpos.z}
local efepos3 = {x=targetpos.x, y=targetpos.y, z=targetpos.z}
local efepos4 = {x=targetpos.x, y=targetpos.y, z=targetpos.z}
local efepos5 = {x=targetpos.x+3, y=targetpos.y, z=targetpos.z}
local efepos6 = {x=targetpos.x+1, y=targetpos.y+1, z=targetpos.z}
local efepos7 = {x=targetpos.x+4, y=targetpos.y, z=targetpos.z}
addEvent(doSendMagicEffect, 200, efepos, 429)
exhaustion.set(cid, storage, waittime)
addEvent(doSendMagicEffect, 600, efepos2, 95)
addEvent(doSendMagicEffect, 600, efepos3, 95)
addEvent(doSendMagicEffect, 700, efepos4, 378)
addEvent(doSendMagicEffect, 700, efepos5, 378)
addEvent(doSendMagicEffect, 500, efepos6, 438)
addEvent(doSendMagicEffect, 600, efepos6, 438)
addEvent(doSendMagicEffect, 700, efepos6, 438)
addEvent(doSendMagicEffect, 500, efepos7, 51)
addEvent(onCastSpell2, 500, parameters)
addEvent(doSendMagicEffect, 1, {x = pos.x+1, y = pos.y+0, z = pos.z}, 0)
return true
end 