local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_SUNADAMAGE)		---defesa nivel 300
setCombatParam(combat1, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, false)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 91)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -29, 1, -30, 1)


arr1 = {
	{3}
}


local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 2.0
local storage = 774372

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local function effectk(cid)
if isCreature(cid) then
local position1 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
doSendMagicEffect(position1,113)
end
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)
addEvent(effectk,200, target)
addEvent(effectk,300, target)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell1, 300, parameters)
return true
end 