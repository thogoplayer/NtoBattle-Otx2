local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -110.3, 1, -120.3, 1)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var)
local parameters = {cid = cid, var = var}

if isPlayer(cid) and exhaustion.check(cid, 13152) == true then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local pos = getCreaturePosition(cid)
local target = getCreaturePosition(getCreatureTarget(cid))
local targetatk1 = {x=target.x, y=target.y+1, z=target.z}
local targetatk2 = {x=target.x+2, y=target.y+1, z=target.z}
local targetatk3 = {x=target.x+1, y=target.y, z=target.z}
local targetatk4 = {x=target.x+1, y=target.y+1, z=target.z}
local targetatk5 = {x=pos.x+1, y=pos.y+1, z=pos.z}

exhaustion.set(cid, 13152, 1)
doSendMagicEffect(targetatk1, 140)
doSendMagicEffect(targetatk2, 140)
doSendMagicEffect(targetatk3, 95)
doSendMagicEffect(targetatk4, 138)
doSendMagicEffect(targetatk5, 138)
addEvent(onCastSpell1, 1, parameters)
return true
end