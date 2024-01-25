local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_RAITONDAMAGE)		---balanço nivel 200
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -27, 1, -30, 1)


local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end


function onCastSpell(cid, var)
if isSelado(cid) then return false end
local waittime = 1.0
local storage = 899123
local parameters = {cid = cid, var = var}
local enemy = getCreaturePosition(getCreatureTarget(cid))
local pos = {x=enemy.x+1, y=enemy.y, z=enemy.z}
local pos1 = {x=enemy.x+1, y=enemy.y+1, z=enemy.z}

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end

exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 100, parameters)
addEvent(doSendMagicEffect, 100, pos, 367)
addEvent(doSendMagicEffect, 100, pos1, 369)
return true
end