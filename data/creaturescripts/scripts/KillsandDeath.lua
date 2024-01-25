function onLook(cid, thing, position, lookDistance)
function getDeathsAndKills(cid, type) -- by vodka
local query,d = db.getResult("SELECT `player_id` FROM "..(tostring(type) == "kill" and "`player_killers`" or "`player_deaths`").." WHERE `player_id` = "..getPlayerGUID(cid)),0
if (query:getID() ~= -1) then 
repeat
d = d+1
until not query:next()
query:free()
end
return d 
end
if isPlayer(thing.uid) then
doPlayerSetSpecialDescription(thing.uid, "\n"..(getPlayerSex(thing.uid) == 0 and "" or "").." Frags: ["..getDeathsAndKills(thing.uid, "kill").."] .\n"..(getPlayerSex(thing.uid) == 0 and "" or "").." Death: ["..getDeathsAndKills(thing.uid, "death").."] ")
end
return true
end