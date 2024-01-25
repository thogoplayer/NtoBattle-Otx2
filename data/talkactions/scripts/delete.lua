function onSay(cid, words, param, channel)

if(param == "") then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite o nome do player.")
return true
end

if not getPlayerGUIDByName(param) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O nome "..param.." nao existe.")
return true
end

local check = db.getResult("SELECT name, group_id, deleted FROM players WHERE id = "..getPlayerGUIDByName(param).."")
if (tonumber(check:getDataString("group_id")) >= getPlayerGroupId(cid)) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao deletar alguem igual ou superior a voce!")
return true
end

if tonumber(check:getDataString("deleted")) <= 0 then
local GUID = getPlayerGUIDByName(param)
doBroadcastMessage("Character \""..check:getDataString("name").."\" as been deleted!", MESSAGE_INFO_DESCR)
if isPlayer(getPlayerByNameWildcard(param)) then
doRemoveCreature(getPlayerByNameWildcard(param))
end
db.query("UPDATE players SET deleted = 1 WHERE id = "..GUID)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Jogador "..check:getDataString("name").." ja esta deletado.")
end
return true
end