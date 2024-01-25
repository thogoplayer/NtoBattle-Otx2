function onSay(cid, words, param, channel)
local t = string.explode(param, ",")

if not tonumber(t[1]) or tonumber(t[1]) <= 0 or (t[1] == "") then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
return true
end

for _, pid in ipairs(getPlayersOnline()) do
setPlayerStorageValue(pid,  3000, getPlayerStorageValue(pid, 3000)+t[1])
doPlayerSendTextMessage(pid, MESSAGE_INFO_DESCR, "Todos os player online ganharam "..t[1].." "..(tonumber(t[1]) == 1 and  "Precense" or "Precense").." Points.")
end
return true
end