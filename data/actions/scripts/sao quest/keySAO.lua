--[[
Script - Lordzetros
Tibiaking - Lordzetros
]]

local config = {
parede = {id = 10483, pos = {x= 2045, y=2038, z= 7, stackpos = 1}}, -- ID da parede |||| POSIÇÃO que ela irá ser criada
strPassagem = {storage = 22338, tempo = 1}, -- Storage que vai controlar o tempo de intervalo para a quest ||||| tempo em MINUTOS de intervalo para os players fazer a quest novamente
tempoFechar = 1, -- MINUTOS para a passagem fechar, caso não entrem APÓS abrirem a passagem
}

function remover_parede(conf)
	local parede = getTileItemById(conf.parede.pos, conf.parede.id)
	if (parede) then
		doRemoveItem(parede.uid, 1)
		doSendMagicEffect(conf.parede.pos, 10)
	end
	return true
end

function adicionar_parede(conf)
	local parede = getThingFromPos(conf.parede.pos).itemid ~= conf.parede.id
	if (parede) then return doCreateItem(conf.parede.id, 1, conf.parede.pos) and doSendMagicEffect(conf.parede.pos, 11) end
	return true
end

function onUse(cid, item, fromPos, item2, toPos)
	if (item2.itemid == config.parede.id) then
		if (getGlobalStorageValue(config.strPassagem.storage) >= os.time()) then return doCreatureSay(cid, 'Precisa esperar ' .. config.strPassagem.tempo .. ' minuto[s] para fazer a quest!', TALKTYPE_ORANGE_1) end
		doRemoveItem(item2.uid, 1)
		doSendMagicEffect(config.parede.pos, 10)
		doCreatureSay(cid, "A passagem foi aberta por "..getPlayerName(cid).."! Peguem a recompensa no bau, depressa!", TALKTYPE_ORANGE_1)
		doPlayerSendCancel(cid, "A passagem ira fechar em " ..config.tempoFechar.. " minuto[s]!")
		addEvent(function()
			adicionar_parede(config)
		end, config.tempoFechar * 60 * 1000)
		doRemoveItem(item.uid, 1)
	end
	return true
end