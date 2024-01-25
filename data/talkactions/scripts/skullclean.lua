--- skull remover by kakilo - quinto script

function onSay(cid, words, param, channel)

if (getCreatureSkullType(cid) == SKULL_BLACK) then
if doPlayerRemoveMoney(cid, 20000) then
doCreatureSetSkullType(cid, SKULL_NONE)
doPlayerSendTextMessage(cid, 22, "Sou black skull foi removida.")
else
doPlayerSendTextMessage(cid, 22, "You need 20000 gold pieces to remove the black skull")
end
end

if (getCreatureSkullType(cid) == SKULL_RED) then
if doPlayerRemoveMoney(cid, 10000) then
doCreatureSetSkullType(cid, SKULL_NONE)
doPlayerSendTextMessage(cid, 22, "Sou red skull foi removida.")
else
doPlayerSendTextMessage(cid, 22, "You need 10000 gold pieces to remove the red skull")
end
end

if (getCreatureSkullType(cid) == SKULL_WHITE) then
if doPlayerRemoveMoney(cid, 1000) then
doCreatureSetSkullType(cid, SKULL_NONE)
doPlayerSendTextMessage(cid, 22, "Your soul was been cleaned.")
else
doPlayerSendTextMessage(cid, 22, "You need 1000 gold pieces to remove the white skull")
end
end

if (getCreatureSkullType(cid) == SKULL_NONE) then
doPlayerSendTextMessage(cid, 22, "Sou white skull foi removida!")
end

return true
end
