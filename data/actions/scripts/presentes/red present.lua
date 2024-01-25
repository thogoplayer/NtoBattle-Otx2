function onUse(cid, item, fromPosition, itemEx, toPosition)
local addpointa = math.random(1, 3)
local addpoints = addpointa  -- Numero de pontos a ser adicionado
if getPlayerItemCount(cid, 12226) >= 1 then
db.query("UPDATE `accounts` SET `premium_points` = `premium_points` + "..addpoints.." WHERE `id` = '" ..getPlayerAccountId(cid).. "';")
doPlayerSendTextMessage(cid, 27, "Voce abriu um present e recebeu "..addpoints.." premium points no nosso SHOP Online.")
doRemoveItem(item.uid, 1)
else
doPlayerSendCancel(cid, "Voce precisa estar com o Present na bag para abri-lo")
end
return true
end






