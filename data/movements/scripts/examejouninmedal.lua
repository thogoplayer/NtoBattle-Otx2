function onStepIn(cid, item, position, fromPosition)
local storage = 13502 -- Storage
if getPlayerStorageValue(cid, storage) >= 1 then
else
doTeleportThing(cid, fromPosition)
doSendMagicEffect(getCreaturePos(cid), 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Voce precisa completar as 3 missoes do kakashi e entregar o comprovante para Ebisu Sensei, ent�o podera fazer o exame Jounin.")
end
return true
end