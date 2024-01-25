if getStorage(27000) < 1 then
setGlobalStorageValue(27000, 1)
end

function onSay(cid, words, param)
    if not tonumber(param) then
	doPlayerSendCancel(cid, "Escreva quantos pontos você quer vender.")
	return true
	end
	local points = math.floor(tonumber(param))
	if points < 1 then
	doPlayerSendCancel(cid, "O numero precisa ser maior que maior ou igual a 1.")
	return true
	end
	
	
	local ID = getStorage(27000)
	
	if getZnotePoints(cid) < points then
	doPlayerSendCancel(cid, "Você não possui esta quantidade de pontos.")
	return true
	end
	local file = "data/logs/createItemPoints.txt"
    local text = io.open(file, "a+")
	
	local s = doPlayerAddItem(cid, 7845)
	doItemSetAttribute(s, "name", "Scroll Premium Points")
	doItemSetAttribute(s, "description", "Create by " .. getCreatureName(cid).. "\nValor: "..points.." Points")
	doItemSetAttribute(s, "owner", getCreatureName(cid))
	doItemSetAttribute(s, "points", points)
	doItemSetAttribute(s, "id", ID)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Item de troca criado no valor de "..points.." Premium Points.")  
    removeZnotePoints(cid, points)
	text:write("["..os.date("%d/%m/%Y %X", os.time()).."] "..getPlayerName(cid).."("..getPlayerGUID(cid)..") Criou um item(ID: "..ID..") de troca no valor de "..points.." Premium Points.\n")
	text:close()
	setGlobalStorageValue(27000, ID+1)
return true
end