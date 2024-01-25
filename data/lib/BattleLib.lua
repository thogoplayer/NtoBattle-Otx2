_Lib_Battle_Info = {
Reward = {2160,150},
TeamOne = {name = "Shodaime Team", storage = 140120, pos = {x=735,y=1444,z=7}},
TeamTwo = {name = "Madara Team",storage = 140121,pos = {x=623,y=1444,z=7}},
storage_count = 180400,
tpPos = {x=1032, y=907, z=7},
limit_Time = 7 -- em minutos
}

function resetBattle()
return setGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage, 0) and setGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage, 0)
end

function OpenWallBattle()
local B = {
{2708,{x=676, y=1440, z=7, stackpos = 1}},
{2708,{x=676, y=1441, z=7, stackpos = 1}},
{2708,{x=676, y=1442, z=7, stackpos = 1}},
{2708,{x=676, y=1443, z=7, stackpos = 1}},
{2708,{x=676, y=1444, z=7, stackpos = 1}},
{2708,{x=676, y=1445, z=7, stackpos = 1}},
{2708,{x=676, y=1446, z=7, stackpos = 1}},
{2708,{x=676, y=1447, z=7, stackpos = 1}},
{2708,{x=676, y=1448, z=7, stackpos = 1}},
{2708,{x=676, y=1449, z=7, stackpos = 1}},
{2708,{x=676, y=1450, z=7, stackpos = 1}},
{2708,{x=676, y=1451, z=7, stackpos = 1}}
}
for i = 1, #B do
if getTileItemById(B[i][2], B[i][1]).uid == 0 then
doCreateItem(B[i][1], 1, B[i][2])
else
doRemoveItem(getThingfromPos(B[i][2]).uid,1)
end
end
end

function doBroadCastBattle(type,msg)
local players = {}
for _, cid in pairs(getPlayersOnline()) do
if getPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage) == 1 or getPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage) == 1 then
table.insert(players, cid)
end
end
for i = 1, #players do
doPlayerSendTextMessage(players[i],type,msg)
end
end

function removeBattleTp()
local t = getTileItemById(_Lib_Battle_Info.tpPos, 1387).uid
return t > 0 and doRemoveItem(t) and doSendMagicEffect(_Lib_Battle_Info.tpPos, CONST_ME_POFF)
end

function getWinnersBattle(storage)
local players,str = {},""
for _, cid in pairs(getPlayersOnline()) do
if getPlayerStorageValue(cid, storage) == 1 then
table.insert(players, cid)
end
end
str = str .. ""..#players.." Player"..(#players > 1 and "s" or "").." from team "..(getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage) == 0 and _Lib_Battle_Info.TeamTwo.name or _Lib_Battle_Info.TeamOne.name).." won the event battlefield, they received a ".._Lib_Battle_Info.Reward[2].." "..getItemNameById(_Lib_Battle_Info.Reward[1]).."!"
for i = 1, #players do
doPlayerAddItem(players[i], _Lib_Battle_Info.Reward[1], _Lib_Battle_Info.Reward[2])
doRemoveCondition(players[i], CONDITION_OUTFIT)
doTeleportThing(players[i], getTownTemplePosition(getPlayerTown(players[i])))
setPlayerStorageValue(players[i], storage, -1)
end
resetBattle()
OpenWallBattle()
return doBroadcastMessage(str)
end

function CheckEvent(delay)
if delay > 0 and getGlobalStorageValue(_Lib_Battle_Info.storage_count) > 0 then
doBroadcastMessage("[BattleField Event] We are waiting "..getGlobalStorageValue(_Lib_Battle_Info.storage_count).." players to Battlefield starts")
elseif delay == 0 and getGlobalStorageValue(_Lib_Battle_Info.storage_count) > 0 then
local players = {}
for _, cid in pairs(getPlayersOnline()) do
if getPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage) == 1 or getPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage) == 1 then
table.insert(players, cid)
end
end
for i = 1, #players do
doRemoveCondition(players[i], CONDITION_OUTFIT)
doTeleportThing(players[i], getTownTemplePosition(getPlayerTown(players[i])))
setPlayerStorageValue(players[i], getPlayerStorageValue(players[i], _Lib_Battle_Info.TeamOne.storage) == 1 and _Lib_Battle_Info.TeamOne.storage or _Lib_Battle_Info.TeamTwo.storage, -1)
end
doBroadcastMessage("The event cannot be started because not had enough players.")
setGlobalStorageValue(_Lib_Battle_Info.storage_count, 0)
resetBattle()
removeBattleTp()
end
addEvent(CheckEvent, 60000, delay-1)
end