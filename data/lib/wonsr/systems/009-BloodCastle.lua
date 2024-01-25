-- == Blood Castle Event por Killua == --

bloodconfig = {
     templo = {x= 2404, y=3155, z= 7}, -- templo
     posGuarda = {x = 960, y = 1104, z = 7}, -- Onde o guarda do portão vai nascer
     premios = {{2160, 50}}, -- Premios que o vencedor vai ganhar {id, quantidade}
     positionTP = {x = 2412, y = 3161, z = 7}, -- Onde o tp será criado
     positionEvento = {x = 961, y = 1330, z = 7}, -- Para onde o tp vai levar
     tempoTP = 1, -- Depois de quanto tempo que avisou vai ser criado o tp? Em minutos
     tempoAberto = 5, -- Tempo que o tp fica aberto. Em minutos
     minPlayers = 2, -- Número mínimo de players que devem entrar para que o evento aconteça
     tempoMaximo = 30, -- Tempo máximo, em minutos, que alguem pode permanecer no evento
     playersStorage = 54910, -- Não mude
     posPedras = {{x = 958, y = 1317, z = 7, stackpos=1}, {x = 959, y = 1317, z = 7, stackpos=1}, {x = 960, y = 1317, z = 7, stackpos=1}, {x = 961, y = 1317, z = 7, stackpos=1}, {x = 962, y = 1317, z = 7, stackpos=1}, {x = 963, y = 1317, z = 7, stackpos=1}}, -- Posições das pedras que bloqueiam a entrada do evento
     idDasParedes = 12902, -- ID das parede s que vao ser removidas quando o Guarda morrer (todas devem ter o mesmo id)
     estatua = {x = 960, y = 1082, z = 7}, -- Posicao onde o arcanjo vai ser criado
     tempoSaida = 960, -- Quando tempo o tp q é criado quando a estátua morre vai ficar? Em segundos
     posParedes = {{x = 959, y = 1103, z = 7, stackpos=1}, {x = 960, y = 1103, z = 7, stackpos=1}, {x = 961, y = 1103, z = 7, stackpos=1}}, -- Posições das paredes que ficam atrás do guarda
     fromPos = {x = 940, y = 1073, z = 7}, -- Canto superior esquerdo da área do seu evento ---- Deve ser uma área quadrada ou retangular, de forma que todo o evento fique dentro dela.
     toPos = {x = 998, y = 1346, z = 7}, -- Canto inferior direito da área do seu evento
}

-- [[ NAO ALTERE MAIS NADA DAQUI PARA BAIXO! ]] --

function removeTpb()
     local t = getTileItemById(bloodconfig.positionTP, 1387)
     if t then
          doRemoveItem(t.uid, 1)
          doSendMagicEffect(bloodconfig.positionTP, CONST_ME_POFF)
     end
end

function removeStones()
     for i = 1, #bloodconfig.posPedras do
          local pedra = getTileItemById(bloodconfig.posPedras[i], 12757)
          if pedra then
               doRemoveItem(pedra.uid, 1)
          end
     end
end

function putStones()
     for i = 1, #bloodconfig.posPedras do
	 local pedru = bloodconfig.posPedras[i]
          local pedra = getTileItemById(bloodconfig.posPedras[i], 12757)
          if not pedra then
               doCreateItem(12757, 1, pedru)
          end
     end
end


function createTeleportb()
     local tip = doCreateTeleport(1387, bloodconfig.positionEvento, bloodconfig.positionTP)
     doItemSetAttribute(tip, "aid", 4726)
end

function removeTpa()
     local t = getTileItemById(bloodconfig.estatua, 1387)
     if t then
          doRemoveItem(t.uid, 1)
          doSendMagicEffect(bloodconfig.estatua, CONST_ME_POFF)
     end
end


function getPlayersInBlood()
     local playersInBlood = getGlobalStorageValue(bloodconfig.playersStorage)
     return playersInBlood < 0 and 0 or playersInBlood
end

function removePlayers()
     for _, pid in pairs(getPlayersOnline()) do
          if isInArea(getThingPos(pid), bloodconfig.fromPos, bloodconfig.toPos) then
               doTeleportThing(pid, bloodconfig.templo, false)
               doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce foi removido do Blood Castle. Possiveis causas: o evento nao atingiu o numero minimo de players; Voce permaneceu no evento por mais de " .. bloodconfig.tempoMaximo .. " minutos.")
          end
     end
end

function checkBlood()
     if getPlayersInBlood() >= bloodconfig.minPlayers then
          removeStones()
          doBroadcastMessage("[Blood Castle] O Evento comecou e o teleporte para ele foi fechado. Boa sorte a todos!")
          if not isMonster(getTopCreature(bloodconfig.posGuarda).uid) then
               doCreateMonster("Guarda do Portao", bloodconfig.posGuarda)
          end
          addEvent(removePlayers, bloodconfig.tempoMaximo*TIME_MINUTES)
     else
          removePlayers()
          setGlobalStorageValue(bloodconfig.playersStorage, 0)
          doBroadcastMessage("[Blood Castle] O evento nao atingiu o numero minimo de participantes e foi cancelado.")
          if isMonster(getTopCreature(bloodconfig.posGuarda).uid) then
               doRemoveCreature(getTopCreature(bloodconfig.posGuarda).uid)
          end
          if isMonster(getTopCreature(bloodconfig.estatua).uid) then
               doRemoveCreature(getTopCreature(bloodconfig.estatua).uid)
          end
     end
end

function putWalls()
     for i = 1, #bloodconfig.posParedes do
          doCreateItem(bloodconfig.idDasParedes, 1, bloodconfig.posParedes[i])
     end
end

function removeWalls()
     for i = 1, #bloodconfig.posParedes do
          local wall = getTileItemById(bloodconfig.posParedes[i], bloodconfig.idDasParedes)
          if wall then
               doRemoveItem(wall.uid, 1)
          end
     end
end

function createAngel()
     if not isMonster(getTopCreature(bloodconfig.estatua).uid) then
          doCreateMonster("Arcanjo", bloodconfig.estatua)
          doBroadcastMessage("[Blood Castle] O Arcanjo apareceu!")
     end
end

function Guarantee()
     if isMonster(getTopCreature(bloodconfig.posGuarda).uid) then
          putWalls()
          doRemoveCreature(getTopCreature(bloodconfig.posGuarda).uid)
     elseif isMonster(getTopCreature(bloodconfig.estatua).uid) then
          putStones()
          putWalls()
          doRemoveCreature(getTopCreature(bloodconfig.estatua).uid)
      end
end