function onSay(cid, words, param)
	local list = {}
for i, tid in ipairs(getPlayersOnline()) do
	list[i] = tid
end
for i = 1, #list do
	doTeleportThing(list[i], getCreaturePosition(cid))
	end
return true
end















