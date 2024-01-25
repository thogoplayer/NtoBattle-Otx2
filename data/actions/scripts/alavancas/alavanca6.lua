-- function onUse(cid, item, frompos, topos)

-- local seetime = getGlobalStorageValue(63264)-os.time()
-- local hours, minutes, seconds = math.floor(seetime/120), math.floor(seetime/60), math.floor(seetime%60)
-- local Times = 5 -- tempo em minutos

-- if item.uid == 14315 then
-- if item.itemid == 1945 then

-- player1pos = {x = 2936, y = 1644, z = 5, stackpos=253}
-- player1 = getThingfromPos(player1pos)
-- player2pos = {x = 2927, y = 1643, z = 6, stackpos=253}
-- player2 = getThingfromPos(player2pos)
-- player3pos = {x = 2987, y = 1599, z = 6, stackpos=253}
-- player3 = getThingfromPos(player3pos)
-- player4pos = {x = 2987, y = 1605, z = 6, stackpos=253}
-- player4 = getThingfromPos(player4pos)
-- player5pos = {x = 2993, y = 1662, z = 6, stackpos=253}
-- player5 = getThingfromPos(player5pos)
-- player6pos = {x = 2993, y = 1671, z = 6, stackpos=253}
-- player6 = getThingfromPos(player6pos)
-- player7pos = {x = 2999, y = 1720, z = 7, stackpos=253}
-- player7 = getThingfromPos(player7pos)
-- player8pos = {x = 3005, y = 1715, z = 7, stackpos=253}
-- player8 = getThingfromPos(player8pos)


-- if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 then

-- queststatus1 = getPlayerStorageValue(player1.uid,14316)
-- queststatus2 = getPlayerStorageValue(player2.uid,14316)
-- queststatus3 = getPlayerStorageValue(player3.uid,14316)
-- queststatus4 = getPlayerStorageValue(player4.uid,14316)
-- queststatus5 = getPlayerStorageValue(player5.uid,14316)
-- queststatus6 = getPlayerStorageValue(player6.uid,14316)
-- queststatus7 = getPlayerStorageValue(player7.uid,14316)
-- queststatus8 = getPlayerStorageValue(player8.uid,14316)

-- if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 and queststatus4 == -1 and queststatus5 == -1 and queststatus6 == -1 and queststatus7 == -1 and queststatus8 == -1 then
-- if getGlobalStorageValue(63250) - os.time() <= 0 then

-- nplayer1pos = {x = 3151, y = 1602, z = 6}
-- nplayer2pos = {x = 3149, y = 1602, z = 6}
-- nplayer3pos = {x = 3148, y = 1605, z = 6}
-- nplayer4pos = {x = 3147, y = 1603, z = 6}
-- nplayer5pos = {x = 3145, y = 1602, z = 6}
-- nplayer6pos = {x = 3145, y = 1604, z = 6}
-- nplayer7pos = {x = 3144, y = 1601, z = 6}
-- nplayer8pos = {x = 3144, y = 1603, z = 6}

-- doSendMagicEffect(player1pos,2)
-- doSendMagicEffect(player2pos,2)
-- doSendMagicEffect(player3pos,2)
-- doSendMagicEffect(player4pos,2)
-- doSendMagicEffect(player5pos,2)
-- doSendMagicEffect(player6pos,2)
-- doSendMagicEffect(player7pos,2)
-- doSendMagicEffect(player8pos,2)

-- doTeleportThing(player1.uid,nplayer1pos)
-- doTeleportThing(player2.uid,nplayer2pos)
-- doTeleportThing(player3.uid,nplayer3pos)
-- doTeleportThing(player4.uid,nplayer4pos)
-- doTeleportThing(player5.uid,nplayer5pos)
-- doTeleportThing(player6.uid,nplayer6pos)
-- doTeleportThing(player7.uid,nplayer7pos)
-- doTeleportThing(player8.uid,nplayer8pos)

-- doSendMagicEffect(nplayer1pos,4)
-- doSendMagicEffect(nplayer2pos,4)
-- doSendMagicEffect(nplayer3pos,4)
-- doSendMagicEffect(nplayer4pos,4)
-- doSendMagicEffect(nplayer5pos,4)
-- doSendMagicEffect(nplayer6pos,4)
-- doSendMagicEffect(nplayer7pos,4)
-- doSendMagicEffect(nplayer8pos,4)

-- doTransformItem(item.uid,1946)
-- setGlobalStorageValue(63250, Times*60 + os.time())

