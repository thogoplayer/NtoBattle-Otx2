function onSay(cid, words, param)
if(words == "/points") then
local t = string.explode(param, ",")  
if not t[1] then  return true,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.")  end  
local player = getPlayerByName(t[1])  
return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O Player "..getCreatureName(player).." Possui "..getPoints(player).." Premium Points em sua Account.")
elseif(words == "/addpoints") then  
if getPlayerAccess(cid) == 5 then
local t = string.explode(param, ",")  
if not t[1] or not t[2] then  return true,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.")  end  
local player = getPlayerByName(t[1])  
local points = t[2]  
local pid = getPlayerByNameWildcard(t[1])  
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then  
return true,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player with this name doesn\'t exist or is offline.")  end
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "você adicionou "..points.." Premium Points ao jogador "..t[1])  
db.query("UPDATE `accounts` SET `premium_points` = `premium_points` + "..points.." WHERE `id` = '" ..getPlayerAccountId(player).. "';")
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Foram adicionados "..points.." Premium Points na sua Account pelo "..getCreatureName(cid)..".")  
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Você agora tem "..getPoints(player).." Premium Points.")  
end
elseif(words == "/delpoints") then
if getPlayerAccess(cid) == 5 then
local t = string.explode(param, ",")  
if not t[1] or not t[2] then  return true,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.")  end  
local player = getPlayerByName(t[1])  
local points = t[2]  
local pid = getPlayerByNameWildcard(t[1])  
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then  
return true,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player with this name doesn\'t exist or is offline.")  end
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "você removeu "..points.." Premium Points do jogador "..t[1])  
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Foram removidos "..points.." Premium Points da sua Account pelo "..getCreatureName(cid)..".")  
db.query("UPDATE `accounts` SET `premium_points` = `premium_points` - "..points.." WHERE `id` = '" ..getPlayerAccountId(player).. "';")
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Você agora tem "..getPoints(player).." Premium Points.")  
end
elseif(words == "/setpoints") then
if getPlayerAccess(cid) == 5 then
local t = string.explode(param, ",")  
if not t[1] or not t[2] then  return true,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.")  end  
local player = getPlayerByName(t[1])  
local points = t[2]  
local pid = getPlayerByNameWildcard(t[1])  
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then  
return true,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player with this name doesn\'t exist or is offline.")  end
db.query("UPDATE `accounts` SET `premium_points` = "..points.." WHERE `id` = '" ..getPlayerAccountId(player).. "';")
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Agora o jogador "..t[1].." tem "..points.." Premium Points na sua account.")  
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Seus premium points foram modificados pelo "..getCreatureName(cid)..", agora você tem "..points.." Premium Points na sua account.")  
end
end
return true
end