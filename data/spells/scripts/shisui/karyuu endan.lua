local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -13, 1, -18, 1)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 0.9 -- Tempo de exhaustion
local storage = 899123

if exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
local pos = getCreaturePosition(cid)
doSendMagicEffect(position1, 587)
exhaustion.set(cid, storage, waittime)
doCombat(cid, combat, var)
end
