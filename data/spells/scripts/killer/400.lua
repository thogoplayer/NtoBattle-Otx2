local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_RAITONDAMAGE)   ---balanço nivel 400
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -77, 1, -80, 1)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local parameters = {cid = cid, var = var}

if isPlayer(cid) and exhaustion.check(cid, 663563) == true then
doPlayerSendCancel(cid, "Você esta exausto.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local efepos = {x=getCreaturePosition(getCreatureTarget(cid)).x+1, y=getCreaturePosition(getCreatureTarget(cid)).y+1, z=getCreaturePosition(getCreatureTarget(cid)).z}
exhaustion.set(cid, 663563, 5.5)
doSendDistanceShoot(getCreaturePosition(cid), getCreaturePosition(getCreatureTarget(cid)), 37)
addEvent(doSendMagicEffect, 200, efepos, 223)
addEvent(onCastSpell1, 200, parameters)
return true
end