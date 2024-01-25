local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_RAITONDAMAGE)	---ataque nivel 250
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -45, 1, -50, 1)


arr1 = {
	{0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 3, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat, area1)
 
local function onCastSpell1(parameters)
    return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

 
function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 2.0
local storage = 774372

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var}

addEvent(effect, 100, target, {0, 0}, 689)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 100, parameters)
return true
end 