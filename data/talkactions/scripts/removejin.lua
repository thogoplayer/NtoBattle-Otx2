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
elseif (getPlayerStorageValue(player, 1234255) <= 0)  and (getPlayerStorageValue(player, 1234256) <= 0) then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O player não é Jinchuuriki")

return true

end


doCreatureSetStorage(player, 1234255, 0)
doCreatureSetStorage(player, 1234256, 0)
doCreatureSetStorage(player, 34245, 0)
doRemoveCreature(player)

return true

end