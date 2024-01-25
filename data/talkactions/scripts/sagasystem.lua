function onSay(cid, words, param, channel)
if(words == "/next") then
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
elseif (getPlayerStorageValue(player, 40000) >= 16) then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O player ja completou todas as sagas")

return true

end


doPlayerNextSaga(player)

elseif(words == "/prev") then
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
elseif (getPlayerStorageValue(player, 40000) <= 0) then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O player esta na saga 0")

return true

end

doPlayerPrevSaga(player)
end
return true
end