--[[
	Capture The Flag System
	Author: Maxwell Denisson(MaXwEllDeN)
	Version: 2.0
	Contact: maxwellmda@gmail.com
]]


local CTF = CTF_LIB

function onStatsChange(cid, attacker, type, combat, value)
	if getPlayerStorageValue(cid, 16700) ~= -1 and type == 1 and getCreatureHealth(cid) - value <= 0 then
		if getPlayerStorageValue(cid, 16702) ~= -1 then
			CTF.returnFlag(cid, 1)
		end

		doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
		doCreatureAddMana(cid, getCreatureMaxMana(cid))
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
		return false
	end

	return true
end

function onLogout(cid)
	if getPlayerStorageValue(cid, 16700) ~= -1 then
		CTF.removePlayer(cid)
	end

   return true
end

function onCombat(cid, target)
	if getPlayerStorageValue(cid, 16700) ~= -1 then
		if getPlayerStorageValue(cid, 16700) == getPlayerStorageValue(target, 16700) then
			return false
		end
	end

	return true
end

function onAttack(cid, target)
	if getPlayerStorageValue(cid, 16700) ~= -1 then
		if getPlayerStorageValue(cid, 16700) == getPlayerStorageValue(target, 16700) then
			return false
		end
	end

	return true
end
