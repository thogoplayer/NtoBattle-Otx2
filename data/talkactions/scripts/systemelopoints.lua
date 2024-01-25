function onSay(cid, words, param)
if(words == "!elo") then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você tem "..getPlayerEloPoints(cid).." pontos de graduação, no momento você é "..getPlayerGraduation(cid).desc.." e possui "..getPlayerGraduation(cid).bonus.." de danos a mais.")
return 0
elseif(words == "/elopoints") then  
if getPlayerAccess(cid) == 6 then
local t = string.explode(param, ",")  
local player = getPlayerByName(t[1])  
local pid = getPlayerByNameWildcard(t[1])  
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then  
return true,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player with this name doesn\'t exist or is offline.")  end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O Player "..getCreatureName(player).." possui "..getPlayerEloPoints(player).." Elo Points.")
end
elseif(words == "/addelopoints") then  
if getPlayerAccess(cid) == 6 then
local t = string.explode(param, ",")  
if not t[1] or not t[2] then  return true,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.")  end  
local player = getPlayerByName(t[1])  
local points = t[2]  
local pid = getPlayerByNameWildcard(t[1])  
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then  
return true,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player with this name doesn\'t exist or is offline.")  end
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você adicionou "..points.." Elo Points do jogador "..t[1])  
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Foram adicionados "..points.." Elo Points no seu character.")  
doPlayerAddEloPoints(player,points)
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Você agora tem "..getPlayerEloPoints(player).." Elo Points.")  
end
elseif(words == "/removeelopoints") then
if getPlayerAccess(cid) == 6 then
local t = string.explode(param, ",")  
if not t[1] or not t[2] then  return true,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.")  end  
local player = getPlayerByName(t[1])  
local points = t[2]  
local pid = getPlayerByNameWildcard(t[1])  
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then  
return true,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player with this name doesn\'t exist or is offline.")  end
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você removeu "..points.." Elo Points do jogador "..t[1])  
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Foram removidos "..points.." Elo Points do seu character.")  
doPlayerRemovePoints(player,points)
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Você agora tem "..getPlayerEloPoints(player).." Elo Points.")  
end
elseif(words == "/setelopoints") then
if getPlayerAccess(cid) == 6 then
local t = string.explode(param, ",")  
if not t[1] or not t[2] then  return true,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.")  end  
local player = getPlayerByName(t[1])  
local points = t[2]  
local pid = getPlayerByNameWildcard(t[1])  
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then  
return true,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player with this name doesn\'t exist or is offline.")  end
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Agora o jogador "..t[1].." tem "..points.." Elo Points no seu character.")  
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "agora você tem "..points.." Elo Points do seu character.")  
doPlayerSetEloPoints(player,points)
end
elseif(words == "/atualizarkage") then
AtualizarKages()
end
return true
end