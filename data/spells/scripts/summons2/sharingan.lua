function onCastSpell(cid, words, param)
local waittime = 20 -- Tempo de exhaustion
local storage = 5560
local pos = getCreaturePosition(cid)
from = {x=pos.x, y=pos.y, z=pos.z}
to = {x = 1235, y = 772, z = 7} -- Para onde o teleport levará (players)
to1 = {x = 1235, y = 773, z = 7} -- Para onde o teleport levará (caster)
area1 = {x = 1231, y = 769, z = 7} -- Ponta de cima na esquerda na area que o tp leva
area2 = {x = 1239, y = 775, z = 7} -- Ponta de baixo na direita na area que o tp leva
level = 100 -- Level necessário
ppos = getCreaturePosition(cid)
pl1 = {x=ppos.x-7, y=ppos.y-5, z=ppos.z}
pl2 = {x=ppos.x+7, y=ppos.y+5, z=ppos.z}

if getPlayerLevel(cid) < level then
doPlayerSendCancel(cid, "Você precisa de level "..level.." para usar essa magia.")
return true
end


function back(cid)
if isInArea(getCreaturePosition(cid), area1, area2) then
doTeleportThing(cid, from)
end
end

function go(cid)
if isInArea(getCreaturePosition(cid), pl1, pl2) then
doTeleportThing(cid, to)
end
end

function gos(cid)
if isInArea(getCreaturePosition(cid), from, from) then
doTeleportThing(cid, to1)
end
end

if exhaustion.check(cid, storage) == false then
for _, pid in ipairs(getPlayersOnline()) do
addEvent(back, 5000, pid) -- Tempo para retornar ao lugar que usou a magia
addEvent(go, 200, pid)
addEvent(gos, 1, pid)
doSendMagicEffect(getCreaturePosition(pid), 63)
doCreatureSay(pid, "ALGUEM USOU O TSUKUYOMI!", TALKTYPE_MONSTER) --- Mensagem
addEvent(setPlayerStorageValue, 10000, pid, 1634, -1) 
end

exhaustion.set(cid, storage, waittime)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.")
end
return true
end