function onSay(cid, words, param, channel)

local t = string.explode(param, ",")
local Name = getPlayerByName(t[1])

if (not t[1]) then
doPlayerSendTextMessage(cid, 27, "Digite o nome do jogador.")
return true
end

if (not Name or (isPlayerGhost(tid) and getPlayerGhostAccess(tid) > getPlayerGhostAccess(cid))) then
doPlayerSendTextMessage(cid, 27, "O jogador nao existe ou esta offline.")
return true
end

if not tonumber(t[2]) or tonumber(t[2]) == 0 then
doPlayerSendTextMessage(cid, 27, "Coloque a quantidade de levels!")
return true
end

doPlayerAddLevel(Name, t[2])
doCreatureAddHealth(Name, 1)
doCreatureAddMana(Name, 1)
doPlayerSendTextMessage(cid, 27, "Voce "..(tonumber(t[2]) > 0 and "adicionou" or "removeu").." "..(tonumber(t[2])).." level"..(tonumber(t[2]) > 1 and "s" or tonumber(t[2]) < -1 and "s" or "").." para o jogador "..t[1]..".")
return true
end