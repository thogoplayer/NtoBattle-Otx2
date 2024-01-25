local cooldown = 360 -- tempo em minutos

function onUse(cid, item, frompos, item2, topos)
if item.itemid == 1946 then return doTransformItem(item.uid,1945) end
local seetime = getGlobalStorageValue(63319)-os.time()
if getGlobalStorageValue(63319) > os.time() then return doPlayerSendCancel(cid,"Wait "..math.floor(seetime/60).." minutes and "..math.floor(seetime%60).." seconds to enter the quest!") end


player1pos = {x = 3049, y = 2081, z = 8, stackpos=253}
player1 = getThingfromPos(player1pos)
player2pos = {x = 3073, y = 2080, z = 8, stackpos=253}
player2 = getThingfromPos(player2pos)
player3pos = {x = 3080, y = 2080, z = 8, stackpos=253}
player3 = getThingfromPos(player3pos)
player4pos = {x = 3104, y = 2070, z = 8, stackpos=253}
player4 = getThingfromPos(player4pos)
player5pos = {x = 3116, y = 2070, z = 8, stackpos=253}
player5 = getThingfromPos(player5pos)
player6pos = {x = 3107, y = 2053, z = 8, stackpos=253}
player6 = getThingfromPos(player6pos)
player7pos = {x = 3104, y = 2053, z = 8, stackpos=253}
player7 = getThingfromPos(player7pos)
player8pos = {x = 3075, y = 2046, z = 8, stackpos=253}
player8 = getThingfromPos(player8pos)


if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 and player5.itemid > 0 and player6.itemid > 0 and player7.itemid > 0 and player8.itemid > 0 then
-- queststatus1 = getPlayerStorageValue(player1.uid,9017)
-- queststatus2 = getPlayerStorageValue(player2.uid,9017)
-- queststatus3 = getPlayerStorageValue(player3.uid,9017)
-- queststatus3 = getPlayerStorageValue(player4.uid,9017)
-- queststatus3 = getPlayerStorageValue(player5.uid,9017)
-- queststatus3 = getPlayerStorageValue(player6.uid,9017)
-- queststatus3 = getPlayerStorageValue(player7.uid,9017)
-- queststatus3 = getPlayerStorageValue(player8.uid,9017)
    -- if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 and queststatus4 == -1 and queststatus5 == -1 and queststatus6 == -1 and queststatus7 == -1 and queststatus8 == -1 then	
    nplayer1pos = {x = 3090, y = 2216, z = 10}
	nplayer2pos = {x = 3091, y = 2216, z = 10}
	nplayer3pos = {x = 3092, y = 2216, z = 10}
	nplayer4pos = {x = 3093, y = 2216, z = 10}
	nplayer5pos = {x = 3094, y = 2216, z = 10}
	nplayer6pos = {x = 3095, y = 2216, z = 10}
	nplayer7pos = {x = 3096, y = 2216, z = 10}
	nplayer8pos = {x = 3097, y = 2216, z = 10}

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
        doTeleportThing(player7.uid,nplayer7pos)
        doTeleportThing(player8.uid,nplayer8pos)

        doSendMagicEffect(nplayer1pos,4)
        doSendMagicEffect(nplayer2pos,4)
        doSendMagicEffect(nplayer3pos,4)
        doSendMagicEffect(nplayer4pos,4)
        doSendMagicEffect(nplayer5pos,4)
        doSendMagicEffect(nplayer6pos,4)
        doSendMagicEffect(nplayer7pos,4)
        doSendMagicEffect(nplayer8pos,4)

        doTransformItem(item.uid,1946)
        setGlobalStorageValue(63319, cooldown*60 + os.time())
    -- else
    -- return doPlayerSendCancel(cid,"Someone from this group has already done the quest!")
    -- end
else
return doPlayerSendCancel(cid,"8 players are required to start this quest!.")
end
return true
end