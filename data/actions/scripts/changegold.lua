local coins = {
	[ITEM_COIN] = {
		to = ITEM_YEN, effect = TEXTCOLOR_YELLOW
	},
	[ITEM_YEN] = {
		from = ITEM_COIN, to = ITEM_JP_IENE, effect = TEXTCOLOR_LIGHTBLUE
	},
	[ITEM_JP_IENE] = {
		from = ITEM_YEN, to = ITEM_RYO, effect = COLOR_MAYABLUE
	},
	[ITEM_RYO] = {
		from = ITEM_JP_IENE, effect = TEXTCOLOR_TEAL
	}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerFlagValue(cid, PLAYERFLAG_CANNOTPICKUPITEM)) then
		return false
	end

	local coin = coins[item.itemid]
	if(not coin) then
		return false
	end

	if(coin.to ~= nil and item.type == ITEMCOUNT_MAX) then
		doChangeTypeItem(item.uid, item.type - item.type)
		doPlayerAddItem(cid, coin.to, 1)
		doSendAnimatedText(fromPosition, "$$$", coins[coin.to].effect)
	elseif(coin.from ~= nil) then
		doChangeTypeItem(item.uid, item.type - 1)
		doPlayerAddItem(cid, coin.from, ITEMCOUNT_MAX)
		doSendAnimatedText(fromPosition, "$$$", coins[coin.from].effect)
	end

	return true
end
