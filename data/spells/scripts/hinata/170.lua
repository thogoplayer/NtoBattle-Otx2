local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_TAIJUTSUDAMAGE)		---cura nivel 170
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -35, 1, -40, 1)

local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end
 
function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 1.5
local storage = 665778

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getCreaturePosition(cid)
local parameters = { cid = cid, var = var}
local targetpos = getCreaturePosition(getCreatureTarget(cid))
local efepos = {x=targetpos.x, y=targetpos.y, z=targetpos.z}
local efepos3 = {x=targetpos.x+1, y=targetpos.y+1, z=targetpos.z}
addEvent(doSendMagicEffect, 100, efepos, 1013)
addEvent(doSendMagicEffect, 250, efepos3, 444)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell2, 250, parameters)
return true
end 