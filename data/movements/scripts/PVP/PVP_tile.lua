function onStepIn(cid, item, position, fromPosition)       --alterado v1.7 reformulado e melhorado ^^

if isSummon(cid) or ehMonstro(cid) then return false end     --alterado v1.8

local posis = { --{{pos}, storage, cor da roupa},
[25695] = {{x = 1004, y = 997, z = 13}, 6598754, 113},
[25696] = {{x = 965, y = 997, z = 13}, 6598755, 107},
[25697] = {{x = 973, y = 1065, z = 13}},
[25698] = {{x = 973, y = 1065, z = 13}},
}
local action = posis[item.actionid]
local out = getPlayerSex(cid) == 0 and 511 or 510
                                                                           --alterado v1.9
if getPlayerStorageValue(cid, 17001) == 1 or getPlayerStorageValue(cid, 5700) >= 1 or getPlayerStorageValue(cid, 17000) == 1 then
   doPlayerSendCancel(cid, "You can't do that while ride/fly/or in a bike.")
   doTeleportThing(cid, fromPosition, false)  --alterado v1.6
   return true
end
if getPlayerStorageValue(cid, 52480) >= 1 then
   doPlayerSendCancel(cid, "You are already dueling!")
   doTeleportThing(cid, fromPosition, false)  --alterado v1.6
   return true
end

if posis[item.actionid] then
   if isInArray({25695, 25696}, item.actionid) then
      setPlayerStorageValue(cid, action[2], 1)
      doSetCreatureOutfit(cid, {lookType = out, lookBody = action[3], lookHead = action[3], lookLegs = action[3], lookFeet = action[3]}, -1)
   else
      setPlayerStorageValue(cid, 6598754, -1) 
      setPlayerStorageValue(cid, 6598755, -1)
      doRemoveCondition(cid, CONDITION_OUTFIT) 
   end
   doTeleportThing(cid, getClosestFreeTile(cid, action[1]), false)  
elseif item.actionid == 24158 then
   if getCreatureCondition(cid, CONDITION_INFIGHT) == true then
      doPlayerSendCancel(cid, "You can't do that while is in battle!")
      doTeleportThing(cid, fromPosition, false)
   end
end
   
return true
end