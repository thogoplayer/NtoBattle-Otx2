function onMoveItem(cid, item, count, toContainer, fromContainer, fromPos, toPos)
	doSendDistanceShoot(fromPos, toPos, 152)
	if item.itemid >= 5792 and item.itemid <= 5797 then
	doSendMagicEffect(toPos, 15)
	end
return true
end
