function onUse(cid, item, frompos, item2, topos)

local quant = math.random(5, 20)
if getPlayerItemCount(cid, 12227) >= 1 then
setPlayerStorageValue(cid, 3000, getPlayerStorageValue(cid, 3000)+quant) 
doPlayerSendTextMessage(cid, 27, "Voce abriu um present e recebeu "..quant.." presence points")
doRemoveItem(item.uid)
else
doPlayerSendCancel(cid, "Voce precisa estar com o Present na bag para abri-lo")
end
return true
end






