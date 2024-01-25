local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -100, 1, -120, 1)

arr = {
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 3, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1}
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 1.0
local storage = 774372
local poss = getCreaturePosition(cid)

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end

local function Flame_Shoot()
if isCreature(cid) then
for i=1, 4 do
local pos = {x=poss.x-5, y=poss.y-5, z=poss.z}
local pos2 = {x=poss.x+(math.random(-2,2)), y=poss.y+(math.random(-2,2)), z=poss.z}
local pos3 = {x=poss.x+(math.random(-2,2))+1, y=poss.y+(math.random(-2,2))+1, z=poss.z}
doSendDistanceShoot(pos, pos2, 39)
doSendMagicEffect(pos3, 462)
end
end
return TRUE
end

local parameters = {cid = cid, var = var}
exhaustion.set(cid, storage, waittime)
addEvent(Flame_Shoot, 100)
addEvent(Flame_Shoot, 200)
addEvent(onCastSpell1, 300, parameters)
addEvent(onCastSpell1, 400, parameters)
return TRUE
end