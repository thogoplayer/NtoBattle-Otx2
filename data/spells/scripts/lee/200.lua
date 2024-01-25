local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_TAIJUTSUDAMAGE)		---ataque nivel 200
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -27, 1, -30, 1)


function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 1.0-- Tempo de exhaustion
local storage = 899123


if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos =  getCreaturePosition(getCreatureTarget(cid))
local pos2 = {x=(pos).x+1, y=(pos).y, z=(pos).z}
local pos3 = {x=(pos).x+4, y=(pos).y, z=(pos).z}
local pos4 = {x=(pos).x+1, y=(pos).y+1, z=(pos).z}
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(pos4, 64)
addEvent(doSendMagicEffect, 400, pos, 222)
addEvent(doSendMagicEffect, 700, pos2, 95)
addEvent(doSendMagicEffect, 700, pos3, 51)
addEvent(doCombat, 700, cid, combat, var)
return true
end
