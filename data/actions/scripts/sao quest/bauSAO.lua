--[[
Script - Lordzetros
Tibiaking - Lordzetros
]]

local mti = {
	[1] = {nome = 'renegade', pos = {x = 2265, y = 2345, z = 7}}, -- [numero] = {nome = 'Nome Monstro', pos = 'POSICAO QUE IRÁ RESPAWNAR O MONSTRO'}
	[2] = {nome = 'nukenin', pos = {x = 2266, y = 2351, z = 7}},
	[3] = {nome = 'nukenin', pos = {x = 2263, y = 2352, z = 7}},
	[4] = {nome = 'nukenin', pos = {x = 2261, y = 2344, z = 7}},
	[5] = {nome = 'nukenin', pos = {x = 2260, y = 2351, z = 7}},
	[6] = {nome = 'nukenin', pos = {x = 2257, y = 2354, z = 7}},
	[7] = {nome = 'nukenin', pos = {x = 2253, y = 2350, z = 7}},
	[8] = {nome = 'nukenin', pos = {x = 2257, y = 2344, z = 7}},
	[9] = {nome = 'takafumi', pos = {x = 2247, y = 2347, z = 7}},
}

local config = {
unique = 17458, -- uniqueID que vai colocar no BAÚ no seu EDITOR DE MAPA!
parede = {id = 1515, pos = {x = 2232, y = 2350, z = 7, stackpos = 1}}, -- ID da parede |||| POSIÇÃO que ela irá ser criada
strPassagem = {storage = 22318, tempo = 1}, -- Storage que vai controlar o tempo de intervalo para a quest ||||| tempo em MINUTOS de intervalo para os players fazer a quest novamente
}

function adicionar_parede(conf)
	local parede = getThingFromPos(conf.parede.pos).itemid ~= conf.parede.id
	if (parede) then return doCreateItem(conf.parede.id, 1, conf.parede.pos) and doSendMagicEffect(conf.parede.pos, 11) end
	return true
end

function onUse(cid, item, fromPos, item2, toPos)
	if (item.uid == config.unique) then
		if (getGlobalStorageValue(config.strPassagem.storage) >= os.time()) then return doCreatureSay(cid, 'Precisa esperar ' .. config.strPassagem.tempo .. ' minuto[s] para fazer a quest!', TALKTYPE_ORANGE_1) end
		doCreatureSay(cid, "Argh!! Sala com armadilha.", TALKTYPE_ORANGE_1)
		adicionar_parede(config)
		for _, cf in pairs(mti) do
			doCreateMonster(cf.nome, cf.pos)
		end
		setGlobalStorageValue(config.strPassagem.storage, os.time() + config.strPassagem.tempo * 60)
	end
	return true
end
