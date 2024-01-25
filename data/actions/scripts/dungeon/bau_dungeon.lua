local baus = { -- configure os baus com a action id
   [4092] = {recompense_list = {18149, 2152}, count = {1, 15}, elopoints = 10},
   [4093] = {recompense_list = {18149, 2152}, count = {5, 11}, elopoints = 20},
   [4094] = {recompense_list = {18149, 2152}, count = {5, 35}, elopoints = 25},
   [4095] = {recompense_list = {18149, 2152}, count = {6, 45}, elopoints = 25}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
   local bau = baus[item.actionid]
   if not bau then
      print("Bau com a actionID: " .. item.actionid .. " nao registrado.")
      return true
   end

   for i = 1, #bau.recompense_list do
      doPlayerAddItem(cid, bau.recompense_list[i], bau.count[i])
   end

   doPlayerSendTextMessage(cid, 25, "Completado! Você completou a dungeon com sucesso.")
   setPlayerStorageValue(cid, DUNGEON_STORAGE_TIME, 0)
   doPlayerAddEloPoints(cid, bau.elopoints)
   setPlayerStorageValue(cid, DUNGEON_STORAGE_NUMERATION, 1)
   setPlayerStorageValue(cid, DUNGEON_STORAGE_CATEGORY, "Gennin/Chunnin")
   setPlayerStorageValue(cid, DUNGEON_STORAGE_KILLEDCREATURES, 0)
   setPlayerStorageValue(cid, DUNGEON_STORAGE_COUNTCREATURES_AREA, 0)
   doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_PLAYER_HIDE_TIME_MODULE, "hide".."@")
   doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))

   return true
end