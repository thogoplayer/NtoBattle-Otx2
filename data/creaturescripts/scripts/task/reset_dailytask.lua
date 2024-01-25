function onLogin(cid)
    if getPlayerStorageValue(cid, TASKSYSTEM_ISINMISSION_STORAGE) >= 1 then
        local taskindex = getPlayerStorageValue(cid, TASKSYSTEM_CATEGORY)
        local tabela = TASKSYSTEM_MONSTERS[taskindex]
        if not tabela then
            return true
        end

        if getPlayerStorageValue(cid, tabela.storageDidAgain) < os.time() then
            setPlayerStorageValue(cid, tabela.storage, 0)
            setPlayerStorageValue(cid, TASKSYSTEM_ISINMISSION_STORAGE, 0)
            setPlayerStorageValue(cid, tabela.storageDidAgain, 0)
        end
    end
    return true    
end