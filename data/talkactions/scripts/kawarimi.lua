function onSay(cid, words, param)				 
	if getPlayerLevel(cid) >=25 then
	exit = {x=1121, y=953, z=7}
	doTeleportThing(cid, exit, true)
	return true
	end
end