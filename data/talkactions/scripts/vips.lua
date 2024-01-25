function onSay(cid, words, param)
local a = os.time()
local b = math.floor((getPlayerStorageValue(cid, 19234) - a)/(24 * 60 * 60))
return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você tem ".. (b < 0 and 0 or b) .." dias de VIP no character.")
end