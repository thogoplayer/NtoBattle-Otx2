local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -10, 1, -13, 1)

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 0.9 -- Tempo de exhaustion
local storage = 665778

if isPlayer(cid) and exhaustion.check(cid, storage) then
doPlayerSendCancel(cid, "Aguarde "..exhaustion.get(cid, 665778).." segundo(s) para usar novamente!")
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(position1, 600)
return doCombat(cid, combat, var)
end