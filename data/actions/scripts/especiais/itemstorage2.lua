function onUse(cid, item)
   if getPlayerStorageValue(cid, 18214) < 1 then
      setPlayerStorageValue(cid, 18214, 1)
      doRemoveItem(item.uid, 1)
   end
   return true
end