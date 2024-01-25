function onCastSpell(cid, var)

local pos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local pos1 = {x=getCreaturePosition(target).x+1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z}

if isInArea(getThingPos(cid), {x = 22, y = 1613, z = 7}, {x = 74, y = 1816, z = 7}) then
doPlayerSendCancel(cid, "Voce nao pode usar esta Spell dentro do Evento!")
return false
end
if isPlayer(cid) and exhaustion.check(cid, 13125) == true then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, 13125) .. " segundos para usar novamente.")
doSendMagicEffect(pos, 2)
return false
end

if isPlayer(cid) and getCreatureName(target) == "Trainer" then
doPlayerSendCancel(cid, "Voce nao pode usar esta magia no trainer.")
return false
end

exhaustion.set(cid, 13125, 5)
doTeleportThing(target, pos)
doSendMagicEffect(pos1, 54)
return true
end