-- else
-- doPlayerSendCancel(cid,"Wait "..minutes.." minutes and "..seconds.." seconds to enter the quest!")
-- end
-- else
-- doPlayerSendCancel(cid,"Someone from this group has already done the quest!")
-- end
-- else
-- doPlayerSendCancel(cid,"8 players are required to start this quest!.")
-- end
-- return true
-- end

-- elseif item.uid == 14315 then
-- elseif item.itemid == 1946 then
-- doTransformItem(item.uid,1945)
-- end
-- end

local cooldown = 5 -- tempo em minutos

function onUse(cid, item, frompos, item2, topos)
if item.itemid == 1946 then return doTransformItem(item.uid,1945) end
local seetime = getGlobalStorageValue(63264)-os.time()
if getGlobalStorageValue(63264) > os.time() then return doPlayerSendCancel(cid,"Wait "..math.floor(seetime/60).." minutes and "..math.floor(seetime%60).." seconds to enter the quest!") end


player1pos = {x = 2936, y = 1644, z = 5, stackpos=253}
player1 = getThingfromPos(player1pos)
player2pos = {x = 2927, y = 1643, z = 6, stackpos=253}
player2 = getThingfromPos(player2pos)
player3pos = {x = 2987, y = 1599, z = 6, stackpos=253}
player3 = getThingfromPos(player3pos)
player4pos = {x = 2987, y = 1605, z = 6, stackpos=253}
player4 = getThingfromPos(player4pos)
player5pos = {x = 2993, y = 1662, z = 6, stackpos=253}
player5 = getThingfromPos(player5pos)
player6pos = {x = 2993, y = 1671, z = 6, stackpos=253}
player6 = getThingfromPos(player6pos)
player7pos = {x = 2999, y = 1720, z = 7, stackpos=253}
player7 = getThingfromPos(player7pos)
player8pos = {x = 3005, y = 1715, z = 7, stackpos=253}
player8 = getThingfromPos(player8pos)


if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 and player5.itemid > 0 and player6.itemid > 0 and player7.itemid > 0 and player8.itemid > 0 then
-- queststatus1 = getPlayerStorageValue(player1.uid,9017)
-- queststatus2 = getPlayerStorageValue(player2.uid,9017)
-- queststatus3 = getPlayerStorageValue(player3.uid,9017)
-- queststatus4 = getPlayerStorageValue(player4.uid,9017)
-- queststatus5 = getPlayerStorageValue(player5.uid,9017)
-- queststatus6 = getPlayerStorageValue(player6.uid,9017)
    -- if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 and queststatus4 == -1 and queststatus5 == -1 and queststatus6 == -1 then	
nplayer1pos = {x = 3151, y = 1602, z = 6}
nplayer2pos = {x = 3149, y = 1602, z = 6}
nplayer3pos = {x = 3148, y = 1605, z = 6}
nplayer4pos = {x = 3147, y = 1603, z = 6}
nplayer5pos = {x = 3145, y = 1602, z = 6}
nplayer6pos = {x = 3145, y = 1604, z = 6}
nplayer7pos = {x = 3144, y = 1601, z = 6}
nplayer8pos = {x = 3144, y = 1603, z = 6}


        doSendMagicEffect(player1pos,2)
        doSendMagicEffect(player2pos,2)
        doSendMagicEffect(player3pos,2)
        doSendMagicEffect(player4pos,2)
        doSendMagicEffect(player5pos,2)
        doSendMagicEffect(player6pos,2)
        doSendMagicEffect(player7pos,2)
        doSendMagicEffect(player8pos,2)

        doTeleportThing(player1.uid,nplayer1pos)
        doTeleportThing(player2.uid,nplayer2pos)
        doTeleportThing(player3.uid,nplayer3pos)
        doTeleportThing(player4.uid,nplayer4pos)
        doTeleportThing(player5.uid,nplayer5pos)
        doTeleportThing(player6.uid,nplayer6pos)
        doTeleportThing(player7.uid,nplayer6pos)
        doTeleportThing(player8.uid,nplayer6pos)

        doSendMagicEffect(nplayer1pos,4)
        doSendMagicEffect(nplayer2pos,4)
        doSendMagicEffect(nplayer3pos,4)
        doSendMagicEffect(nplayer4pos,4)
        doSendMagicEffect(nplayer5pos,4)
        doSendMagicEffect(nplayer6pos,4)
        doSendMagicEffect(nplayer7pos,4)
        doSendMagicEffect(nplayer8pos,4)

        doTransformItem(item.uid,1946)
        setGlobalStorageValue(63264, cooldown*60 + os.time())
    -- else
    -- return doPlayerSendCancel(cid,"Someone from this group has already done the quest!")
    -- end
else
return doPlayerSendCancel(cid,"8 players are required to start this quest!.")
end
return true
end