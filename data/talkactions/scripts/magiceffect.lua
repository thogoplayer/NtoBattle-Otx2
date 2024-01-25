function onSay(cid, words, param, channel)
	param = tonumber(param)
	local limite = 1236
	if(not param or param < 0 or param > limite) then
		doPlayerSendCancel(cid, "Numeric param may not be lower than 0 and higher than " .. limite .. ".")
		return true
	end

	doSendMagicEffect(getCreaturePosition(cid), param)
	return true
end
