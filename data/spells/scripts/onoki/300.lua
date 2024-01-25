local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_DOTONDAMAGE)		---balanço nivel 300
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -57, 1, -60, 1)

local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end
 
function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 2.0
local storage = 774372

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getCreaturePosition(cid)
local parameters = { cid = cid, var = var}
local targetpos = getCreaturePosition(getCreatureTarget(cid))
local efepos = {x=targetpos.x+3, y=targetpos.y+1, z=targetpos.z}
addEvent(doSendMagicEffect, 100, efepos, 922)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell2, 300, parameters)
return true
end 