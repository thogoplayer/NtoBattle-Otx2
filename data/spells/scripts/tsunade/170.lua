local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DOTONDAMAGE)		---cura nivel 170
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -35, 1, -40, 1)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 1.5-- Tempo de exhaustion
local storage = 665778


if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
local position2 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
local position3 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local position4 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}
local pos = getCreaturePosition(cid)
exhaustion.set(cid, storage, waittime)
doSendMagicEffect({x = pos.x, y = pos.y, z = pos.z}, 183)
addEvent(doSendMagicEffect, 300, position1, 197)
addEvent(doSendMagicEffect, 300, position2, 197)
addEvent(doSendMagicEffect, 300, position3, 197)
addEvent(doSendMagicEffect, 300, position4, 197)
addEvent(doCombat, 400, cid, combat, var)
return true
end
