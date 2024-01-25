function onCastSpell(cid, var) if isSelado(cid) then return false end

local targetpos = getCreaturePosition(cid)
local efepos = {x=targetpos.x, y=targetpos.y, z=targetpos.z}
local time = 60 -- tempo paralyzado

if isPlayer(cid) and exhaustion.check(cid, 12050) == true then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, 12050) .. " segundos para criar outra kusanagi.")
return false
end


exhaustion.set(cid, 12050, time)
local s = doPlayerAddItem(cid, 10524)
doItemSetAttribute(s, "description", "Owner: " .. getCreatureName(cid))
doItemSetAttribute(s, "dono", getCreatureName(cid))
doSendMagicEffect(efepos, 272)
return true
end