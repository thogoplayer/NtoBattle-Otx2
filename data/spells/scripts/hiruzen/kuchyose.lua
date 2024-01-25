function onCastSpell(cid, var)
if getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_SAGA) then
doPlayerSendCancel(cid, "Você nao pode usar o Summon aqui")
return false
end

local c_Pos = getPlayerPosition(cid)
if #getCreatureSummons(cid) < 1 then -- no summons
local summon = doCreateMonster("kuchyose mokujin", c_Pos)
if summon then
doConvinceCreature(cid, summon)
doSendMagicEffect({x=c_Pos.x+1, y=c_Pos.y+1, z=c_Pos.z}, 152)
doSendMagicEffect(c_Pos, 111)
end
return true
end
end