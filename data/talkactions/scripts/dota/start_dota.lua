function onSay(cid, words, param, channel)
local mensage1 = "[Evento Dota] Evento Iniciado! Destruam as Torres! quem destruir as 3 Torres primeiro, Ganha!" -- Mensagem Inicial
local monster1 = "Gerador Azul I" -- Geradores Iniciais
local monster2 = "Gerador Vermelho I" -- Geradores Iniciais

gatepos = {x=685, y=42, z=7, stackpos=1} -- Posição da Pedras 1
getgate = getThingfromPos(gatepos)

gatepos11 = {x=685, y=41, z=7, stackpos=1} -- Posição da Pedras 11
getgate11 = getThingfromPos(gatepos11)

gatepos12 = {x=685, y=40, z=7, stackpos=1} -- Posição da Pedras 12
getgate12 = getThingfromPos(gatepos12)

gatepos13 = {x=685, y=44, z=7, stackpos=1} -- Posição da Pedras 13
getgate13 = getThingfromPos(gatepos13)

gatepos14 = {x=685, y=43, z=7, stackpos=1} -- Posição da Pedras 14
getgate14 = getThingfromPos(gatepos14)


gatepos2 = {x=601, y=42, z=7, stackpos=1} -- Posição da Pedra 2
getgate2 = getThingfromPos(gatepos2)

gatepos21 = {x=601, y=41, z=7, stackpos=1} -- Posição da Pedra 21
getgate21 = getThingfromPos(gatepos21)

gatepos22 = {x=601, y=40, z=7, stackpos=1} -- Posição da Pedra 22
getgate22 = getThingfromPos(gatepos22)

gatepos23 = {x=601, y=43, z=7, stackpos=1} -- Posição da Pedra 23
getgate23 = getThingfromPos(gatepos23)

gatepos24 = {x=601, y=44, z=7, stackpos=1} -- Posição da Pedra 24
getgate24 = getThingfromPos(gatepos24)

if getgate.itemid == 1304 and getgate2.itemid == 1304 then
broadcastMessage(mensage1, MESSAGE_EVENT_ADVANCE)
doCreateMonster(monster1, {x=607, y=42, z=7})
doCreateMonster(monster2, {x=679, y=42, z=7})
doRemoveItem(getgate.uid,1)
doRemoveItem(getgate11.uid,1)
doRemoveItem(getgate12.uid,1)
doRemoveItem(getgate13.uid,1)
doRemoveItem(getgate14.uid,1)

doRemoveItem(getgate2.uid,1)
doRemoveItem(getgate21.uid,1)
doRemoveItem(getgate22.uid,1)
doRemoveItem(getgate23.uid,1)
doRemoveItem(getgate24.uid,1)
doCreateItem(1304, {x=677, y=14, z=7})


end
return 1
end