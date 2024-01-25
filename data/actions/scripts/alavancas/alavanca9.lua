local cooldown = 5 -- tempo em minutos

function onUse(cid, item, frompos, item2, topos)
if item.itemid == 1946 then return doTransformItem(item.uid,1945) end
local seetime = getGlobalStorageValue(63350)-os.time()
if getGlobalStorageValue(63350) > os.time() then return doPlayerSendCancel(cid,"Wait "..math.floor(seetime/60).." minutes and "..math.floor(seetime%60).." seconds to enter the quest!") end

player1pos = {x = 1111, y = 1699, z = 8, stackpos=253}
player1 = getThingfromPos(player1pos)
player2pos = {x = 1114, y = 1699, z = 8, stackpos=253}
player2 = getThingfromPos(player2pos)
player3pos = {x = 1107, y = 1703, z = 8, stackpos=253}
player3 = getThingfromPos(player3pos)
player4pos = {x = 1107, y = 1706, z = 8, stackpos=253}
player4 = getThingfromPos(player4pos)

if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 then
-- queststatus1 = getPlayerStorageValue(player1.uid,9017)
-- queststatus2 = getPlayerStorageValue(player2.uid,9017)
-- queststatus3 = getPlayerStorageValue(player3.uid,9017)
-- queststatus4 = getPlayerStorageValue(player4.uid,9017)
-- queststatus5 = getPlayerStorageValue(player5.uid,9017)
-- queststatus6 = getPlayerStorageValue(player6.uid,9017)
    -- if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 and queststatus4 == -1 and queststatus5 == -1 and queststatus6 == -1 then	
    nplayer1pos = {x = 1140, y = 1741, z = 8}
	nplayer2pos = {x = 1141, y = 1741, z = 8}
	nplayer3pos = {x = 1142, y = 1741, z = 8}
	nplayer4pos = {x = 1143, y = 1741, z = 8}

        doSendMagicEffect(player1pos,2)
        doSendMagicEffect(player2pos,2)
        doSendMagicEffect(player3pos,2)
        doSendMagicEffect(player4pos,2)

        doTeleportThing(player1.uid,nplayer1pos)
        doTeleportThing(player2.uid,nplayer2pos)
        doTeleportThing(player3.uid,nplayer3pos)
        doTeleportThing(player4.uid,nplayer4pos)

        doSendMagicEffect(nplayer1pos,4)
        doSendMagicEffect(nplayer2pos,4)
        doSendMagicEffect(nplayer3pos,4)
        doSendMagicEffect(nplayer4pos,4)

        doTransformItem(item.uid,1946)
        setGlobalStorageValue(63350, cooldown*60 + os.time())
    -- else
    -- return doPlayerSendCancel(cid,"Someone from this group has already done the quest!")
    -- end
else
return doPlayerSendCancel(cid,"4 players are required to start this quest!.")
end
return true
end