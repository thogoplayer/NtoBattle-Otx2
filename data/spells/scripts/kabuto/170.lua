local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)	---defesa nivel 400
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
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var}


addEvent(effect, 100, target, {-1, 0}, 541)
addEvent(effect, 200, target, {0, 0}, 541)
addEvent(effect, 300, target, {1, 0}, 541)
addEvent(effect, 400, target, {2, 0}, 541)
addEvent(effect, 200, target, {-1, 0}, 861)
addEvent(effect, 300, target, {0, 0}, 861)
addEvent(effect, 400, target, {1, 0}, 861)
addEvent(effect, 500, target, {2, 0}, 861)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell2, 300, parameters)
return true
end 
