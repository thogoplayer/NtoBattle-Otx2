AREA_EVENT_BAG = {
{{x = 2029, y = 3613, z = 7},{x = 2038, y = 3623, z = 7}},  -- bag
{{x = 2023, y = 3633, z = 7},{x = 2061, y = 3698, z = 7}}
}

local evento = {x = 2034, y = 3620, z = 7}
local limit = 1
local accepted_ip_list = {""} 


local function countPlayersAreaByIP(ip, area)
local count = 0
    for _, mc in pairs (getPlayersByIp(ip)) do
        if getCreatureIn(mc, area) then
        count = count + 1
        end
    end
return count
end

function onSay(cid, words, param, channel)
registerCreatureEvent(cid, "MoveDiceItem")
    local pos = getCreaturePosition(cid)
    if getTilePzInfo(pos) == false then
        return doPlayerSendTextMessage(cid, 27, "Voce so pode usar esse comando se tiver em uma protection zone.")
    elseif getGlobalStorageValue(15200) < 0 then
        return doPlayerSendTextMessage(cid, 27, "Nao esta tendo evento neste momento.")	
	elseif countPlayersAreaByIP(getPlayerIp(cid), AREA_EVENT_BAG) >= limit and isInArray(accepted_ip_list,doConvertIntegerToIp(getPlayerIp(cid))) == false then
	    return doPlayerSendTextMessage(cid, 27, "Permitido apenas "..limit.." por IP.")
    end
    doTeleportThing(cid, evento)
    return true
end