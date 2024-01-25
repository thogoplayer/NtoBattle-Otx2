local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)	---ataque nivel 170
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -35, 1, -40, 1)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 1.0
local storage = 665778

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var}

addEvent(effect, 100, target, {0, 1}, 656)
addEvent(effect, 400, target, {0, 1}, 668)
addEvent(effect, 400, target, {1, 1}, 369)
addEvent(effect, 500, target, {1, 1}, 369)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 300, parameters)
return true
end 