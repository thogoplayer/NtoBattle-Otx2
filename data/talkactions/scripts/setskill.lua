function onSay(cid, words, param)

if (words == "/setskill") then

local t = string.explode(param, ",")
	if(not t[2]) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.")
		return true
	end

	local tid = getPlayerByNameWildcard(t[1])
	if(not tid or (isPlayerGhost(tid) and getPlayerGhostAccess(tid) > getPlayerGhostAccess(cid))) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " not found.")
		return true
	end
	if(not t[3]) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "/setskill [player], [skill id], [valor] ")
		return true
		end
	doPlayerSetSkill(tid, t[2], t[3])

elseif (words == "/setninjutsu") then

local t = string.explode(param, ",")
	if(not t[2]) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "/setninjutsu [player], [valor].")
		return true
	end

	local tid = getPlayerByNameWildcard(t[1])
	if(not tid or (isPlayerGhost(tid) and getPlayerGhostAccess(tid) > getPlayerGhostAccess(cid))) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " not found.")
		return true
	end
	doPlayerSetMagic(tid, t[2])
elseif (words == "/addsoul") then

local t = string.explode(param, ",")
	if(not t[2]) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "/addsoul [player], [valor].")
		return true
	end

	local tid = getPlayerByNameWildcard(t[1])
	if(not tid or (isPlayerGhost(tid) and getPlayerGhostAccess(tid) > getPlayerGhostAccess(cid))) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " not found.")
		return true
	end
	doPlayerAddSoul(tid, t[2])
elseif (words == "/skillfull") then

local t = string.explode(param, ",")

	local tid = getPlayerByNameWildcard(t[1])
	if(not tid or (isPlayerGhost(tid) and getPlayerGhostAccess(tid) > getPlayerGhostAccess(cid))) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " not found.")
		return true
	end
	local amount = 99
	local amount2 = 155
	local pid = getPlayerGUID(tid)
doRemoveCreature(tid,true)
db.query("UPDATE `players` SET `maglevel` = " .. amount2 .. " WHERE `id` = "..pid)
db.query("UPDATE `player_skills` SET `value` = " .. amount .. " WHERE `player_id` = ".. pid .. " and `skillid` = 0;")
db.query("UPDATE `player_skills` SET `value` = " .. amount .. " WHERE `player_id` = ".. pid .. " and `skillid` = 1;")
db.query("UPDATE `player_skills` SET `value` = " .. amount .. " WHERE `player_id` = ".. pid .. " and `skillid` = 2;")
db.query("UPDATE `player_skills` SET `value` = " .. amount .. " WHERE `player_id` = ".. pid .. " and `skillid` = 3;")
db.query("UPDATE `player_skills` SET `value` = " .. amount .. " WHERE `player_id` = ".. pid .. " and `skillid` = 4;")
db.query("UPDATE `player_skills` SET `value` = " .. amount .. " WHERE `player_id` = ".. pid .. " and `skillid` = 5;")
end
return true  

end