local level = 200   --lvl minimo pra ganhar
local sto = 999762 --storage
function onAdvance(cid, skill, oldLevel, newLevel)


if newLevel >= level then
   if getPlayerStorageValue(cid, sto) < 1 then
   setPlayerStorageValue(cid, sto, 1)
   doPlayerAddItem(cid, 10449, 1)
   doPlayerAddItem(cid, 10495, 1)
   doPlayerAddItem(cid, 12445, 1)
   doPlayerAddItem(cid, 11162, 1)
   doPlayerAddItem(cid, 2160, 15)
   doPlayerAddItem(cid, 10541, 100)
   doPlayerAddItem(cid, 10540, 100)
   doPlayerSendTextMessage(cid, 27, "you raised to level 200 and received a small reward")
   end
end
return true
end