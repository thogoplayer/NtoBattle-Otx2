local tempo = 20
local storage = 17451
local exhaust = 240

function onCastSpell(cid, var) 
if isSelado(cid) then return false end

if getCreatureIn(cid, AREA_GENJUTSU) or getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_KAMUI)then
doPlayerSendCancel(cid, "Voce nao pode usar o Kugutsu Shunshin aqui.")
return false
end

if getTileInfo(getThingPos(cid)).nopvp then
doPlayerSendCancel(cid, "Voce nao pode usar o Kugutsu Shunshin aqui.")
return false
end

if exhaustion.check(cid, storage) then
doPlayerSendCancel(cid,"Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar o Kugutsu Shunshin novamente.")
return false
end

registerCreatureEvent(cid, "KugutsuShunshin")
exhaustion.set(cid, 14100, tempo)
exhaustion.set(cid, storage, exhaust)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Kugutsu Shunshin ativado "..tempo.." seconds!")
doSendMagicEffect(getCreaturePos(cid), 108)
return true
end