local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_SUITONDAMAGE)		---balanço nivel 300
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -55, 1, -60, 1)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 2.0 -- Tempo de exhaustion
local storage = 774372

if isPlayer(cid) and exhaustion.check(cid, storage) then
doPlayerSendCancel(cid, "Aguarde "..exhaustion.get(cid, 774372).." segundo(s) para usar novamente!")
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+3, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(position1, 417)
return doCombat(cid, combat, var)
end