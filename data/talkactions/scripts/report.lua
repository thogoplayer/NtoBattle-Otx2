function onSay(cid, words, param, channel)
local storage = 12235
local time = 30 -- em segundos
local file = "data/logs/Reports.txt"
local text = io.open(file, "a+")

if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
return true
end
local exhaust = exhaustion.get(cid, storage)
local pos = getCreaturePosition(cid)
if(not exhaust) then
exhaustion.set(cid, storage, time)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your report has been received successfully!")
text:write("[" .. os.date("%d/%m/%Y %X", os.time()) .."] {x= "..pos.x..", y= "..pos.y..", z= "..pos.z.." } "..getPlayerName(cid)..": "..param.."\n")
text:close()
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You must wait " .. exhaustion.get(cid, storage) .. " seconds to report again.")
end
return true
end