
-- House Window --

HOUSE_WINDOW_OPCODE = 76 -- numero da opcode

function convertValue(value)
	if value < 1000 then
		return tostring(value)
	else
		return tostring(string.format("%1.01f", value/1000))
	end
	return "none"
end

function getHouseOwnerNames(id)
	local result = db.getResult("SELECT `name` FROM `players` WHERE `house_id` = '" .. id .. "';")
	local name = "Nobody"
	if result:getID() ~= -1 then
		name = result:getDataString("name")
	end
	
	return name
end

function getHouseBeds(id)
	local result = db.getResult("SELECT `beds` FROM `houses` WHERE `id` = '" .. id .. "';")
	local beds = 0
	if result:getID() ~= -1 then
		belds = result:getDataInt("beds")
	end
	
	return beds
end

function sendHouseOpcodedWindow(playerId, houseId)
	if not isPlayer(playerId) then
		--print("Player not found")
		return false
	end

	local house = getHouseInfo(houseId, true)
	if not house then
		return false
	end
	
	local beds = getHouseBeds(house.id)
	local name = getHouseOwnerNames(house.id)
	doSendPlayerExtendedOpcode(playerId, HOUSE_WINDOW_OPCODE, "houseWindow".."@"..name.."@"..convertValue(house.price).."@"..belds.."@"..name.."@")
	return true
end