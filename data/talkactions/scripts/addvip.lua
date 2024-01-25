function onSay(cid, words, param)
local t = string.explode(param, ",")
	if(not t[2]) or (not tonumber(t[2])) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "/addvip [player], [valor].")
		return true
	end

	local tid = getPlayerByNameWildcard(t[1])
	if(not tid or (isPlayerGhost(tid) and getPlayerGhostAccess(tid) > getPlayerGhostAccess(cid))) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " not found.")
		return true
	end
	
	doPlayerAddPremiumDays(tid, t[2])
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você adicionou "..t[2].." Premium days ao jogador "..t[1])  
    doPlayerSendTextMessage(tid, MESSAGE_INFO_DESCR, "Foram adicionados "..t[2].." Premium days na sua account.")   
return true  
end