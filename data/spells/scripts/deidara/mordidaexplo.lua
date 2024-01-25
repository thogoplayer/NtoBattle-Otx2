local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 27)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -60.2, 1, -60.2, 1)

function onCastSpell(cid, var)
local waittime = 2 -- Tempo de exhaustion
local storage = 115818

if exhaustion.check(cid, storage) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.")
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+7, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 199)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end