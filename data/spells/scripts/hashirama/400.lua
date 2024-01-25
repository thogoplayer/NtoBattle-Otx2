local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_MOKUTONDAMAGE)	---defesa nivel 400
setCombatParam(combat1, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -75, 1, -80, 1)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
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

addEvent(effect, 100, target, {0, 0}, 1069)
addEvent(effect, 300, target, {1, 0}, 1068)
addEvent(effect, 300, target, {-1, 0}, 1068)
addEvent(effect, 300, target, {0, 1}, 1068)
addEvent(effect, 300, target, {0, -1}, 1068)
addEvent(effect, 500, target, {2, 0}, 1068)
addEvent(effect, 500, target, {-2, 0}, 1068)
addEvent(effect, 500, target, {0, 2}, 1068)
addEvent(effect, 500, target, {0, -2}, 1068)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 200, parameters)
return true
end 