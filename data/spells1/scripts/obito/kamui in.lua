function onCastSpell(cid, var)
local Tile2 = {x = 951, y = 858, z = 10} -- onde o player target teleportado
local from1,to1 = {x = 945, y = 853, z = 10},{x = 958, y = 863, z = 10} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from2,to2 = {x=979, y=911, z=7},{x=994, y=918, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from3,to3 = {x=979, y=911, z=7},{x=994, y=918, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from4,to4 = {x=1552, y=1254, z=7},{x=1561, y=1262, z=7} -- ponto 1 ao ponto 2 da area
local from5,to5 = {x=979, y=911, z=7},{x=994, y=918, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from6,to6 = {x=1156, y=1192, z=7},{x=1172, y=1172, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from7,to7 = {x=664, y=1096, z=7},{x=685, y=1104, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from8,to8 = {x=1553, y=1254, z=7},{x=1562, y=1262, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from9,to9 = {x=1133, y=1039, z=12},{x=972, y=873, z=12} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from10,to10 = {x=1133, y=1039, z=11},{x=972, y=873, z=11} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from11,to11 = {x=1133, y=1039, z=10},{x=972, y=873, z=10} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local pos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local targetpos = getCreaturePosition(target)
local time = 5 -- tempo para voltar em segundos
if isInRange(pos, from1, to1) or isInRange(pos, from2, to2) or isInRange(pos, from3, to3) or isInRange(pos, from4, to4) or isInRange(pos, from5, to5) or isInRange(pos, from6, to6) or isInRange(pos, from7, to7) or isInRange(pos, from8, to8) or isInRange(pos, from9, to9) or isInRange(pos, from10, to10) or isInRange(pos, from11, to11) then
doPlayerSendCancel(cid, "Você nao pode usar o Kamui aqui!")
return false
end

if exhaustion.check(cid, 5570) == true then
doPlayerSendTextMessage(cid, 23, "Aguarde " .. exhaustion.get(cid, 5570) .. " segundos para usar novamente.")
return false
end

local function Teleport_Target(target)
doTeleportThing(target, targetpos)
end
if isPlayer(target) then
exhaustion.set(cid, 5570, 15)
doTeleportThing(target, Tile2)
doPlayerSendTextMessage(target,25,"Você esta preso no Kamui por 5 Segundos!")
doSendMagicEffect(targetpos, 246)
addEvent(Teleport_Target, time*1000, target)
doCreatureSay(cid, "Kamui In", TALKTYPE_MONSTER)
else
doPlayerSendCancel(cid, "Voce so pode usar esta magia em players!")
end
end 