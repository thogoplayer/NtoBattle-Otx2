local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -7, 1, -8, 1)


function onCastSpell(cid, var)
local waittime = 2.0-- Tempo de exhaustion
local storage = 118782

if isPlayer(cid) and getPlayerStorageValue(cid, 18982) == 1 then
doPlayerSendTextMessage(cid, 20, "Voce esta Selado")
return false
end

if isPlayer(cid) and exhaustion.check(cid, storage) then
doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.")
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(position1, 56)
addEvent(doCombat, 500, cid, combat, var)
addEvent(doCombat, 1000, cid, combat, var)
addEvent(doCombat, 1500, cid, combat, var)
addEvent(doCombat, 2000, cid, combat, var)
return doCombat(cid, combat, var)
end


