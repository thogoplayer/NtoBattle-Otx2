function onCastSpell(cid, var)
local waittime = 120.0
local storage = 5981765

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
exhaustion.set(cid, storage, waittime)
local Tile1 = {x = 951, y = 765, z = 7} -- onde o player sera teleportado
local Tile2 = {x = 951, y = 762, z = 7} -- onde o player target teleportado
local from1,to1 = {x = 1224, y = 696, z = 6},{x = 1247, y = 715, z = 6} -- dimensao do shisui
local from2,to2 = {x = 1281, y = 702, z = 6},{x = 1298, y = 716, z = 6} -- mundo do itachi
local from3,to3 = {x = 947, y = 758, z = 7},{x = 955, y = 766, z = 7} -- mundo do kakashi
local from4,to4 = {x = 947, y = 758, z = 7},{x = 955, y = 766, z = 7} -- mundo do obito
local from5,to5 = {x=979, y=911, z=7},{x=994, y=918, z=7} -- pvp konoha
local from6,to6 = {x=664, y=1097, z=7},{x=684, y=1103, z=7} -- pvp suna
local from7,to7 = {x=1161, y=1177, z=7},{x=1168, y=1189, z=7} -- pvp mist
local from8,to8 = {x=1628, y=864, z=7},{x=1645, y=873, z=7} -- pvp hoshigakure
local from9,to9 = {x=1000, y=704, z=7},{x=1033, y=738, z=7} -- evento rb
local from10,to10 = {x=1000, y=704, z=6},{x=1033, y=738, z=6} -- evento rb1
local from11,to11 = {x=1000, y=704, z=5},{x=1033, y=738, z=5} -- evento rb2
local from12,to12 = {x=1000, y=704, z=4},{x=1033, y=738, z=4} -- evento rb3
local from13,to13 = {x=964, y=1830, z=7},{x=1144, y=1945, z=7} -- ggn
local from13,to13 = {x=964, y=1830, z=6},{x=1144, y=1945, z=6} -- ggn1
local from13,to13 = {x=964, y=1830, z=5},{x=1144, y=1945, z=5} -- ggn2
local from13,to13 = {x=964, y=1830, z=4},{x=1144, y=1945, z=4} -- ggn3
local pos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local targetpos = getCreaturePosition(target)
local time = 8 -- tempo para voltar em segundos
if isInRange(pos, from1, to1) or isInRange(pos, from2, to2) or isInRange(pos, from3, to3) or isInRange(pos, from4, to4) or isInRange(pos, from5, to5) or isInRange(pos, from6, to6) or isInRange(pos, from7, to7) or isInRange(pos, from8, to8) or isInRange(pos, from9, to9) or isInRange(pos, from10, to10) or isInRange(pos, from11, to11) or isInRange(pos, from12, to12) or isInRange(pos, from13, to13) then
doPlayerSendCancel(cid, "Você nao pode usar kamui no jutsu aqui!")
return false
end
local function Teleport_Player(cid)
doTeleportThing(cid, pos)
end
local function Teleport_Target(target)
doTeleportThing(target, targetpos)
end
if isPlayer(target) then
doTeleportThing(cid, Tile1)
doTeleportThing(target, Tile2)
doSendMagicEffect(pos, 441)
doSendMagicEffect(targetpos, 441)
addEvent(Teleport_Player, time*1000, cid)
addEvent(Teleport_Target, time*1000, target)
doCreatureSay(cid, "mangekyou kamui", TALKTYPE_MONSTER)
else
doPlayerSendCancel(cid, "Voce so pode usar esta magia em players!")
end
end 