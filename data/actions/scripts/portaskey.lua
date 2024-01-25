local keys = {

[17208] = {port_uid = 34000, time_open = 30},   ----- chave da quest desetsu--------------Desert key------npc desertor
[17212] = {port_uid = 34001, time_open = 30},   ----- chave da quest yata no kagami-------holly key 
[17201] = {port_uid = 34003, time_open = 30},   ----  chave da quest demon slayer---------Bronze key------npc mad
[16129] = {port_uid = 34004, time_open = 30},   ----- chave da quest shibuki sword--------white key-------npc max
[17204] = {port_uid = 34005, time_open = 30},   ----- chave da quest kage fire------------Coral key-------npc himiko
[17211] = {port_uid = 34009, time_open = 30},   ----- chave da quest magestic Glover------viridian key----
}


local function Contagem(pos,time)
if time > 0 then
doSendAnimatedText(pos, time, 107)
time = time - 1
addEvent(Contagem, 1000, pos,time)
end
end

function onUse(cid, item, frompos, item2, topos)
if keys[item.itemid] == false then doPlayerSendCancel(cid, 'At the moment, this key does not open any door') return true end
if keys[item.itemid].port_uid ~= getItemAttribute(item2.uid, "uid") then doPlayerSendCancel(cid, 'This key does not open this door') return true end 
if getItemAttribute(item2.uid, "estado") == "Open" then doPlayerSendCancel(cid, 'This door is already open') return true end 


if keys[item.itemid].port_uid == getItemAttribute(item2.uid, "uid") then
local porta_id = item2.itemid
local porta_pos = topos
local function Fechar(pos)
local n = getTileThingByPos(pos)
if n.itemid == porta_id+1 then
doTransformItem(n.uid,porta_id)
doItemSetAttribute(n.uid,"estado", "Closed")
end
end

addEvent(Fechar,keys[item.itemid].time_open*1000, porta_pos)
doItemSetAttribute(item2.uid, "estado", "Open")
doTransformItem(item2.uid,porta_id + 1)
doTeleportThing(cid, porta_pos)
Contagem(porta_pos,keys[item.itemid].time_open)
doRemoveItem(item.uid)
end
return true
end


