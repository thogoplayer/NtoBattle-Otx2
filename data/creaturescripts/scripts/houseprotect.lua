-- local function isInvited(houseId, playerName)
	-- if(string.find(string.lower(getHouseAccessList(houseId, 0x100)), playerName) or string.find(string.lower(getHouseAccessList(houseId, 0x101)), playerName)) then
		-- return true
	-- end
	-- return false
-- end

function onMoveItem(cid, item, count, toContainer, fromContainer, fromPos, toPos)
	-- if((getPlayerGroupId(cid) < 6) and (getTileInfo(frompos).house) and (getHouseOwner(getHouseFromPos(frompos)) ~= getPlayerGUID(cid)) and (not isInvited(getHouseFromPos(frompos), string.lower(getCreatureName(cid)))) or (getPlayerGroupId(cid) < 6) and (getTileInfo(position).house) and (getHouseOwner(getHouseFromPos(position)) ~= getPlayerGUID(cid)) and (not isInvited(getHouseFromPos(position), string.lower(getCreatureName(cid))))) then
		-- doPlayerSendCancel(cid, "Voce não esta convidado.")
	-- else
	doSendDistanceShoot(fromPos, toPos, 152)
	if item.itemid >= 5792 and item.itemid <= 5797 then
	doSendMagicEffect(toPos, 15)
	end
		-- return true
	-- end
end
