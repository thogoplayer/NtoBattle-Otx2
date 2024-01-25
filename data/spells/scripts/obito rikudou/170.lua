local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)	---defesa nivel 170
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -37, 1, -42, 1)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local parameters = {cid = cid, var = var}

if isPlayer(cid) and exhaustion.check(cid, 665778) == true then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local efepos = {x=getCreaturePosition(getCreatureTarget(cid)).x, y=getCreaturePosition(getCreatureTarget(cid)).y, z=getCreaturePosition(getCreatureTarget(cid)).z}
exhaustion.set(cid, 665778, 1.5)
doSendDistanceShoot(getCreaturePosition(cid), getCreaturePosition(getCreatureTarget(cid)), 111)
addEvent(doSendMagicEffect, 100, efepos, 342)
addEvent(onCastSpell1, 100, parameters)
return true
end