function onCastSpell(cid, var)
if getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_SAGA) then
doPlayerSendCancel(cid, "Você nao pode usar o Summon aqui")
return false
end
    
    local summonCreate = {
	["pain ningendo"] = "Pain Ningendo",
	["pain gakido"] = "Pain Gakido",
	["pain chikushodo"] = "Pain Chikushodo",
	["pain jigokudo"] = "Pain Jigokudo",
	["pain shurato"] = "Pain Shurato",
	["pain deva"] = "Pain Deva",
	}
    local c_Pos = getPlayerPosition(cid)
    local summonsEnable = {}
    for _, s in pairs(getCreatureSummons(cid)) do
	table.insert(summonsEnable, getCreatureName(s))
	end
	local createSummmon = false
    for _, name in pairs(summonCreate) do
		if(not(isInArray(summonsEnable, name))) then
			createSummmon = true
			local summon = doCreateMonster(_, c_Pos)
			if summon then
			doConvinceCreature(cid, summon)
			end
		doSendMagicEffect({x=c_Pos.x+1, y=c_Pos.y+1, z=c_Pos.z}, 152)
		doSendMagicEffect(c_Pos, 1043)
		end
    end
	return createSummmon
end