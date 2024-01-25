function onSay(cid, words, param, channel)
local storage = 12231
local time = 30 -- em segundos
local file = "data/logs/sugestoes.txt"
local text = io.open(file, "a+")
local level = 100 -- level pra poder utilizar o broadcast

if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você precisa escrever algo.")
return true
end

if getPlayerLevel(cid) < level then
doPlayerSendCancel(cid, "Você precisa de "..level .."+ para dar uma sugestao.")
return true
end

local exhaust = exhaustion.get(cid, storage)

if(not exhaust) then
exhaustion.set(cid, storage, time)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você enviou sua sugestão com sucesso, esperamos que ela possa fazer a diferenca.Bom Jogo!!")
text:write("[" .. os.date("%d/%m/%Y %X", os.time()) .."] "..getPlayerName(cid)..": "..param.."\n")
text:close()
else
doPlayerSendCancel(cid, "Você tem que esperar " ..(getPlayerStorageValue(cid, config.storage) - os.time()).. " segundos para dar outra sugestao.")
end
return true
end