local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_JINTONDAMAGE)		---balanço nivel 200
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -27, 1, -30, 1)

local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end
 
function onCastSpell(cid, var)
if isSelado(cid) then return false end
local waittime = 1.0
local storage = 899123

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getCreaturePosition(cid)
local parameters = { cid = cid, var = var}
local targetpos = getCreaturePosition(getCreatureTarget(cid))
local efepos = {x=targetpos.x, y=targetpos.y+1, z=targetpos.z}
local efepos2 = {x=targetpos.x+2, y=targetpos.y+3, z=targetpos.z}
addEvent(doSendMagicEffect, 100, efepos, 414)
exhaustion.set(cid, storage, waittime)
addEvent(doSendMagicEffect, 400, efepos2, 0)
addEvent(onCastSpell2, 400, parameters)
return true
end 