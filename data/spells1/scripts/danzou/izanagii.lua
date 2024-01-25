function onCastSpell(cid, var)
local from1,to1 = {x=1964, y=731, z=7},{x=1976, y=742, z=7} -- tsukuyomi world
local from2,to2 = {x=984, y=578, z=7},{x=1044, y=652, z=7} -- shinobi war
local from3,to3 = {x=1241, y=723, z=6},{x=1257, y=738, z=6} -- kamui
local tempo = 40


if isInRange(getCreaturePosition(cid), from1, to1) or isInRange(getCreaturePosition(cid), from2, to2) or isInRange(getCreaturePosition(cid), from3, to3) then
doPlayerSendCancel(cid, "Voce nao pode usar o Izanagi aqui.")
return false
end

if getTileInfo(getThingPos(cid)).nopvp then
doPlayerSendCancel(cid, "Voce nao pode usar o Izanagi aqui.")
return false
end

if getPlayerStorageValue(cid, 17453)-os.time() > 1 then
local seetime = getPlayerStorageValue(cid, 17453)-os.time()
local hours, minutes, seconds = math.floor(seetime/120), math.floor(seetime/60), math.floor(seetime%60)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde "..minutes.." minutos e "..seconds.." segundos para usar novamente o Izanagi!")
return false
end

exhaustion.set(cid, 14505, tempo)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Izanagi protection for "..tempo.." seconds!")
doSendMagicEffect(getCreaturePos(cid), 108)
setPlayerStorageValue(cid, 14507, 2)
setPlayerStorageValue(cid, 17453, 5*60+os.time())
setPlayerStorageValue(cid, 14501, getCreaturePosition(cid).x)
setPlayerStorageValue(cid, 14502, getCreaturePosition(cid).y)
setPlayerStorageValue(cid, 14503, getCreaturePosition(cid).z)
return true
end