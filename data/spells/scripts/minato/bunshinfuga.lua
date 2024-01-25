local time = 4000

local condition = createConditionObject(CONDITION_PACIFIED)
setConditionParam(condition, CONDITION_PARAM_TICKS, time)
local invisible = createConditionObject(CONDITION_GAMEMASTER, 4000, false, GAMEMASTER_INVISIBLE)
local outfit = createConditionObject(CONDITION_INVISIBLE, 4000, false)
 
local function removeGhost(player)
    local newPlayer = getPlayerByGUID(player)
    if isCreature(newPlayer) then
        if isPlayerGhost(newPlayer) then
            doCreatureExecuteTalkAction(newPlayer, "/theghostaberto", true)
        end
        if getPlayerGroupId(newPlayer) < 6 then
            setPlayerGroupId(newPlayer, 1)
        end
        if isPlayerGhost(newPlayer) then
            addEvent(removeGhost, 1000, player)
        end
    else
        addEvent(removeGhost, 1000, player)
    end
end 

function onCastSpell(cid, var)
	local cloth = getCreatureOutfit(cid)
		local storage = 1000102
		local waittime = 80
		local delay = 98121
local delay2 = 4
if getPlayerStorageValue(cid, delay)-os.time() > 0 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce tem que esperar "..getPlayerStorageValue(cid, delay)-os.time().." segundos para usar a spell novamente.")
return false
end
if getPlayerStorageValue(cid, storage)-os.time() > 0 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce tem que esperar "..getPlayerStorageValue(cid, storage)-os.time().." segundos para usar a spell novamente.")
return false
end
if getCreatureOutfit(cid).lookType == 11341 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11306 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11305 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11294 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11282 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11359 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11280 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11358 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11369 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11312 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11310 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11311 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11406 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11403 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11404 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11267 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11304 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11279 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 11026 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
if getCreatureOutfit(cid).lookType == 10603 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode usar fugas pois morreu.")
return false
end
	
	doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
	local position1 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	local crowPosition = {
		{x=getThingPosition(cid).x-1, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z},
		{x=getThingPosition(cid).x+1, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z},
		{x=getThingPosition(cid).x+1, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z},
		{x=getThingPosition(cid).x-1, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z},
		{x=getThingPosition(cid).x, y=getThingPosition(cid).y, z=getThingPosition(cid).z},
	}
	local crows = {}
	for _, pos in pairs (crowPosition) do 
		local crow = doCreateMonster("crow7", pos, false, true)
		doSetCreatureOutfit(crow, cloth, -1)
doSetCreatureOutfit(crow, cloth, -1)
		if crow then
			table.insert(crows, crow)
		end
	end
			local removeTarget = getCreatureTarget(cid) 

		 

		doPlayerRemoveTarget(removeTarget) 

		doPlayerRemoveTarget(cid) 
	summons = getCreatureSummons(cid)
for _, summon in pairs(summons) do
  doRemoveCreature(summon)
end
	doCreatureExecuteTalkAction(cid, "/theghostaberto", TRUE)
	setPlayerStorageValue(cid, 87892, 4+os.time())
	doPlayerSendTextMessage(cid, 27, "Voce esta invisivel por 4 segundos gracas ao dai taju kagebunshin no jutsu.")
	setPlayerStorageValue(cid, 10289, 0)
	doSetCreatureOutfit(cid, {lookType = 2040}, 5000)
	exhaustion.set(cid, STORAGE_IMORTAL, 4)
	exhaustion.set(cid, STORAGE_TARGET, 5)
	exhaustion.set(cid, STORAGE_BLOCKATTACK, 5)
	exhaustion.set(cid, 765232, 4)
    local player = getPlayerGUID(cid)
    addEvent(function()
        if isCreature(cid) then
            removeGhost(player)
        end
    end, 4000)
    local target = getCreatureTarget(cid)  -- efeito no alvo
    local pos = getCreaturePosition(target)
    local poz = getCreaturePosition(cid) -- effeito no caster
    local target = getCreatureTarget(cid)
    for i = 1, 3 do 
        addEvent(function()
            if isCreature(cid) then
                doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
            end
        end, i * 500)
    end
	doAddCondition(cid, pacified) -- cria essa condition no começo do arquivo
	addEvent(function()
		for _, crowId in pairs(crows) do 
			if isCreature(crowId) then
				local playerPosition = getCreaturePosition(cid)
				local crowPosition = getCreaturePosition(crowId)
				if playerPosition and crowPosition then
				end
				local player = Player(cid)
				if isCreature(cid) then
					addEvent(doCreatureSetHideHealth,2000,cid,false)
				end
				doRemoveCreature(crowId)
			end
		end
		local playerPosition = getCreaturePosition(cid)
		if playerPosition then
			
		end
	end, time)
	setPlayerStorageValue(cid, storage, waittime+os.time())
	setPlayerStorageValue(cid, delay, delay2+os.time())
	setPlayerStorageValue(cid, 98152, 7+os.time())
	return true
end
