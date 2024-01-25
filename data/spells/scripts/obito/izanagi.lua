local from1,to1 = {x=1964, y=731, z=7},{x=1976, y=742, z=7} -- tsukuyomi world
local from2,to2 = {x=984, y=578, z=7},{x=1044, y=652, z=7} -- shinobi war
local from3,to3 = {x=1241, y=723, z=6},{x=1257, y=738, z=6} -- kamui
local tempo = 20

function onCastSpell(cid, var)
if getCreatureIn(cid, AREA_KAMUI) or getCreatureIn(cid, AREA_ARENA) or getCreatureIn(cid, AREA_GENJUTSU) or getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_EVENT) then
doPlayerSendCancel(cid, "Voce Nao Pode Usar Esta Spell Aqui!")
return false
end

if getTileInfo(getThingPos(cid)).nopvp then
doPlayerSendCancel(cid, "Voce nao pode usar o Izanagi aqui.")
return false
end

if getPlayerStorageValue(cid, 17453) > os.time() then
local seetime = getPlayerStorageValue(cid, 17453)-os.time()
local hours, minutes, seconds = math.floor(seetime/120), math.floor(seetime/60), math.floor(seetime%60)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde "..minutes.." minutos e "..seconds.." segundos para usar novamente o Izanagi!")
return false
end

if isDanzou(cid) then
registerCreatureEvent(cid, "izanagii")
setPlayerStorageValue(cid, 14504, 2)
else
registerCreatureEvent(cid, "izanagi")
end
exhaustion.set(cid, 14500, tempo)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Izanagi protection for "..tempo.." seconds!")
doSendMagicEffect(getCreaturePosition(cid), 108)
setPlayerStorageValue(cid, 17453, 2*60+os.time())
savePos(cid, 14501)
return true
end