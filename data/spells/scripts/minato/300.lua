local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FUUTONDAMAGE)		---balanço nivel 300
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 138)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -55, 1, -60, 1)

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_FUUTONDAMAGE)		---balanço nivel 300
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 138)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 2.0
local storage = 774372

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 0)
exhaustion.set(cid, storage, waittime)
addEvent(doCombat,100,cid, combat1, var)
addEvent(doCombat,300,cid, combat, var)
addEvent(doCombat,500,cid, combat1, var)
return doCombat(cid, combat, var)
end
