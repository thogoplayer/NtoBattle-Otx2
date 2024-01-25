local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_NONE)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_RAITONDAMAGE)		---balanço nivel 350
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -67, 1, -70, 1)

 
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
local efepos = {x=targetpos.x-1, y=targetpos.y+1, z=targetpos.z}
local efepos2 = {x=targetpos.x, y=targetpos.y, z=targetpos.z}
addEvent(doSendMagicEffect, 100, efepos, 619)
exhaustion.set(cid, storage, waittime)
addEvent(doSendMagicEffect, 400, efepos2, 618)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 400, parameters)
return true
end 