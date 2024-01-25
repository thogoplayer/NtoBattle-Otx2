function onSay(cid, words, param, channel)

local narutog = getPlayerStorageValue(cid, 6000)
local leesin = getPlayerStorageValue(cid, 6001)
local narutom = getPlayerStorageValue(cid, 6002)
local sasukev = getPlayerStorageValue(cid, 6003)
local meliodas = getPlayerStorageValue(cid, 6004)
local natsu = getPlayerStorageValue(cid, 6005)
local minatos = getPlayerStorageValue(cid, 6006)
local kaneki = getPlayerStorageValue(cid, 6007)
local marsh = getPlayerStorageValue(cid, 6008)
local narutoi = getPlayerStorageValue(cid, 6009)
local pikachu = getPlayerStorageValue(cid, 6010)
local Hitsugaya = getPlayerStorageValue(cid, 6011)
local kisapunk = getPlayerStorageValue(cid, 6012)
if (param == "") then
doPlayerPopupFYI(cid, "[====== OUTFIT SYSTEM======]\n\n-----QUEST-----\n\nNaruto Goku: "..(narutog <= 0 and "Nao Possui" or "Adiquirida").."\nLee Sin: "..(leesin <= 0 and "Nao Possui" or "Adiquirida").."\nNaruto Menma: "..(narutom <= 0 and "Nao Possui" or "Adiquirida").."\nSasuke Vegeta: "..(sasukev <= 0 and "Nao Possui" or "Adiquirida").."\nMeliodas: "..(meliodas <= 0 and "Nao Possui" or "Adiquirida").."\nNatsu: "..(natsu <= 0 and "Nao Possui" or "Adiquirida").."\nMinato Superman: "..(minatos <= 0 and "Nao Possui" or "Adiquirida").."\nKaneki: "..(kaneki <= 0 and "Nao Possui" or "Adiquirida").."\nMarshmello: "..(marsh <= 0 and "Nao Possui" or "Adiquirida").."\nNaruto Ichigo: "..(narutoi <= 0 and "Nao Possui" or "Adiquirida").."\nHitsugaya: "..(Hitsugaya <= 0 and "Nao Possui" or "Adiquirida").."\nKisame Punk: "..(kisapunk <= 0 and "Nao Possui" or "Adiquirida").."\n\n----- EVENTO-----\n\nPikachu Natalino: "..(pikachu <= 0 and "Nao Possui" or "Adiquirida").."")
return true
end

local bijuuscroll = {
["naruto goku"] = {outfitid = {lookType = 609}, storageid = 6000},
["lee sin"] = {outfitid = {lookType = 542}, storageid = 6001},
["naruto menma"] = {outfitid = {lookType = 543}, storageid = 6002},
["sasuke vegeta"] = {outfitid = {lookType = 544}, storageid = 6003},
["meliodas"] = {outfitid = {lookType = 550}, storageid = 6004},
["natsu"] = {outfitid = {lookType = 546}, storageid = 6005},
["minato superman"] = {outfitid = {lookType = 548}, storageid = 6006},
["kaneki"] = {outfitid = {lookType = 549}, storageid = 6007},
["marshmello"] = {outfitid = {lookType = 551}, storageid = 6008},
["naruto ichigo"] = {outfitid = {lookType = 552}, storageid = 6009},
["pikachu natalino"] = {outfitid = {lookType = 560}, storageid = 6010},
["hitsugaya"] = {outfitid = {lookType = 704}, storageid = 6011},
["kisame punk"] = {outfitid = {lookType = 558}, storageid = 6012},
}

for i,x in pairs(bijuuscroll) do
if (param == i) then
if getPlayerStorageValue(cid, x.storageid) == 1 then
doCreatureChangeOutfit(cid, x.outfitid)
else
doPlayerSendTextMessage(cid, 23, "Voce ainda nao possui esta Outfit.")
end
return true
end
end
end
