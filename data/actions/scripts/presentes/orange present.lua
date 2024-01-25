function onUse(cid, item, frompos, item2, topos)

local quant = math.random(1, 3)
if getPlayerItemCount(cid, 12228) >= 1 then
doPlayerAddPremiumDays(cid, quant)
doPlayerSendTextMessage(cid, 27, "Voce abriu um present e recebeu "..quant.." dias de premium account")
doRemoveItem(item.uid)
else
doPlayerSendCancel(cid, "Voce precisa estar com o Present na bag para abri-lo")
end
return true
end




