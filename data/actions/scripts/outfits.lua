local partedoset = { 
[6000] = {premioid = 2523, storage = 6000, nomedaquest = "Naruto Goku"},
[6001] = {premioid = 2523, storage = 6001, nomedaquest = "Lee Sin"}, 
[6002] = {premioid = 2523, storage = 6002, nomedaquest = "Naruto Menma"}, 
[6003] = {premioid = 2523, storage = 6003, nomedaquest = "Sasuke Vegeta"}, 
[6004] = {premioid = 2523, storage = 6004, nomedaquest = "Meliodas"}, 
[6005] = {premioid = 2523, storage = 6005, nomedaquest = "Natsu"}, 
[6006] = {premioid = 2523, storage = 6006, nomedaquest = "Minato Superman"}, 
[6007] = {premioid = 2523, storage = 6007, nomedaquest = "Kaneki"}, 
[6008] = {premioid = 2523, storage = 6008, nomedaquest = "Mashmello"}, 
[6009] = {premioid = 2523, storage = 6009, nomedaquest = "Naruto Ichigo"},
[6010] = {premioid = 2523, storage = 6010, nomedaquest = "Pikachu Natalino"},
[6011] = {premioid = 2524, storage = 6011, nomedaquest = "Toshiro Hitsugaya"},
[6012] = {premioid = 2524, storage = 6012, nomedaquest = "Hoshigaki Kisame Punk"}
}

local temple = {x=992 ,y=891 ,z=5} -- Para onde ele sera teleportado quando usar o baú. 
function onUse(cid, item, frompos, item2, topos)
for i,x in pairs(partedoset) do
if item.actionid == i then 
if getPlayerStorageValue(cid, x.storage) <= 0 then
doTeleportThing(cid, temple) 
setPlayerStorageValue(cid, x.storage, 1)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce desbloqueou a "..x.nomedaquest.." Outfit no Seu Character!!") 
else
doPlayerSendCancel(cid, "Voce Ja Completou a "..x.nomedaquest.." quest e desbloqueou a outfit.") 
doTeleportThing(cid, temple) 
end 
end				 
end								  
return true 
end