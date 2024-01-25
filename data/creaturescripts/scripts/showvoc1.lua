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
-- ["Ghost"] = function(uid) 
                  -- return isPlayerGhost(uid) and '\n*GhostMode*' or ""
				  -- end,
}


function onLook(cid, thing, position, lookDistance)
if isPlayer(thing.uid) then
	local string = ""
    string = string .. looks["EloRank"](thing.uid, cid)
	string = string .. looks["Jinchuuriki"](thing.uid, cid)
	-- string = string .. looks["Ghost"](thing.uid)
	doPlayerSetSpecialDescription(thing.uid, string)
	end
    return true
end