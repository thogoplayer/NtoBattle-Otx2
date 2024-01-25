local v = {}

for k = 1, 100 do

table.insert(v, createConditionObject(CONDITION_MUTED))

setConditionParam(v[k], CONDITION_PARAM_TICKS, k*60*1000)

end

function onSay(cid, words, param)

if (words == "/mute") then

local t = string.explode(param, ",")  

if param == '' then  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.")  return true end  

local player,time,pid = getPlayerByName(t[1]),t[2],getPlayerByNameWildcard(t[1])  

if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then  

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player with this name doesn\'t exist or is offline.")  return true  end

doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você mutou o jogador "..t[1].." por "..time.." minutos.")

doAddCondition(player, v[tonumber(time)])

setPlayerStorageValue(player, 90000, os.time()+time*60)

doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Você foi mutado por "..time.." minutos.")

elseif (words == "/unmute") then

if param == '' then  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.")  return true end  

local player = getPlayerByNameWildcard(param)

if(not player)then doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player not found.") return true end

if getCreatureCondition(player, CONDITION_MUTED) == false then doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "este jogador não está mutado.") return true end

doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você desmutou o jogador "..param..".")

doRemoveCondition(player, CONDITION_MUTED)

setPlayerStorageValue(player, 90000, -1)

doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Você foi desmutado.")

end

return true  

end