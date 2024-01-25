local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -60, 1, -62, 1)

function onCastSpell(cid, var)
local waittime = 1.0
local storage = 774372
local storag2 = 10215


if isPlayer(cid) and getPlayerStorageValue(cid, storag2) < 1 then
doPlayerSendCancel(cid, "Voce precisa estar no Modo Bijuu para usar esta spell.")
return false
end

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 296)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
