function onUse(cid, item, frompos, item2, topos)

local seetime = getGlobalStorageValue(63253)-os.time()
local hours, minutes, seconds = math.floor(seetime/120), math.floor(seetime/60), math.floor(seetime%60)
local Times = 5 -- tempo em minutos

if item.uid == 14295 then
if item.itemid == 1945 then

player1pos = {x = 1996, y = 2375, z = 8, stackpos=253}
player1 = getThingfromPos(player1pos)

player2pos = {x = 1996, y = 2378, z = 8, stackpos=253}
player2 = getThingfromPos(player2pos)

player3pos = {x = 2012, y = 2342, z = 8, stackpos=253}
player3 = getThingfromPos(player3pos)

player4pos = {x = 2016, y = 2342, z = 8, stackpos=253}
player4 = getThingfromPos(player4pos)

player5pos = {x = 2026, y = 2378, z = 8, stackpos=253}
player5 = getThingfromPos(player5pos)

player6pos = {x = 2026, y = 2382, z = 8, stackpos=253}
player6 = getThingfromPos(player6pos)


if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 and player5.itemid > 0 and player6.itemid > 0 then

queststatus1 = getPlayerStorageValue(player1.uid,14296)
queststatus2 = getPlayerStorageValue(player2.uid,14296)
queststatus3 = getPlayerStorageValue(player3.uid,14296)
queststatus4 = getPlayerStorageValue(player4.uid,14296)
queststatus5 = getPlayerStorageValue(player5.uid,14296)
queststatus6 = getPlayerStorageValue(player6.uid,14296)

if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 and queststatus4 == -1 and queststatus5 == -1 and queststatus6 == -1 then
if getGlobalStorageValue(63250) - os.time() <= 0 then

nplayer1pos = {x = 2090, y = 2807, z = 7}
nplayer2pos = {x = 2092, y = 2807, z = 7}
nplayer3pos = {x = 2081, y = 2822, z = 7}
nplayer4pos = {x = 2083, y = 2823, z = 7}
nplayer5pos = {x = 2099, y = 2818, z = 7}
nplayer6pos = {x = 2098, y = 2821, z = 7}

doSendMagicEffect(player1pos,2)
doSendMagicEffect(player2pos,2)
doSendMagicEffect(player3pos,2)
doSendMagicEffect(player4pos,2)
doSendMagicEffect(player5pos,2)
doSendMagicEffect(player6pos,2)

doTeleportThing(player1.uid,nplayer1pos)
doTeleportThing(player2.uid,nplayer2pos)
doTeleportThing(player3.uid,nplayer3pos)
doTeleportThing(player4.uid,nplayer4pos)
doTeleportThing(player5.uid,nplayer5pos)
doTeleportThing(player6.uid,nplayer6pos)

doSendMagicEffect(nplayer1pos,4)
doSendMagicEffect(nplayer2pos,4)
doSendMagicEffect(nplayer3pos,4)
doSendMagicEffect(nplayer4pos,4)
doSendMagicEffect(nplayer5pos,4)
doSendMagicEffect(nplayer6pos,4)

doTransformItem(item.uid,1946)
setGlobalStorageValue(63250, Times*60 + os.time())

else
doPlayerSendCancel(cid,"Espere "..minutes.." minutos e "..seconds.." segundos para entrar na quest!")
end
else
doPlayerSendCancel(cid,"Alguem deste grupo ja fez a quest!")
end
else
doPlayerSendCancel(cid,"E necessario 6 jogadores para iniciar esta quest!!.")
end
return true
end

elseif item.uid == 14295 then
elseif item.itemid == 1946 then
doTransformItem(item.uid,1945)
end
end