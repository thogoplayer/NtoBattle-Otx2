local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, CONDITION_YIN)		---ataque nivel 170
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -35, 1, -40, 1)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
if isSelado(cid) then return false end
local waittime = 1.5
local storage = 665778

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local position2 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local position3 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local position4 = {x=getThingPosition(getCreatureTarget(cid)).x+3, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local position5 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
local position6 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}
local position7 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y+3, z=getThingPosition(getCreatureTarget(cid)).z}
local position8 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y-1, z=getThingPosition(getCreatureTarget(cid)).z}
local position9 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y-2, z=getThingPosition(getCreatureTarget(cid)).z}
local position10 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y-3, z=getThingPosition(getCreatureTarget(cid)).z}
local position11 = {x=getThingPosition(getCreatureTarget(cid)).x-1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local position12 = {x=getThingPosition(getCreatureTarget(cid)).x-2, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local position13 = {x=getThingPosition(getCreatureTarget(cid)).x-3, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local position14 = {x=getThingPosition(getCreatureTarget(cid)).x-1, y=getThingPosition(getCreatureTarget(cid)).y-1, z=getThingPosition(getCreatureTarget(cid)).z}
local position15 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y-1, z=getThingPosition(getCreatureTarget(cid)).z}
local position16 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
local position17 = {x=getThingPosition(getCreatureTarget(cid)).x-1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
local pos = getCreaturePosition(cid)
addEvent(doSendMagicEffect, 1, {x = pos.x+3, y = pos.y+0, z = pos.z}, 0)
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(position1, 188)
doSendMagicEffect(position2, 188)
doSendMagicEffect(position3, 188)
doSendMagicEffect(position4, 188)
doSendMagicEffect(position5, 188)
doSendMagicEffect(position6, 188)
doSendMagicEffect(position7, 188)
doSendMagicEffect(position8, 188)
doSendMagicEffect(position9, 188)
doSendMagicEffect(position10, 188)
doSendMagicEffect(position11, 188)
doSendMagicEffect(position12, 188)
doSendMagicEffect(position13, 188)
doSendMagicEffect(position14, 188)
doSendMagicEffect(position15, 188)
doSendMagicEffect(position16, 188)
doSendMagicEffect(position17, 188)
return doCombat(cid, combat, var)
end
