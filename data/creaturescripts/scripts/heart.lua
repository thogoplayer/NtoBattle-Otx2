function onDeath(cid, corpse, deathList)


if isPlayer(cid) and isPlayer(deathList[1]) then
local heart = doPlayerAddItem(deathList[1],5943, 1)
doItemSetAttribute(heart, "name", "" ..getPlayerName(cid).. " Heart's")
doItemSetAttribute(heart, "description", "Morto no level "..getPlayerLevel(cid).." por "..getPlayerName(deathList[1])..". " .. (getCreatureSkullType(cid) <= SKULL_GREEN and "(Unjustified)" or "(Justified)"))
end
return true
end