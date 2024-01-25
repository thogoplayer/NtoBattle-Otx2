jin_bijuus = {
["shukaku"] = {sto = 1, spells = {"Bijuu Furie","Bijuu Dama","Demonic Ichibi","Suna Mihui","Fuuton Renkuudan","Fuuton Sasandan"}, bijuu_outfit = 514, skill_p = 20, time_buff = 30, effBuff = 406, bijuuscroll = 11171},
["matatabi"] = {sto = 2, spells = {"Bijuu Furie","Bijuu Dama","Tsume Sakusei","Katon Hono no Batsu","Daira Ayatsuri Yatai Hibashiri","Ten en Byoka"}, bijuu_outfit = 510, skill_p = 20, time_buff = 30, effBuff = 406, bijuuscroll = 11172},
["isobu"] = {sto = 3, spells = {"Bijuu Furie","Bijuu Dama","Suiton Mizudama","Araumi Shibuki","Gensou Kiri","Sango Renshou"}, bijuu_outfit = 507, skill_p = 20, time_buff = 30, effBuff = 406, bijuuscroll = 11173},
["son goku"] = {sto = 4, spells = {"Bijuu Furie","Bijuu Dama","Youton Shakukaryuuhougan","Kakazan","Youton Shakuka Taihou","Shakuka Daifunka"}, bijuu_outfit = 508, skill_p = 20, time_buff = 30, effBuff = 406, bijuuscroll = 11175},
["kokuou"] = {sto = 5, spells = {"Bijuu Furie","Bijuu Dama","Yuugeton Jimem no Kanetsu","Gozan Tobi","Gobi no Nami","Tsunoori"}, bijuu_outfit = 509, skill_p = 20, time_buff = 30, effBuff = 406, bijuuscroll = 11176},
["saiken"] = {sto = 6, spells = {"Bijuu Furie","Bijuu Dama","Sansan","Dai Doku Chiri","San Toppuu","Firudorimujinsutikki"}, bijuu_outfit = 505, skill_p = 20, time_buff = 30, effBuff = 406, bijuuscroll = 11174},
["choumei"] = {sto = 7, spells = {"Bijuu Furie","Bijuu Dama","Hanetsumuji","Hanegiri","Mushikui","Rinpun Bakusai"}, bijuu_outfit = 506, skill_p = 20, time_buff = 30, effBuff = 406, bijuuscroll = 11177},
["gyuki"] = {sto = 8, spells = {"Bijuu Furie","Bijuu Dama","Sumi Sakusei","Lightning Hack","Bijuu Hachimaki","Dai Sumi Sakusei"}, bijuu_outfit = 513, skill_p = 20, time_buff = 30, effBuff = 406, bijuuscroll = 11178},
["kurama"] = {sto = 9, spells = {"Bijuu Furie","Bijuu Dama","Kyuubi no Chakra Ne","Kyuubi Chakra no Senpuu"}, bijuu_outfit = 511, skill_p = 20, time_buff = 30, effBuff = 406, bijuuscroll = 11179},
["juubi"] = {sto = 10, spells = {"Bijuu Furie","Bijuu Dama"}, bijuu_outfit = 512, skill_p = 20, time_buff = 30, effBuff = 406, bijuuscroll = 11180}
}

id_name = {
-- id da storage refrente ao monstro na primeira tabela, lembrando que se for adicionar mais, a variável sto tem que dar um valor de storage referente ao novo monstro adicionado
[1] = "shukaku",
[2] = "matatabi",
[3] = "isobu",
[4] = "son goku",
[5] = "kokuou",
[6] = "saiken",
[7] = "choumei",
[8] = "gyuki",
[9] = "kurama",
[10] = "Juubi"
}



jin_Storage = 1234255 -- Storage que armazena o Jinchuuriki
jin_StorageTime = 1234256 -- Storage de quanto tempo o player tem de Jinchuuriki 
jin_TimeDay = 7 -- Tempo em dias que o player ficará com a Bijuu selada nele
jin_percentHp = 20 -- Porcentagem que precisa para selar o Bijuu
jin_cond_id = 23 -- Sub-Id da condição do buff, assim não da conflito com outros buffs.
jin_cond_id = 24 -- Sub-Id da condição do outfit, assim não da conflito com outros buffs.

jin = {
-- jin.getPlayerBijuu(uid)
getPlayerBijuu = function(uid) -- retorna o nome da biju do player em string.
if getPlayerStorageValue(uid, jin_Storage) == -1 then
  return 0
 end
return id_name[getPlayerStorageValue(uid, jin_Storage)]
end,

-- jin.setPlayerBijuu(uid, BijuuId)
setPlayerBijuu = function(uid, BijuuId) -- Set no player a Bijuu tornando-o um Jinchuuriki.
return doCreatureSetStorage(uid, jin_Storage, BijuuId)
end,

-- jin.setBijuuTime(uid, days)
setBijuuTime = function(uid, days) -- Seta a quantidade de dias que o player ficará com a bijuu.
return doCreatureSetStorage(uid, jin_StorageTime, os.time()+days*24*60*60)
end,

-- jin.getPlayerBijuuTime(uid)
getPlayerBijuuTime = function(uid) -- Retorna tempo e hora que falta pra acabar o Jinchuuriki do Player.
if getPlayerStorageValue(uid, jin_StorageTime)-os.time() <= 0 then
return "Tempo restante é de 0 dias, 0 horas e 0 segundos."
end
local tempo = getPlayerStorageValue(uid, jin_StorageTime)-os.time()
local segundos =  tempo % 60
local minutos =  math.floor(tempo%3600/60)
local horas = math.floor(tempo%86400/3600)
local dias = math.floor(tempo%2592000/86400)
local dyas = math.floor(tempo%604800/86400)
if getPlayerStorageValue(uid, 34245) >= 1 then
return "Tempo restante é de "..dias.." dia"..(dias > 1 and "s" or "")..", "..horas.." hora"..(horas > 1 and "s" or "")..", "..minutos.." minuto"..(minutos > 1 and "s"or "").." e "..segundos.." segundo"..(segundos > 1 and "s" or "")..""
else
return "Tempo restante é de "..dyas.." dia"..(dyas > 1 and "s" or "")..", "..horas.." hora"..(horas > 1 and "s" or "")..", "..minutos.." minuto"..(minutos > 1 and "s"or "").." e "..segundos.." segundo"..(segundos > 1 and "s" or "")..""
end
end,



-- jin.doPlayerSetSpells(uid, spells)
doPlayerSetSpells = function(uid, spells) -- Faz o player aprender mais de 1 spells.
if type(spells) == "table" then
for i = 1, #spells do
doPlayerLearnInstantSpell(uid, spells[i])
end
else
doPlayerLearnInstantSpell(uid, spells)
end
end,


-- jin.doPlayerRemoveSpells(uid, spells)
doPlayerRemoveSpells = function(uid, spells) -- Remove todas as spells aprendidas do player.
if type(spells) == "table" then
for i = 1, #spells do
doPlayerUnlearnInstantSpell(uid, spells[i])
end
else
doPlayerUnlearnInstantSpell(uid, spells)
end
end,


-- jin.doPlayerRemoveJinchuuriki(uid)
doPlayerRemoveJinchuuriki = function(uid) -- Remove o Jinchuuriki do player.
if jin.getPlayerBijuu(uid) ~= 0 then
jin.doPlayerRemoveSpells(uid, jin_bijuus[jin.getPlayerBijuu(uid):lower()].spells)
doCreatureSetStorage(uid, jin_StorageTime, -1)
doCreatureSetStorage(uid, jin_Storage, -1)
end
end
}