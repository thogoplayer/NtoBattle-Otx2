local function check(cid, topos)
if isCreature(cid) and getPlayerStorageValue(cid, 16332) == 5 then
local gaara = doCreateNpc("Kazekage Gaara", topos)
if gaara then
addEvent(onSay, 500, gaara, "Obrigado "..getCreatureName(cid)..".", TALKTYPE_SAY)
addEvent(onSay, 2000, gaara, "Para o bem do mundo ninja e como o Kazekage, eu não exitarei em proteger a minha vila com a minha vida.", TALKTYPE_SAY)
addEvent(doRemoveCreature, 5000, gaara)
end
addEvent(doTeleportThing, 4000, cid, {x = 1340, y = 2203, z = 7})
doPlayerNextSaga(cid)
-- addEvent(doPlayerPopupFYI, 5000, cid, '     Capitulo '..getPlayerStorageValue(cid, 40000)..' desbloquado. \n ** O novo esconderijo de Orochimaru ** \n            (digite "saga")')
end
end

function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 40109) < 6 then
return doPlayerSendCancel(cid, "Primeiro converse com a vovó chiyo.")
elseif getPlayerStorageValue(cid, 16332) == 5 then
return doPlayerSendTextMessage(cid,22,"Você ja reviveu o gaara!")
end

local chance = 100
local mana = getCreatureMana(cid)
if mana == getCreatureMaxMana(cid) then
doCreatureAddMana(cid, -mana)
setPlayerStorageValue(cid, 16332, getPlayerStorageValue(cid, 16332)+1)
doPlayerSendTextMessage(cid,22,"Chakra necessario: 500% \n Chakra transmitido: "..(getPlayerStorageValue(cid, 16332)*100).."%\n")
doSendMagicEffect(getCreaturePosition(cid), 188) 
addEvent(check, 100, cid, topos)
else
return doPlayerSendCancel(cid, "Você precisa estar com o Chakra 100% para transmitir")
end
return true
end