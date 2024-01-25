local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HYOTONDAMAGE)		---ataque nivel 300
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -55, 1, -60, 1)



arr1 = {
	{0, 1, 1, 1, 0},
	{1, 1, 1, 1, 1},
	{1, 1, 3, 1, 1},
	{1, 1, 1, 1, 1},
	{0, 1, 1, 1, 0}
}


local area1 = createCombatArea(arr1)
setCombatArea(combat, area1)

 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end


 
function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 2.0 -- Tempo de exhaustion
local storage = 774372

if exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y+3, z=getCreaturePosition(cid).z}
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(position1, 1088)
return true
end 