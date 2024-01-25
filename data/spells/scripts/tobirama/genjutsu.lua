local config = {
    storage = 4001, -- storage que ira armazenar o cooldown
	tempo = 60, -- cooldown em segundos
    areas = {
    --  [0] = {fromPos={PosicaoNorthEsquerda}, toPos={PosicaoSulDireita}, playerPos={PosicaoDoPlayer},targetPos={PosicaoDoTarget}},
        [1] = {fromPos={x = 1773, y = 358, z = 7}, toPos={x = 1775, y = 360, z = 7},playerPos={x = 1774, y = 359, z = 7},targetPos={x = 1774, y = 359, z = 7}},
        [2] = {fromPos={x = 1795, y = 358, z = 7}, toPos={x = 1797, y = 360, z = 7},playerPos={x = 1796, y = 359, z = 7},targetPos={x = 1796, y = 359, z = 7}},
		[3] = {fromPos={x = 1817, y = 358, z = 7}, toPos={x = 1819, y = 360, z = 7},playerPos={x = 1818, y = 359, z = 7},targetPos={x = 1818, y = 359, z = 7}},
		[4] = {fromPos={x = 1839, y = 358, z = 7}, toPos={x = 1841, y = 360, z = 7},playerPos={x = 1840, y = 359, z = 7},targetPos={x = 1840, y = 359, z = 7}},
    },
	blockAreas = {
        [1] = {{x=1773, y=358, z=7},{x=1841, y=360, z=7}}, -- from, to
		[2] = {{x=1746, y=568, z=6},{x=1942, y=573, z=6}}, -- from, to
		[3] = {{x=1703, y=373, z=7},{x=1707, y=376, z=7}}, -- from, to
		[4] = {{x=1964, y=1049, z=7},{x=2374, y=1075, z=7}}, -- from, to
		[5] = {{x=2004, y=372, z=7},{x=2320, y=455, z=7}}, -- from, to
		[6] = {{x=511, y=1138, z=7},{x=521, y=1151, z=7}}, -- from, to
	},
    effect = 871, -- efeito a ser rodado
    duration_spell = 8, -- duração da spell
	looktype = 22, -- roupa que ativará ao usar a spell
	nome_do_jutsu = "suiton goshokuzame saisen" -- nome do jutsu para aparecer na mensagem
}

local function checkAreas(fromPos, toPos)
    for x = fromPos.x, toPos.x do
        for y = fromPos.y, toPos.y do
            for z = fromPos.z, toPos.z do
                local pos = {x = x, y = y, z = z, stackpos = 253}
                local thing = getThingfromPos(pos).uid
                if isPlayer(thing) then
                    return true
                end
            end
        end
    end
end

local ninjutsu = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(ninjutsu, CONDITION_PARAM_SUBID, 177)
setConditionParam(ninjutsu, CONDITION_PARAM_TICKS, config.duration_spell*1000)
setConditionParam(ninjutsu, CONDITION_PARAM_STAT_MAGICLEVEL, 30)

function onCastSpell(cid, var)
	if isPlayerGhost(cid) then
	doPlayerSendCancel(cid, "Can't use yet.")
	return false
	end
	if getPlayerStorageValue(cid, config.storage)-os.time() > 0 then
	doPlayerSendCancel(cid, "Aguarde "..getPlayerStorageValue(cid, config.storage)-os.time().." segundos para usar esse jutsu novamente.")
	return false
	end
	local target = getCreatureTarget(cid)
	local targetpos = getCreaturePosition(target)
	local playerPos = getCreaturePosition(cid)
    local check = true
    for _, area in pairs(config.blockAreas) do
        if isInRange(playerPos, area[1], area[2]) then
            check = false break
        end
    end
    if not check then
        doPlayerSendCancel(cid, "Você não pode usar este jutsu aqui!")
        return false
    end

    if isMonster(target) then 
        doPlayerSendCancel(cid, "Você não pode usar este jutsu em monstros.")
        return false
    end
	
	if isTeleported then
		doPlayerSendCancel(cid, "Não há áreas disponíveis!")
		return false
    end

	doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
	
	local function Teleport_Player(cid)
	doCreatureSetNoMove(cid, false)
	doTeleportThing(cid, playerPos)
	local isTeleported = false
	end
	
	local function Teleport_Target(target)
	doCreatureSetNoMove(target, false)
	doTeleportThing(target, targetpos)
	local isTeleported = false
	end

	local isTeleported = false
		for _, area in pairs(config.areas) do
			if not checkAreas(area.fromPos, area.toPos) then
			doCreatureSetNoMove(target, false)
			doCreatureSetNoMove(cid, false)
			doTeleportThing(target, area.targetPos)
			doTeleportThing(cid, area.playerPos)
			isTeleported = true
			end
		end
	doPlayerSendTextMessage(cid, 27, "Você está em um genjutsu por 8 segundos pelo jutsu "..config.nome_do_jutsu..".")
	invi(cid)
	doAddCondition(cid, ninjutsu)
	addEvent(doSendMagicEffect, 0, {x = getCreaturePosition(target).x+2, y = getCreaturePosition(target).y+2, z = getCreaturePosition(target).z}, config.effect)
	doCreatureSetNoMove(target, true)
	for i = 1, 9 do 
	addEvent(function()
	if isCreature(target) then
	addEvent(doSendMagicEffect, 0, {x = getCreaturePosition(target).x+2, y = getCreaturePosition(target).y+2, z = getCreaturePosition(target).z}, config.effect)
    end
	end, i * 800)
	end
	if isPlayer(cid) and isCreature(cid) then
	addEvent(Teleport_Player, config.duration_spell*1000, cid)
	end
	if isPlayer(target) and isCreature(target) then
	addEvent(Teleport_Target, config.duration_spell*1000, target)
	end
	local player = getPlayerGUID(cid)
	addEvent(removeGhost, config.duration_spell*1000, player)
	setPlayerStorageValue(cid, config.storage, config.tempo+os.time())
	return true
end