function onStepIn(cid, item, position, fromPosition)
local storage = 89745
if (not(getPlayerStorageValue(cid, 40000) == 54)) then
doPlayerPopupFYI(cid, "Voce nao pertence a esta Saga")
return false
end

if item.actionid == 28533 and getPlayerStorageValue(cid, storage) > 3 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"voc� n�o pode fazer novamente o exame anbu!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
return true
end