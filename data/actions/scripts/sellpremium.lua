function onUse(cid, item, frompos, item2, topos)
local file = "data/logs/useItemPoints.txt"
local text = io.open(file, "a+")
addZnotePoints(cid, getItemAttribute(item.uid, "points"))
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você recebeu "..getItemAttribute(item.uid, "points").." Premium Points.")  
text:write("["..os.date("%d/%m/%Y %X", os.time()).."] "..getPlayerName(cid).."("..getPlayerGUID(cid)..") usou o item(ID: "..getItemAttribute(item.uid, "id")..") de troca.\n")
text:close()
doRemoveItem(item.uid)
return true
end