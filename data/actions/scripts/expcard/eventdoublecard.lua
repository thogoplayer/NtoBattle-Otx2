function onUse(cid, item, frompos, item2, topos)

    local function potion(pos, cid)
        doPlayerSetExperienceRate(pos, expfinal)
        doPlayerSendTextMessage(pos,22, 'Seu Event Double Card Exp Acabou !!!')
    end
    
    local function converter_tempo(tempo_segundos)
        local horas = math.floor(tempo_segundos / (60 * 60))
        local minutos = math.floor((tempo_segundos % (60 * 60)) / 60)
        local segundos = tempo_segundos % 60
        
        return {horas = horas, minutos = minutos, segundos = segundos}
    end

    local exp = 1.2 --
    expfinal = 1 --No mude, isso .

    local storage_cooldown = 33442
    local cooldown = 60 -- em minutos
    local getTime = getPlayerStorageValue(cid, storage_cooldown) - os.time()
    local time = converter_tempo(getTime)
    local timestamp_cooldown = os.time() + cooldown * 60
	local tempo = 3600000

    if getPlayerStorageValue(cid, storage_cooldown) < os.time() then
        if item.itemid == 10548 then -- aqui esta o iD do item que você quer colocar pra usar
            setPlayerStorageValue(cid, storage_cooldown, timestamp_cooldown)
            doRemoveItem(item.uid, 1)
            doPlayerSetExperienceRate(cid, exp)
            doSendMagicEffect(frompos, 13)
            doPlayerSendTextMessage(cid, 22, 'Vocꠕtilizou o Event Double Card Exp, estᠣom + 20% de Exp.')
            addEvent(potion, tempo, cid) -- 
        end
    else
        doPlayerSendTextMessage(cid, 22, "Você não pode usar o card antes de "..time.horas.." horas "..time.minutos.. " minutos "..time.segundos.." segundos!")
    end
end