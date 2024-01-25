local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_DOTONDAMAGE)		---cura nivel 400
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -75, 1, -80, 1)

local function onCastSpell2(parameters)
    return isCreature(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
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
local targetpos = getCreaturePosition(target)

addEvent(effect, 100, target, {2, 0}, 1011)
addEvent(effect, 300, target, {2, 0}, 470)
addEvent(effect, 500, target, {4, 0}, 51)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell2, 300, parameters)
return true
end 