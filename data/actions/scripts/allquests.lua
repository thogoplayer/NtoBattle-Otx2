local quests = {
-- ["Nome da Quest"] = {uid = id do action, storageid = id do storage, elopoints = quantidade de elo points, premio = {iditem1(normal),iditem2(normal)}, gradu = ALUNO, gold = quantidade de golds}
["Sasuke"] = {uid = 9000, storageid = 9000, elopoints = 15, premio = {12314, 17616, 10412}, gradu = ALUNO, gold = 0},----------------------------South florest[buraco de cobra]----------------ok
["Kinkaku"] = {uid = 9003, storageid = 9003, elopoints = 25, premio = {10512}, gradu = ALUNO, gold = 0},--------------------------konoha[iha daishan]---------------------------ok
["Anbu"] = {uid = 9004, storageid = 9004, elopoints = 10, premio = {10493,15791}, gradu = ALUNO, gold = 0},------------------------south florest[montanha]-----------------------ok
["Itachi"] = {uid = 9005, storageid = 9005, elopoints = 40, premio = {11057}, gradu = ALUNO, gold = 0},--------------------south florest[covil itachi] c/key-------------ok
["Madara(Armor)"] = {uid = 9006, storageid = 9041, elopoints = 35, premio = {10448}, gradu = ALUNO, gold = 0, tp = {x = 1768, y = 2318, z = 8}},--------------------------south florest[covil akatsuki]-----------------ok
["Madara(Pants)"] = {uid = 9007, storageid = 9042, elopoints = 35, premio = {17631}, gradu = ALUNO, gold = 0, tp = {x = 1768, y = 2318, z = 8}},--------------------------south florest[covil akatsuki]-----------------ok
["Madara(Boots)"] = {uid = 9008, storageid = 9043, elopoints = 35, premio = {11666}, gradu = ALUNO, gold = 0, tp = {x = 1768, y = 2318, z = 8}},--------------------------south florest[covil akatsuki]-----------------ok
["Hashirama(Hat)"] = {uid = 9009, storageid = 9044, elopoints = 35, premio = {12329}, gradu = ALUNO, gold = 0, tp = {x = 1339, y = 2837, z = 10}},-----------------------suna[montanha shinobi]------------------------ok
["Hashirama(Armor)"] = {uid = 9010, storageid = 9045, elopoints = 35, premio = {8854}, gradu = ALUNO, gold = 0, tp = {x = 1339, y = 2837, z = 10}},------------------------suna[montanha shinobi]------------------------ok
["Hashirama(Pants)"] = {uid = 9011, storageid = 9046, elopoints = 35, premio = {10415}, gradu = ALUNO, gold = 0, tp = {x = 1339, y = 2837, z = 10}},-----------------------suna[montanha shinobi]------------------------ok
["Hashirama(Boots)"] = {uid = 9012, storageid = 9047, elopoints = 35, premio = {14351}, gradu = ALUNO, gold = 0, tp = {x = 1339, y = 2837, z = 10}},-----------------------suna[montanha shinobi]------------------------ok
["Jinpachi"] = {uid = 9013, storageid = 9008, elopoints = 40, premio = {10337}, gradu = ALUNO, gold = 0},------------------------suna[montanha shinobi] c/key------------------ok
["Kisame"] = {uid = 9014, storageid = 9009, elopoints = 10, premio = {12294}, gradu = ALUNO, gold = 0},----------------------------suna[hunt zetsu]------------------------------ok
["Infernal"] = {uid = 9015, storageid = 9010, elopoints = 40, premio = {7430}, gradu = ALUNO, gold = 0},-------------------suna[kage fire] c/key-------------------------ok
["Storm"] = {uid = 9016, storageid = 9011, elopoints = 30, premio = {10490}, gradu = ALUNO, gold = 0},---------------------------suna[entrada hunt puppet] c/key---------------ok
["Imortal"] = {uid = 9017, storageid = 9012, elopoints = 8, premio = {11059}, gradu = ALUNO, gold = 0},--------------------------suna[south island hidan/kakuzu]---------------ok
["Puppet"] = {uid = 9018, storageid = 9013, elopoints = 5, premio = {7381}, gradu = ALUNO, gold = 0},----------------------------suna[south island]----------------------------ok
-- ["Santuario"] = {uid = 9019, storageid = 9014, elopoints = 18, premio = {15486}, gradu = ALUNO, gold = 0},------------------------florest/kiri/ame------------------------------ok
["Demon Ice"] = {uid = 9020, storageid = 9015, elopoints = 40, premio = {15482}, gradu = ALUNO, gold = 0},------------------kiri[montanha ice worm] c/key-----------------ok
["Shinobi"] = {uid = 9021, storageid = 9016, elopoints = 10, premio = {12326,2495,17621,17615}, gradu = ALUNO, gold = 0},----------Konoha[npc sarutobi]--------------------------ok
["Specialist"] = {uid = 9022, storageid = 9017, elopoints = 18, premio = {16479}, gradu = ALUNO, gold = 0},----------------------Konoha[npc anbu especialist]------------------ok
["Renegado"] = {uid = 9023, storageid = 9018, elopoints = 10, premio = {15776}, gradu = GENIN, gold = 0},-------------------------getsugakure[casa anbu a west]-----------------ok
["Dragon"] = {uid = 9028, storageid = 9021, elopoints = 20, premio = {14341, 14342, 14343, 14344}, gradu = ALUNO, gold = 0},---------------------konoha[south florest ]------------------------ok
["Myoboku Sage"] = {uid = 9032, storageid = 9022, elopoints = 35, premio = {11073}, gradu = ALUNO, gold = 0},----------------------saga[cachoeira monte myoboku]-----------------ok
["Assassin(Glover)"] = {uid = 9033, storageid = 9023, elopoints = 25, premio = {15484}, gradu = ALUNO, gold = 0},-------------------------konoha[south florest ]------------------------ok
["Assassin(Kote)"] = {uid = 9034, storageid = 9023, elopoints = 25, premio = {16472}, gradu = ALUNO, gold = 0},-------------------------konoha[south florest ]------------------------ok
["Nidaime(Set)"] = {uid = 9035, storageid = 9024, elopoints = 40, premio = {10496, 7463, 17630, 12443}, gradu = ALUNO, gold = 0},--------------------------konoha[south florest ]------------------------ok
["Selo"] = {uid = 9039, storageid = 9025, elopoints = 35, premio = {18556}, gradu = ALUNO, gold = 0},---------------------------konoha[south florest ]------------------------ok
["Masked Men"] = {uid = 9040, storageid = 9026, elopoints = 35, premio = {11041}, gradu = ALUNO, gold = 0, tp = {x = 1768, y = 2318, z = 8}},---------------------------konoha[south florest ]------------------------ok
["Chakra Blade"] = {uid = 9045, storageid = 9028, elopoints = 40, premio = {10378}, gradu = ALUNO, gold = 0},---------------------------konoha[south florest ]------------------------ok
["Yondaime(Tunic)"] = {uid = 9048, storageid = 9048, elopoints = 35, premio = {12441}, gradu = ALUNO, gold = 0, tp = {x = 3208, y = 2299, z = 6}},---------------------------konoha[south florest ]------------------------ok
["Yondaime(Pants)"] = {uid = 9049, storageid = 9049, elopoints = 35, premio = {18321}, gradu = ALUNO, gold = 0, tp = {x = 3208, y = 2299, z = 6}},---------------------------konoha[south florest ]------------------------ok
["Yondaime(Boots)"] = {uid = 9050, storageid = 9050, elopoints = 35, premio = {15775}, gradu = ALUNO, gold = 0, tp = {x = 3208, y = 2299, z = 6}},---------------------------konoha[south florest ]------------------------ok
["Scarf Of Asuma"] = {uid = 9051, storageid = 9032, elopoints = 25, premio = {11669}, gradu = ALUNO, gold = 0},---------------------------konoha[south florest ]------------------------ok
-- ["Permission Parchament"] = {uid = 9052, storageid = 9033, elopoints = 10, premio = {17873}, gradu = ALUNO, gold = 0},---------------------------konoha[south florest ]------------------------ok
["Shield"] = {uid = 9065, storageid = 9040, elopoints = 10, premio = {12636}, gradu = ALUNO, gold = 0},---------------------------konoha[south florest ]------------------------ok
["50 Jp"] = {uid = 9066, storageid = 9053, elopoints = 10, premio = {11679, 2381}, gradu = ALUNO, gold = 50},---------------------------konoha[south florest ]------------------------ok
["Nomura"] = {uid = 9067, storageid = 9054, elopoints = 30, premio = {18328, 18330, 18327, 18329}, gradu = ALUNO, gold = 0},---------------------------konoha[south florest ]------------------------ok
-- ["Samurai"] = {uid = 9068, storageid = 9055, elopoints = 0, premio = {18328, 18330, 18327, 18329}, gradu = ALUNO, gold = 0},---------------------------konoha[south florest ]------------------------ok
["Chest {1}"] = {uid = 9069, storageid = 9056, elopoints = 5, premio = {18812}, gradu = ALUNO, gold = 10},---------------------------konoha[south florest ]------------------------ok
["Chest {2}"] = {uid = 9070, storageid = 9057, elopoints = 5, premio = {18843}, gradu = ALUNO, gold = 10},---------------------------konoha[south florest ]------------------------ok
["Chest {3}"] = {uid = 9071, storageid = 9058, elopoints = 5, premio = {18847}, gradu = ALUNO, gold = 10},---------------------------konoha[south florest ]------------------------ok
["Chest {4}"] = {uid = 9072, storageid = 9059, elopoints = 5, premio = {18834}, gradu = ALUNO, gold = 10},---------------------------konoha[south florest ]------------------------ok
["Chest {5}"] = {uid = 9073, storageid = 9060, elopoints = 5, premio = {18842}, gradu = ALUNO, gold = 10},---------------------------konoha[south florest ]------------------------ok
["Chest {6}"] = {uid = 9074, storageid = 9061, elopoints = 5, premio = {18854}, gradu = ALUNO, gold = 10},---------------------------konoha[south florest ]------------------------ok
["Chest {7}"] = {uid = 9075, storageid = 9062, elopoints = 5, premio = {18891}, gradu = ALUNO, gold = 10},---------------------------konoha[south florest ]------------------------ok
["Chest {8}"] = {uid = 9076, storageid = 9063, elopoints = 5, premio = {18885}, gradu = ALUNO, gold = 10},---------------------------konoha[south florest ]------------------------ok
["Chest {9}"] = {uid = 9077, storageid = 9064, elopoints = 5, premio = {18826}, gradu = ALUNO, gold = 10},---------------------------konoha[south florest ]------------------------ok
["Chest {10}"] = {uid = 9078, storageid = 9065, elopoints = 5, premio = {18803}, gradu = ALUNO, gold = 10},---------------------------konoha[south florest ]------------------------ok
["Chest {11}"] = {uid = 9079, storageid = 9066, elopoints = 5, premio = {18802}, gradu = ALUNO, gold = 10},---------------------------konoha[south florest ]------------------------ok
["Chest {12}"] = {uid = 9080, storageid = 9067, elopoints = 5, premio = {18801}, gradu = ALUNO, gold = 10},---------------------------konoha[south florest ]------------------------ok
["Chest {13}"] = {uid = 9081, storageid = 9068, elopoints = 5, premio = {18799}, gradu = ALUNO, gold = 10},---------------------------konoha[south florest ]------------------------ok
["Chest {14}"] = {uid = 9082, storageid = 9069, elopoints = 5, premio = {18797}, gradu = ALUNO, gold = 10},---------------------------konoha[south florest ]------------------------ok
["Mystery Box"] = {uid = 9083, storageid = 9070, elopoints = 35, premio = {16641}, gradu = ALUNO, gold = 0},---------------------------konoha[south florest ]------------------------ok
["Infernus (Parte 1)"] = {uid = 9084, storageid = 9071, elopoints = 50, premio = {10204}, gradu = ALUNO, gold = 0},---------------------------konoha[south florest ]------------------------ok
["Reino de kaguya (Parte 1)"] = {uid = 9085, storageid = 9072, elopoints = 50, premio = {10528}, gradu = ALUNO, gold = 0}---------------------------konoha[south florest ]------------------------ok

}

----------------------------------

function onUse(cid, item, frompos, item2, topos)
for i,x in pairs(quests) do
if item.uniqueid == x.uid then
if getPlayerStorageValue(cid, x.storageid) < 1 then
if getPlayerGraduationId(cid) >= x.gradu then
doSendMagicEffect(getCreaturePosition(cid), 745,cid)
doAddContainerItemRandom(cid, x.premio, x.gold)
local premioinfo = getPlayerStorageValue(cid, 942134)
doPlayerAddEloPoints(cid,x.elopoints)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, ""..i.." Congratulations!\nyou received "..x.elopoints.." elo points "..premioinfo.." in your rewards deposit.")
setPlayerStorageValue(cid, x.storageid, 1)
if x.tp then
doTeleportThing(cid, x.tp, false)
end
doPlayerSave(cid)
else
doPlayerSendCancel(cid, "it is necessary to be in graduation "..TIER_TYPES[x.gradu].desc.." or superior.")
end
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "is empty!.")
end
end
end
return true
end


