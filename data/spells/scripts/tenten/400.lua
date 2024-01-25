local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_TAIJUTSUDAMAGE)
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
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var}

addEvent(effect, 200, target, {2,0}, 978)
addEvent(effect, 1200, target, {2,3}, 1012)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell2, 1200, parameters)
addEvent(doSendMagicEffect, 1, {x = pos.x+4, y = pos.y+1, z = pos.z}, 977)
return true
end 