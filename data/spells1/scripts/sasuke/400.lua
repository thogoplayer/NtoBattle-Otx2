local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENTONDAMAGE)		---ataque nivel 400
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 83)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -75, 1, -80, 1)


function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 5.5 -- Tempo de exhaustion
local storage = 663563
local function DanosEffect()
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 174)
return true
end
if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getCreaturePosition(cid)
doSendMagicEffect({x = pos.x+3, y = pos.y+0, z = pos.z}, 366)
exhaustion.set(cid, storage, waittime)
return addEvent(doCombat, 200, cid, combat, var)
end
