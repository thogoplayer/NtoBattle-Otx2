function onCastSpell(cid, var)
if isPlayer(cid) and getPlayerAccess(cid) < 3 and getPlayerStorageValue(cid, 17456)-os.time() > 1 then
local seetime = getPlayerStorageValue(cid, 17456)-os.time()
local minutes, seconds = math.floor(seetime/60), math.floor(seetime%60)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde "..minutes.." minuto(s) e "..seconds.." segundo(s) para usar novamente!")
return false
end

setPlayerStorageValue(cid, 17456, 5*60+os.time())
doPlayerSetVocation(cid, 132)
doCreatureChangeOutfit(cid, {lookType = 922})
for _, uid in pairs (getCreatureSummons(cid)) do
doSendMagicEffect(getThingPosition(uid), 54)
doRemoveCreature(uid)
end  
return true
end