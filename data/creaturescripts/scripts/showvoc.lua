-- function getPlayerFrags(cid)
    -- local time = os.time()
    -- local times = {today = (time - 86400), week = (time - (7 * 86400))}
    -- local contents, result = {day = {}, week = {}, month = {}}, db.getResult("SELECT `pd`.`date`, `pd`.`level`, `p`.`name` FROM `player_killers` pk LEFT JOIN `killers` k ON `pk`.`kill_id` = `k`.`id` LEFT JOIN `player_deaths` pd ON `k`.`death_id` = `pd`.`id` LEFT JOIN `players` p ON `pd`.`player_id` = `p`.`id` WHERE `pk`.`player_id` = " .. getPlayerGUID(cid) .. " AND `k`.`unjustified` = 1 AND `pd`.`date` >= " .. (time - (30 * 86400)) .. " ORDER BY `pd`.`date` DESC")
    -- if(result:getID() ~= -1) then
        -- repeat
            -- local content = {date = result:getDataInt("date")}
            -- if(content.date > times.today) then
                -- table.insert(contents.day, content)
            -- elseif(content.date > times.week) then
                -- table.insert(contents.week, content)
            -- else
                -- table.insert(contents.month, content)
            -- end
        -- until not result:next()
        -- result:free()
    -- end
    -- local size = {
        -- day = table.maxn(contents.day),
        -- week = table.maxn(contents.week),
        -- month = table.maxn(contents.month)
    -- }
    -- return size.day + size.week + size.month
-- end

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


local looks = {
["Jinchuuriki"] = function(uid, cid) 
                  return "\n"..(jin.getPlayerBijuu(uid) == 0 and _TR(cid, "It is not Jinchuuriki") or string.format(_TR(cid, "Jinchuuriki of %s"), jin.getPlayerBijuu(uid)))..""
				  end,
["EloRank"] = function(uid, cid) 
              local str = ""
			  if getPlayerGraduation(uid) then
			  local grupo = (getPlayerStorageValue(uid, 89745) == 1 and "[Anbu]" or getPlayerStorageValue(uid, 89746) == 1 and "[Akatsuki]" or  "[Shinobi Academy]")
			  str = string.format(_TR(cid, "%s on the rank %s and belongs to %s."),(uid ~= cid and _TR(cid, " He is") or _TR(cid, " You are")), getPlayerGraduation(uid).desc, grupo)
			  end
              return str
			  end,
["Kills"] = function(cid)
            local str = "\nKills: "
			str = str .. getDeathsAndKills(cid, "kill")
            return str
            end,
-- ["Ghost"] = function(uid) 
                  -- return isPlayerGhost(uid) and '\n*GhostMode*' or ""
				  -- end,
}


function onLook(cid, thing, position, lookDistance)
if isPlayer(thing.uid) then
	local string = ""
    string = string .. looks["EloRank"](thing.uid, cid)
	string = string .. looks["Jinchuuriki"](thing.uid, cid)
	string = string .. looks["Kills"](thing.uid)
	doPlayerSetSpecialDescription(thing.uid, string)
	end
    return true
end