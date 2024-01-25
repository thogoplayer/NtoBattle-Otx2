local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)		---ataque nivel 170
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -10, 1, -12, 1)

local waittime = 1.5
local storage = 665778

local function effect(cid, combat, var, target)
if isCreature(cid) and isCreature(target) then
local pos = getThingPosition(target)
doSendDistanceShoot({x= pos.x-1, y= pos.y-2, z= pos.z}, {x= pos.x, y= pos.y, z= pos.z}, 21)
doSendDistanceShoot({x= pos.x, y= pos.y-2, z= pos.z}, {x= pos.x, y= pos.y, z= pos.z}, 21)
doSendDistanceShoot({x= pos.x+1, y= pos.y-2, z= pos.z}, {x= pos.x, y= pos.y, z= pos.z}, 21)
doSendDistanceShoot({x= pos.x, y= pos.y-2, z= pos.z}, {x= pos.x, y= pos.y, z= pos.z}, 21)
doSendDistanceShoot({x= pos.x-1, y= pos.y-3, z= pos.z}, {x= pos.x, y= pos.y, z= pos.z}, 21)
doSendDistanceShoot({x= pos.x+1, y= pos.y-3, z= pos.z}, {x= pos.x, y= pos.y, z= pos.z}, 21)
end
doCombat(cid, combat, var)
end

function onCastSpell(cid, var) 
if isSelado(cid) then return false end

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local target = getCreatureTarget(cid)

local position1 = {x=getThingPosition(target).x, y=getThingPosition(target).y-2, z=getThingPosition(target).z}
doSendMagicEffect(position1, 958)
addEvent(effect, 300 , cid, combat, var, target)
addEvent(effect, 400 , cid, combat, var, target)
addEvent(effect, 500 , cid, combat, var, target)
addEvent(effect, 600 , cid, combat, var, target)
exhaustion.set(cid, storage, waittime)
return true
end
