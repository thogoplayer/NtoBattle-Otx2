function onSay(cid, words, param)

-- doSendAnimatedText(getThingPosition(cid), "Teste", 123,cid)
-- doSendCreatureSquare(cid, 150,cid)
-- doMoveCreature(cid, NORTHEAST,10)
-- doPlayerSetExtraAttackSpeed(cid, speed)
-- doRelocate(pos, posTo[, creatures = true[, unmovable = true]])
-- doSteerCreature(cid, position)
-- doCleanTile(pos, forceMapLoaded = false)
-- doPlayerSwitchSaving(cid)
-- getSpectators(centerPos, rangex, rangey[, multifloor = false])
-- doCreatureExecuteTalkAction(cid, text[, ignoreAccess = false[, channelId = CHANNEL_DEFAULT]])
-- doPlayerSendPing(cid)
-- local playerpos = getClosestFreeTile(cid, getThingPos(cid))
-- local peixe = doSummonCreature("Snake",playerpos)
-- doChallengeCreature(cid, peixe)
-- doMonsterChangeTarget(cid,false)
-- doPlayerSendCancel(cid,""..getWorldCreatures(0-3).."")
-- doPlayerTargetCancel(cid)
-- doSendTutorial(cid, 20)
-- local numeros = {
-- {1,0},
-- {0,9},
-- {0,8},
-- {0,7},
-- {0,6},
-- {0,5},
-- {0,4},
-- {0,3},
-- {0,2},
-- {0,1},
-- }
-- local function EffectTime(cid, time)
-- local pos = getThingPosition(cid)
-- doSendAnimatedText({x=pos.x, y=pos.y-3, z=pos.z}, numeros[time][1], 200,cid)
-- doSendAnimatedText({x=pos.x+1, y=pos.y-3, z=pos.z}, numeros[time][2], 200,cid)
-- end

-- for i = 1,#numeros do
-- addEvent(EffectTime,i*1000, cid, i)
-- end
-- local t = loadRank()
-- local limit = table.maxn(t)
	-- local str = "TOP "..limit.." Rank Elo Points:\n\n"
	-- local k = 1
		-- while (k <= limit) do
			-- str = str .. "\n " .. k .. " - "..t[k][2].."["..t[k][3].."]"
			-- k = k + 1
		-- end 

    -- doBroadcastMessage(str, 22)
	-- resetEloRank()
	
	-- local t1,t2 = loadRank(), loadKageList()
	-- local str = "Lista - "..table.maxn(t2).."\n"
	-- for i=1, table.maxn(t2) do
	-- str = str .. "\n "..t2[i][1]..""	
	-- end
	-- doBroadcastMessage(str, 22)
	-- local s = doPlayerAddItem(cid, 11166)
	-- local edo = "Tsunade"
    -- doItemSetAttribute(s, "name", "Edo Tensei Selado")
    -- doItemSetAttribute(s, "description", "Contains a " .. edo)
    -- doItemSetAttribute(s, "corpsevocation", edo)	
-- function onMoveDir(uid, dir, count, delay)
-- if isCreature(uid) then
-- if isWalkable(getPosByDir(getCreaturePosition(uid),dir)) then
-- doMoveCreature(uid, dir)
-- end
-- doPlayerSendPing(cid)
-- doSendAnimatedText(getThingPosition(cid), getPlayerPing(cid), 123,cid)
-- if count > 0 then
-- addEvent(onMoveDir, delay, uid, dir, count-1, delay)
-- end
-- end
-- end

-- onMoveDir(cid, 7, 50, 1000)
setPlayerExtraLootRate(cid, 10000)
return true
end















