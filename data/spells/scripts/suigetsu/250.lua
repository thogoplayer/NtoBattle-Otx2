local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_SUITONDAMAGE)	---balanço nivel 250
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -45, 1, -50, 1)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 2.0 -- Tempo de exhaustion
local storage = 774372

if isPlayer(cid) and exhaustion.check(cid, storage) then
doPlayerSendCancel(cid, "Aguarde "..exhaustion.get(cid, 774372).." segundo(s) para usar novamente!")
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(position1, 340)
return doCombat(cid, combat, var)
end