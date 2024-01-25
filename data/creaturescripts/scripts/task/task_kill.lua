function onKill(cid, target)
   if not isCreature(cid) then
      return true
   end

   if getPlayerStorageValue(cid, TASKSYSTEM_ISINMISSION_STORAGE) >= 1 then
      local target_name = getCreatureName(target)
      local taskindex = getPlayerStorageValue(cid, TASKSYSTEM_CATEGORY)
      local tabela = TASKSYSTEM_MONSTERS[taskindex]
      if not tabela then
         return true
      end

      if isInArray(tabela.monsters_list, target_name) then
         if getPlayerStorageValue(cid, tabela.storageDidAgain) - os.time() > 0 and getPlayerStorageValue(cid, tabela.storage2) ~= -1 then
            if getPlayerStorageValue(cid, tabela.storage) < tabela.count then
               setPlayerStorageValue(cid, tabela.storage, getPlayerStorageValue(cid, tabela.storage)+1)
               doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Muito bem! Você matou: " .. getPlayerStorageValue(cid, tabela.storage) .. " de " .. tabela.count .. " "..tabela.name .."'s, continue para completar a task.")
            end

            if getPlayerStorageValue(cid, tabela.storage) >= tabela.count then
               setPlayerStorageValue(cid, tabela.storage, tabela.count)
               doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Muito bem! Você completou a task, abra o modulo de TASK para coletar sua recompensa.")
               setPlayerStorageValue(cid, TASKSYSTEM_ISINMISSION_STORAGE, 0)
            end
         end
      end
   end
   return true
end