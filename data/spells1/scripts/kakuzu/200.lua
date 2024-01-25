local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_RAITONDAMAGE)		---ataque nivel 300
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -25, 1, -30, 1)

local combat1 = createCombatObject()

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

local function onCastSpell2(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local parameters = {cid = cid, var = var}

if isPlayer(cid) and exhaustion.check(cid, 899123) == true then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local efepos = {x=getCreaturePosition(getCreatureTarget(cid)).x, y=getCreaturePosition(getCreatureTarget(cid)).y, z=getCreaturePosition(getCreatureTarget(cid)).z}
local efepos1 = {x=getCreaturePosition(getCreatureTarget(cid)).x+1, y=getCreaturePosition(getCreatureTarget(cid)).y, z=getCreaturePosition(getCreatureTarget(cid)).z}
local efepos2 = {x=getCreaturePosition(getCreatureTarget(cid)).x+2, y=getCreaturePosition(getCreatureTarget(cid)).y+2, z=getCreaturePosition(getCreatureTarget(cid)).z}
exhaustion.set(cid, 899123, 1.0)
doSendDistanceShoot(getCreaturePosition(cid), getCreaturePosition(getCreatureTarget(cid)), 0)
addEvent(doSendMagicEffect, 200, efepos, 132)
addEvent(doSendMagicEffect, 200, efepos1, 132)
addEvent(doSendMagicEffect, 200, efepos2, 283)
addEvent(onCastSpell2, 200, parameters)
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell2, 200, parameters)
return true
end