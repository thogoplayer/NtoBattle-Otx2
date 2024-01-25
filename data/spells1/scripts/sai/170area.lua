local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)	---balanço nivel 170
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat1, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -35, 1, -40, 1)


arr1 = {
	{0, 0, 0, 0, 0},
	{0, 1, 1, 1, 0},
	{0, 1, 3, 1, 0},
	{0, 1, 1, 1, 0},
	{0, 0, 0, 0, 0}
}

arr2 = {
	{1, 0, 0, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 2, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0}
}


local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr1)
setCombatArea(combat1, area1)
setCombatArea(combat1, area2)
setCombatArea(combat1, area3)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 1.5
local storage = 665778

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local parameters = { cid = cid, var = var}
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 100, parameters)
doSendMagicEffect(position1, 545)
return true
end 