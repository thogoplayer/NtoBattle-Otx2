GGNCONF = {
     TP = {from = {x = 2412, y = 3156, z = 7} , to = {x = 2885, y = 2064, z = 7}}, -- Depois de quanto tempo que avisou vai ser criado o tp? Em minutos
     posParedes = {{x = 1028, y = 901, z = 9, stackpos=1}}, -- Posições das paredes que ficam atrás do guarda
	 idDasParedes = 9300,
	 days = {1,3,5}, -- Dias que o evento vai abrir
	 timeToGain = 10
}

GGN_PUSHTIME = 10800 -- Tempo (em segundos) de exhausted para usar o comando !gocastle - Padrão (3 horas)

-- // Não mexa daqui para baixo 
GGN_MODE = 201320111713
GGN_STATUS = 201320111714
GGN_PREPARE1 = 201320111715 
GGN_PUSHSTOR = 201320111716 
GGN_PREPARE2 = 201320111717 
GGN_PREPARE3 = 201320111718 
GGN_PREPARE4 = 201320111719 
GGN_DOMAIN = 201320111720

GGN_TIME_EVENT_ID_5 = 0
GGN_TIME_EVENT_ID_9 = 0
GGN_TIME_EVENT_ID_END = 0



function doCastleRemoveEnemies(all)
 for index, creature in ipairs(getPlayersOnline()) do
  if getCreatureIn(creature, AREA_GGN)then
   if all or (getPlayerGuildName(creature) ~= getGlobalStorageValue(GGN_STATUS)) then
    doTeleportThing(creature, getTownTemplePosition(getPlayerTown(creature)))
   end
  end
 end
 return true
end

function GGN_WARN_TIME(guildName, tempo)
if getGlobalStorageValue(GGN_MODE) == 1 then
doBroadcastMessage(string.format("[Guild Castle War] A guild %s já está no dominio do castelo a %d minuto(s)!", guildName, tempo))
end
end


local typeGain = {
[1] = "[Guild Castle War] Evento Fechado! Parabéns à Guild %s que estava no dominio no ultimo momento e foi vencedora da rodada.",
[2] = "[Guild Castle War] Evento Fechado! Parabéns à Guild %s que ficou 10 minutos sob dominio e vencedora da rodada.",
}

function GGN_CLOSE(type)
if getGlobalStorageValue(GGN_MODE) == 1 then
setGlobalStorageValue(GGN_MODE, -1)
doBroadcastMessage(string.format(typeGain[type], getGlobalStorageValue(GGN_STATUS)))
doCastleRemoveEnemies(true)
local t = getTileItemById(GGNCONF.TP.from, 1387).uid
     if t > 0 then
          doRemoveItem(t, 1)
          doSendMagicEffect(GGNCONF.TP.from, CONST_ME_POFF)
     end
end
end


function GGN_WARN(num)
if getGlobalStorageValue(GGN_MODE) == 1 then
local guild = (getGlobalStorageValue(GGN_STATUS) == -1 and "No momento não há Guild Dominando!" or "Guild Domimante : "..getGlobalStorageValue(GGN_STATUS).."")
doBroadcastMessage(string.format("[Guild Castle War] O evento irá fechar em %d minuto(s)!\n%s", num, guild))
end
end


function GGN_OPEN()
setGlobalStorageValue(GGN_MODE, 1)
setGlobalStorageValue(GGN_DOMAIN, 0)
doSendAnimatedText(GGNCONF.TP.from, "GUILD", math.random(1, 255))
addEvent(doSendAnimatedText, 500, GGNCONF.TP.from, "CASTTLE", math.random(1, 255))
addEvent(doSendAnimatedText, 1000, GGNCONF.TP.from, "WAR", math.random(1, 255))
doBroadcastMessage("[Guild Castle War] O teleport para o castle foi aberto e irá fechar em 10-60 minutos!")
addEvent(GGN_WARN, 30 * TIME_MINUTES, 30)
addEvent(GGN_WARN, 50 * TIME_MINUTES, 10)
addEvent(GGN_WARN, 55 * TIME_MINUTES, 55)
addEvent(GGN_WARN, 59 * TIME_MINUTES, 1)
addEvent(GGN_CLOSE, 1 * TIME_HOURS, 1)
doCreateTeleport(1387, GGNCONF.TP.to, GGNCONF.TP.from)
end