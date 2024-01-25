function onSay(cid, words, param, channel)
	if getGlobalStorageValue(Fire.storages[2]) > 0 then
		doPlayerSendCancel(cid, "The event is already starting.") return true
	elseif not param or not tonumber(param) then 
		doPlayerSendCancel(cid, "Use only numbers.") return true 
	end
	local param = tonumber(param) <= 0 and 1 or tonumber(param)
	local tp = doCreateItem(1387, 1, Fire.teleport[1])
	doItemSetAttribute(tp, "aid", 45111)
	CheckFireEvent(tonumber(param))
	setGlobalStorageValue(Fire.storages[1], 0)
	setGlobalStorageValue(Fire.storages[2], 1)
	return true
end