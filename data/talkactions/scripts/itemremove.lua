function onSay(cid, words, param, channel)

if(param == '') then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")

return true

end


local t = string.explode(param, ",")


local player = getPlayerByNameWildcard(tostring(t[1]))

local item_id = tonumber(t[2])

local quant = tonumber(t[3])


if(not isPlayer(player)) then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player não existe.")

return true

elseif (getPlayerItemCount(player, item_id) <= 0) then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O player não possui este item.")

return true

elseif (getPlayerItemCount(player, item_id) < quant) then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O player não possui essa quantidade de item.")

return true

end


doPlayerRemoveItem(player, item_id, quant)

return true

end