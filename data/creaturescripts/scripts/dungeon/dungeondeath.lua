local name_monsters_DG = {"Bunshin Mizuki", "Bunshin Zabuza", "Bunshin Haku", "[DUNGEON] Zabuza", "[DUNGEON] Haku"} -- nome dos monstros da DG

function onDeath(cid, corpse, deathList)

local killer = deathList[1]

    if not isPlayer(killer) then
        return true
    end

    if isInArray(name_monsters_DG, getCreatureName(cid)) and getPlayerStorageValue(killer, DUNGEON_STORAGE_TIME) - os.time() > 0 then
        if getPartyMembers(killer) ~= false then
            local checkSalaDisponivelSpawnMonsterBossCalled = false
            for k, v in ipairs(getPartyMembers(killer)) do
                local storage = getPlayerStorageValue(v, DUNGEON_STORAGE_KILLEDCREATURES) or 0
                if storage <= 0 then storage = 0 end

                setPlayerStorageValue(v, DUNGEON_STORAGE_KILLEDCREATURES, getPlayerStorageValue(v, DUNGEON_STORAGE_KILLEDCREATURES) + 1)
                if getPlayerStorageValue(v, DUNGEON_STORAGE_KILLEDCREATURES) >= getPlayerStorageValue(v, DUNGEON_STORAGE_COUNTCREATURES_AREA) and not checkSalaDisponivelSpawnMonsterBossCalled then
                    checkSalaDisponivelSpawnMonsterBossCalled = true
                    checkSalaDisponivelSpawnMonsterBoss(killer, getPlayerStorageValue(killer, DUNGEON_STORAGE_CATEGORY), getPlayerStorageValue(killer, DUNGEON_STORAGE_NUMERATION))
                end

                doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_PLAYER_TIME_MODULE, getPlayerStorageValue(v, DUNGEON_STORAGE_TIME).."@"..getPlayerStorageValue(v, DUNGEON_STORAGE_KILLEDCREATURES).. " / " ..getPlayerStorageValue(v, DUNGEON_STORAGE_COUNTCREATURES_AREA).."@")
            end
        else
            local storage = getPlayerStorageValue(killer, DUNGEON_STORAGE_KILLEDCREATURES) or 0
            if storage <= 0 then storage = 0 end

            setPlayerStorageValue(killer, DUNGEON_STORAGE_KILLEDCREATURES, getPlayerStorageValue(killer, DUNGEON_STORAGE_KILLEDCREATURES) + 1)
            if getPlayerStorageValue(killer, DUNGEON_STORAGE_KILLEDCREATURES) >= getPlayerStorageValue(killer, DUNGEON_STORAGE_COUNTCREATURES_AREA) then
                checkSalaDisponivelSpawnMonsterBoss(killer, getPlayerStorageValue(killer, DUNGEON_STORAGE_CATEGORY), getPlayerStorageValue(killer, DUNGEON_STORAGE_NUMERATION))
            end
            
            doSendPlayerExtendedOpcode(killer, DUNGEON_OPCODE_PLAYER_TIME_MODULE, getPlayerStorageValue(killer, DUNGEON_STORAGE_TIME).."@"..getPlayerStorageValue(killer, DUNGEON_STORAGE_KILLEDCREATURES).. " / " ..getPlayerStorageValue(killer, DUNGEON_STORAGE_COUNTCREATURES_AREA).."@")
        end
    end

    return true
end