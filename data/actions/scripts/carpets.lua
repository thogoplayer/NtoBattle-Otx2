local CONSTRUCTIONS = {
	[12611] = 12612, [12612] = 12611,
	[12613] = 12614, [12614] = 12613,
	[12615] = 12616, [12616] = 12615,
	[12617] = 12618, [12618] = 12617,
	[12619] = 12620, [12620] = 12619,
	[12621] = 12622, [12622] = 12621,
	[12623] = 12624, [12624] = 12623,
	[12625] = 12626, [12626] = 12625,
	[12627] = 12628, [12628] = 12627,
	[12629] = 12630, [12630] = 12629,
	[12631] = 12632, [12632] = 12631,
	[12633] = 12634, [12634] = 12633,
	[12635] = 12636, [12636] = 12635,
	[12637] = 12638, [12638] = 12637,
	[12639] = 12640, [12640] = 12639,
	[12639] = 12640, [12640] = 12639,
	[12712] = 12713, [12713] = 12712,
	}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(fromPosition.x == CONTAINER_POSITION) then
		doPlayerSendCancel(cid, "Put the construction kit on the floor first.")
	elseif(not getTileInfo(fromPosition).house) then
		doPlayerSendCancel(cid,"You may construct this only inside a house.")
	elseif(CONSTRUCTIONS[item.itemid] ~= nil) then
		doTransformItem(item.uid, CONSTRUCTIONS[item.itemid])
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
	else
		return false
	end

	return true
end
