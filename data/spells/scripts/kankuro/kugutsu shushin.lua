function onCastSpell(cid, var) if isSelado(cid) then return false end
local from1,to1 = {x=1964, y=731, z=7},{x=1976, y=742, z=7} -- tsukuyomi world
local from2,to2 = {x=984, y=578, z=7},{x=1044, y=652, z=7} -- shinobi war
local from3,to3 = {x=1241, y=723, z=6},{x=1257, y=738, z=6} -- kamui
local tempo = 20
local storage = 17451
local exhaust = 60


if isInRange(getCreaturePosition(cid), from1, to1) or isInRange(getCreaturePosition(cid), from2, to2) or isInRange(getCreaturePosition(cid), from3, to3) then
doPlayerSendCancel(cid, "Voce nao pode usar o Kugutsu Shunshin aqui.")
return false
end

if getTileInfo(getThingPos(cid)).nopvp then
doPlayerSendCancel(cid, "Voce nao pode usar o Kugutsu Shunshin aqui.")
return false
end

if exhaustion.check(cid, storage) == true then
doPlayerSendCancel(cid,"Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar o Kugutsu Shunshin novamente.")
return false
end

exhaustion.set(cid, 14100, tempo)
exhaustion.set(cid, storage, exhaust)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Kugutsu Shunshin ativado "..tempo.." seconds!")
doSendMagicEffect(getCreaturePos(cid), 190)
return true
end