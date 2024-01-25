local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -130.3, 1, -140.3, 1)

arr = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1},
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var)
if isPlayer(cid) and exhaustion.check(cid, 13153) == true then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local pos = getCreaturePosition(cid)
local target = getCreaturePosition(getCreatureTarget(cid))
local targetatk1 = {x=target.x, y=target.y, z=target.z}
local targetatk2 = {x=target.x, y=target.y+1, z=target.z}
local targetatk3 = {x=target.x, y=target.y+2, z=target.z}
local targetatk4 = {x=target.x+1, y=target.y+2, z=target.z}
local targetatk5 = {x=target.x+2, y=target.y+2, z=target.z}
local targetatk6 = {x=target.x+2, y=target.y+1, z=target.z}
local targetatk7 = {x=target.x+2, y=target.y, z=target.z}
local targetatk8 = {x=target.x+1, y=target.y, z=target.z}
local targetatk9 = {x=target.x+1, y=target.y+1, z=target.z}

local function magias(cid)
doSendMagicEffect(targetatk1, 140)
doSendMagicEffect(targetatk2, 140)
doSendMagicEffect(targetatk3, 140)
doSendMagicEffect(targetatk4, 140)
doSendMagicEffect(targetatk5, 140)
doSendMagicEffect(targetatk6, 140)
doSendMagicEffect(targetatk7, 140)
doSendMagicEffect(targetatk8, 140)
doSendMagicEffect(targetatk9, 140)
end

local parameters = {cid = cid, var = var}
exhaustion.set(cid, 13153, 1)
doSendDistanceShoot(pos, target, 2)
addEvent(onCastSpell1, 200, parameters)
addEvent(magias, 200, cid)
return true
end