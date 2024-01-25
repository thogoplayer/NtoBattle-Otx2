function onSay(cid, words, param)

	if not tonumber(param) then
	doPlayerSendCancel(cid, "Escreva quantos dias quer de vip.")
	return true
	end
	local list = {}
for i, tid in ipairs(getPlayersOnline()) do
	list[i] = tid
end
for i = 1, #list do
	doPlayerAddPremiumDays(list[i], tonumber(param))
	end
	if tonumber(param) <= 1 then
	doBroadcastMessage("O "..getCreatureName(cid).." acabou de entregar " ..tonumber(param).." premium day para todos os jogadores que estao online.")
	else
	doBroadcastMessage("O "..getCreatureName(cid).." acabou de entregar " ..tonumber(param).." premium days para todos os jogadores que estao online.")
	end
return true
end















