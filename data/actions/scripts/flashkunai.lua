local quests =
{

[7382] = {storageId = 7382, rewardId = 7382, count = 1},
 
}



function doQuest(cid, quest, checkCap)
       if getPlayerStorageValue(cid, quest.storageId) == -1 then
         if checkCap and (getPlayerFreeCap(cid) < getItemWeight(quest.rewardId)*quest.count) then
            doPlayerSendCancel(cid, "You have found a " .. getItemNameById(quest.rewardId) .. "weighing " .. getItemWeight(reward.uid) .. " oz. It is too heavy.")
         end
            doPlayerAddItem(cid, quest.rewardId, quest.count)
            doPlayerSendTextMessage(cid, 25, "You have found " .. quest.count .. " " .. getItemNameById(quest.rewardId) ..".")
            setPlayerStorageValue(cid, quest.storageId, 1)
       else
            doPlayerSendCancel(cid, "It is empty.")
       end
return true       
end
            
            
function onUse(cid, item)
       if quests[item.uid] ~= nil then
          doQuest(cid, quests[item.uid], true)
       end
return true
end