--[[
Script - Lordzetros
Tibiaking - Lordzetros
]]

local config = {
SupEsquerdo = {x = 2233, y = 2338, z = 7}, -- posicao do canto SUPERIOR ESQUERDO da área que ficará a quest
InfDireito = {x = 2274, y = 2362, z = 7}, -- posicao do canto INFERIOR DIREITO da área que ficará a quest
chefe = "Takafumi", -- Nome do BOSS, responsável por abrir passagem e liberar a recompensa no baú
parede = {id = 1515, pos = {x = 2232, y = 2350, z = 7, stackpos = 2}}, -- id da parede   |||||   posicao dela
posPremio = {x = 2226, y = 2346, z = 8}, -- posicao para area de recompensa quando os players matarem o boss
msgSucesso = "Parabéns por passarem do desafio! Agora permitirei pegar algumas recompensas como reconhecimento de um otimo guerreiros que es!" -- Mensagem quando os players conseguirem matar o boss da sala
}

function getAllPlayersInArea(fromPosition, toPosition)
		local players = {}
		for _, pid in ipairs(getPlayersOnline()) do
			local f = {x = fromPosition.x, y = fromPosition.y, z = fromPosition.z}
			local t = {x = toPosition.x, y = toPosition.y, z = toPosition.z}
			local min = (fromPosition.z > toPosition.z and toPosition.z or fromPosition.z)
			for index = 0, math.abs(toPosition.z - fromPosition.z) do
				f.z = min + index
				t.z = min + index
				if (isInRange(getPlayerPosition(pid), f, t)) then
					table.insert(players, pid)
				end
			end    
		end
		return players
	end 

function remover_parede(conf)
	local parede = getTileItemById(conf.parede.pos, conf.parede.id).uid
	if parede > 0 then
		doRemoveItem(parede)
		doSendMagicEffect(conf.parede.pos, 10)
	end
	return true
end

function adicionar_parede(conf)
	local parede = getThingFromPos(conf.parede.pos).itemid ~= conf.parede.id
	if (parede) then return doCreateItem(conf.parede.id, 1, conf.parede.pos) and doSendMagicEffect(conf.parede.pos, 11) end
	return true
end

function onDeath(cid)
	local boss = getCreatureName(cid) == config.chefe
	if boss then

		doCreatureSay(cid, config.msgSucesso, TALKTYPE_ORANGE_1)
		doSendMagicEffect(getCreaturePosition(cid), 49)
		addEvent(function()
			local players = getAllPlayersInArea(config.SupEsquerdo, config.InfDireito)
				remover_parede(config)
			for _, jogador in ipairs(players) do
				doTeleportThing(jogador, config.posPremio)
				doSendMagicEffect(getPlayerPosition(jogador), 11)
			end
		end, 7000)
	end
	return true
end