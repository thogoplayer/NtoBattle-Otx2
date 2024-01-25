function onSay(cid, words, param)

local t = string.explode(param, ",")
local present = doCreateItemEx(1998)
if not t[1] then
doPlayerSendTextMessage(cid, 27, "Digite nome, quantidade.")
return true
end
local tid = getPlayerByNameWildcard(t[1])
if not tid then
doPlayerSendTextMessage(cid, 27, "Nome nao existe ou player está offline.")
return true
end
if not tonumber(t[2]) then
doPlayerSendTextMessage(cid, 27, "Digite nome, quantidade.")
return true
end

doPlayerSendTextMessage(tid, MESSAGE_INFO_DESCR, "Você recebeu o item!")
doAddContainerItem(present, 2160, t[2])
doPlayerSendMailByName(getPlayerNameByGUID(getPlayerGUIDByName(t[1])), present, 2)
doPlayerSendTextMessage(cid, 27,"Voce adicionou "..t[2].." points ao jogador "..getPlayerNameByGUID(getPlayerGUIDByName(t[1]))..".")
return true
end