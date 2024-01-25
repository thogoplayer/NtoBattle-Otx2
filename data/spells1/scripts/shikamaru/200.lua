local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, CONDITION_YIN)	---ataque nivel 200
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -25, 1, -30, 1)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 1.0
local storage = 899123

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local pos = getCreaturePosition(cid)
addEvent(doSendMagicEffect, 1, {x = pos.x+3, y = pos.y+0, z = pos.z}, 0)
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(position1, 642)
return doCombat(cid, combat, var)
end
