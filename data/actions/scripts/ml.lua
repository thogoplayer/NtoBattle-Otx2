function onUse(cid, item)

if getPlayerLevel(cid) < 500  then
doPlayerAddLevel(cid, 500 - getPlayerLevel(cid))
end

local amount = 80
local amount2 = 100
local pid = getPlayerGUID(cid)
if getPlayerSkillLevel(cid, 0) < amount then
doRemoveCreature(cid)
db.query("UPDATE `players` SET `maglevel` = " .. amount2 .. " WHERE `id` = "..pid)
db.query("UPDATE `player_skills` SET `value` = " .. amount .. " WHERE `player_id` = ".. pid .. " and `skillid` = 0;")
db.query("UPDATE `player_skills` SET `value` = " .. amount .. " WHERE `player_id` = ".. pid .. " and `skillid` = 1;")
db.query("UPDATE `player_skills` SET `value` = " .. amount .. " WHERE `player_id` = ".. pid .. " and `skillid` = 2;")
db.query("UPDATE `player_skills` SET `value` = " .. amount .. " WHERE `player_id` = ".. pid .. " and `skillid` = 3;")
db.query("UPDATE `player_skills` SET `value` = " .. amount .. " WHERE `player_id` = ".. pid .. " and `skillid` = 4;")
db.query("UPDATE `player_skills` SET `value` = " .. amount .. " WHERE `player_id` = ".. pid .. " and `skillid` = 5;")
end
end