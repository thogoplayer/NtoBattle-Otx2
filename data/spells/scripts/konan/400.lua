local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, 32)	---defesa nivel 400
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

addEvent(effect, 100, target, {1, 1}, 592)
addEvent(effect, 100, target, {2, 1}, 592)
addEvent(effect, 100, target, {0, 1}, 592)
addEvent(effect, 100, target, {1, 0}, 592)
addEvent(effect, 100, target, {1, 2}, 592)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell2, 500, parameters)
return true
end 