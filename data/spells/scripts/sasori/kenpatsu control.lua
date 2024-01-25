function onCastSpell(cid, var)
local from1,to1 = {x=962, y=885, z=7},{x=973, y=892, z=7} -- começo e final do mapa
local from2,to2 = {x=979, y=901, z=7},{x=991, y=905, z=7} -- começo e final do mapa
local pos1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
local pos2 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local MaximoSummon = 1 --- Maximo de Monstros Sumonados

local summons = getCreatureSummons(cid)
if isInRange(getThingPos(cid), from1, to1) or isInRange(getThingPos(cid), from2, to2) then
doPlayerSendCancel(cid, "Você não pode usar Summons Aqui!")
return false
end

if(table.maxn(summons) < MaximoSummon) then
doSummonMonster(cid, "Kenpatsu Control")
doSendMagicEffect(pos1, 152)
doSendMagicEffect(pos2, 111)
return true
end
return false
end