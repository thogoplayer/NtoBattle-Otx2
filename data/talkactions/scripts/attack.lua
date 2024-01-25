function onSay(cid, words, param, channel) 

if (param == "on") then
if getGlobalStorageValue(11111) < 0 then
doPlayerSendTextMessage(cid, 27, "Os attacks ja estao ativados.")
return true
end
setGlobalStorageValue(11111, -1)

elseif (param == "off") then
if getGlobalStorageValue(11111) > 0 then
doPlayerSendTextMessage(cid, 27, "Os attacks ja estao desativados.")
return true
end
setGlobalStorageValue(11111, 1)
end
return true
end