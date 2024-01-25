local name_bosses_DG = {"[DUNGEON] Mizuki", "Zabuza Enfraquecido"} -- nome dos boss's da DG

function onKill(cid, target)
    if not isCreature(cid) then
        return true
    end

    if not isCreature(target) then
        return true
    end

    if isInArray(name_bosses_DG, getCreatureName(target)) and getPlayerStorageValue(cid, DUNGEON_STORAGE_TIME) - os.time() > 0 then
        if getPartyMembers(cid) ~= false then
            for k, v in ipairs(getPartyMembers(cid)) do
                local tabela = DUNGEONS_MISSIONCATEGORY[getPlayerStorageValue(v, DUNGEON_STORAGE_CATEGORY)]
                if not tabela then return true end
                tabela = tabela[getPlayerStorageValue(v, DUNGEON_STORAGE_NUMERATION)]

                doPlayerSendTextMessage(v, 25, "Parab�ns! Voc�s derrotaram o boss, portanto Voc�s foram teleportados para a �rea do pr�mio.")
                checkSalaDisponivelBauParty(cid, getPlayerStorageValue(cid, DUNGEON_STORAGE_CATEGORY), getPlayerStorageValue(cid, DUNGEON_STORAGE_NUMERATION))
            end
        else
            local tabela = DUNGEONS_MISSIONCATEGORY[getPlayerStorageValue(cid, DUNGEON_STORAGE_CATEGORY)]
            if not tabela then return true end
            tabela = tabela[getPlayerStorageValue(cid, DUNGEON_STORAGE_NUMERATION)]

            doPlayerSendTextMessage(cid, 25, "Parab�ns! voc� derrotou o boss, portanto voc� foi teleportado para a �rea do pr�mio.")
            checkSalaDisponivelBau(cid, getPlayerStorageValue(cid, DUNGEON_STORAGE_CATEGORY), getPlayerStorageValue(cid, DUNGEON_STORAGE_NUMERATION))
        end
    end
    return true
end