function onSay(cid, words, param, channel)
local storage,amount = 75457,2
if getPlayerStorageValue(cid, storage) ~= -1 then
doPlayerSendCancel(cid, "voc� j� ativou sua prote��o.") return true
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"voc� recebeu "..amount.." prote��o.")
setPlayerStorageValue(cid, storage, amount)
return true
end
