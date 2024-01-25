function onUse(cid, item)
   if getPlayerStorageValue(cid, 18213) < 1 then
      setPlayerStorageValue(cid, 18213, 1)
      doRemoveItem(item.uid, 1)
   end
   return true
end