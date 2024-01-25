local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -12, 1, -14, 1)

arr = {
{0, 0, 0, 0, 0},
{0, 1, 1, 1, 0},
{0, 1, 3, 1, 0},
{0, 1, 1, 1, 0},
{0, 0, 0, 0, 0}
}


local area = createCombatArea(arr)
setCombatArea(combat, area)
 
local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end
 
function onCastSpell(cid, var)
local waittime = 0.9 -- Tempo de exhaustion
local storage = 899123

if exhaustion.check(cid, storage) then
return false
end
local parameters = {cid = cid, var = var}
local pos = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
doSendMagicEffect(pos, 154)
addEvent(onCastSpell1, 10, parameters)
exhaustion.set(cid, storage, waittime)
return true
end 