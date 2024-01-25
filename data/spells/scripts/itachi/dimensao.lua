function onCastSpell(cid, var)
local Tile1 = {x = 1289, y = 710, z = 6} -- onde o player sera teleportado
local Tile2 = {x = 1289, y = 708, z = 6} -- onde o player target teleportado
local from1,to1 = {x = 1281, y = 702, z = 6},{x = 1298, y = 716, z = 6} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from2,to2 = {x = 1281, y = 702, z = 6},{x = 1298, y = 716, z = 6} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from2,to3 = {x=979, y=911, z=7},{x=994, y=918, z=7} -- arena konoha
local from3,to4 = {x=588, y=75, z=7},{x=700, y=141, z=7}  -- kamui obito
local from4,to5 = {x=588, y=75, z=6},{x=700, y=141, z=6}  -- kamui obito
local from5,to6 = {x=588, y=75, z=5},{x=700, y=141, z=5}  -- kamui obito
local from6,to7 = {x=588, y=75, z=4},{x=700, y=141, z=4}  -- kamui obito
local from6,to8 = {x= 973, y=1832, z= 7},{x= 1132, y=1953, z= 6}  -- ggn
local from6,to9 = {x= 973, y=1832, z= 7},{x= 1132, y=1953, z= 7}  -- ggn
local from6,to10 = {x= 973, y=1832, z= 7},{x= 1132, y=1953, z= 8}  -- ggn
local from6,to11 = {x= 973, y=1832, z= 7},{x= 1132, y=1953, z= 9}  -- ggn
local from6,to12 = {x= 973, y=1832, z= 7},{x= 1132, y=1953, z= 10}  -- ggn
local pos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local targetpos = getCreaturePosition(target)
local time = 5 -- tempo para voltar em segundos
if isInRange(pos, from2, to2) or isInRange(pos, from3, to3) or isInRange(pos, from4, to4) or isInRange(pos, from5, to5) or isInRange(pos, from6, to6) or isInRange(pos, from7, to7) or isInRange(pos, from8, to8) or isInRange(pos, from9, to9) or isInRange(pos, from10, to10) or isInRange(pos, from11, to11) or isInRange(pos, from12, to12) then
doPlayerSendCancel(cid, "Você nao pode usar esta spell aqui!")
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
doSendMagicEffect(pos, 221)
doSendMagicEffect(targetpos, 221)
addEvent(Teleport_Player, time*1000, cid)
addEvent(Teleport_Target, time*1000, target)
doCreatureSay(cid, "Genjutsu sharingan", TALKTYPE_MONSTER)
else
doPlayerSendCancel(cid, "Voce so pode usar esta magia em players!")
end
end 