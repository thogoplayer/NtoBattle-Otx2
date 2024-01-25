local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)	---balanço nivel 170
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -35, 1, -40, 1)

local combat1 = createCombatObject()

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end
local function onCastSpell2(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

local function send(cid, target)
return isCreature(cid) and isCreature(target) and doSendDistanceShoot(getCreaturePosition(cid), getCreaturePosition(target), 72)
end


function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local parameters = {cid = cid, var = var}

if isPlayer(cid) and exhaustion.check(cid, 665778) then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end
local target = getCreatureTarget(cid)

exhaustion.set(cid, 665778, 1.5)
send(cid, target)
addEvent(send, 200, cid, target)
addEvent(send, 400, cid, target)
addEvent(effect, 200, target, {-1,0}, 548)
addEvent(effect, 400, target, {0,0}, 548)
addEvent(effect, 600, target, {1,0}, 548)
addEvent(onCastSpell2, 200, parameters)
addEvent(onCastSpell1, 400, parameters)
addEvent(onCastSpell2, 600, parameters)
return true
end