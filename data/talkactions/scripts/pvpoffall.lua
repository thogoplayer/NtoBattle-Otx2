function onSay(cid, words, param)
	local list = {}
for i, tid in ipairs(getPlayersOnline()) do
	list[i] = tid
end
for i = 1, #list do
	setPlayerStorageValue(list[i], 91821, 0)
	end
return true
end















