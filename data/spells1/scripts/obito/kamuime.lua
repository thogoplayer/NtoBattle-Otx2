function onCastSpell(cid, var)
local Tile1 = {x = 937, y = 836, z = 9} -- onde o player sera teleportado
local from1,to1 = {x=1509, y=1259, z=7},{x=1509, y=1255, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from2,to2 = {x=979, y=911, z=7},{x=994, y=918, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from3,to3 = {x=1514, y=1262, z=7},{x=1504, y=1253, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from4,to4 = {x=1552, y=1254, z=7},{x=1561, y=1262, z=7} -- ponto 1 ao ponto 2 da area
local from5,to5 = {x=979, y=911, z=7},{x=994, y=918, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from6,to6 = {x=1156, y=1192, z=7},{x=1172, y=1172, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from7,to7 = {x=664, y=1096, z=7},{x=685, y=1104, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from8,to8 = {x=1553, y=1254, z=7},{x=1562, y=1262, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from9,to9 = {x=1133, y=1039, z=12},{x=972, y=873, z=12} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from10,to10 = {x=1133, y=1039, z=11},{x=972, y=873, z=11} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from11,to11 = {x=1133, y=1039, z=10},{x=972, y=873, z=10} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local pos = getCreaturePosition(cid)
if isInRange(pos, from1, to1) or isInRange(pos, from2, to2) or isInRange(pos, from3, to3) or isInRange(pos, from4, to4) or isInRange(pos, from5, to5) or isInRange(pos, from6, to6) or isInRange(pos, from7, to7) or isInRange(pos, from8, to8) or isInRange(pos, from9, to9) or isInRange(pos, from10, to10) or isInRange(pos, from11, to11) then
doPlayerSendCancel(cid, "Você nao pode usar o Kamui aqui!")
return false
end
local combat = createCombatObject()
function removeTeleport(pos)
tp = getTileItemById(pos, 1387).uid
doRemoveItem(tp, 1)
doSendMagicEffect(pos, 2)
end
local function Teleport_Player(cid)
doTeleportThing(cid, pos)
end

local pos = getCreaturePosition(cid)
if isPlayer(target) then
doTeleportThing(cid, Tile1)
doCreateTeleport(1387, enter, pos)
local tp = getTileItemById(pos, 1387).uid
doItemSetAttribute(tp, "aid", 5560)
doSendMagicEffect(pos, 196)
addEvent(Teleport_Player, time*1000, cid)
addEvent(removeTeleport, 5000, pos)
doCreatureSay(cid, "Kamui Me", TALKTYPE_MONSTER)
else
end 