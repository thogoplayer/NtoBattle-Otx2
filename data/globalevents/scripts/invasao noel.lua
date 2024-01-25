local days = {
-- Segunda
["Monday"] = {
["18:59"] = {nome = "Noel Event", pos = {fromPosition = {x = 1913, y = 2029, z = 7},toPosition = {x = 2192, y = 2276, z = 7}}, m = {"250 Noel Event"}, Time = 5}
},
-- Terça
["Tuesday"] = {
["18:59"] = {nome = "Noel Event", pos = {fromPosition = {x = 1913, y = 2029, z = 7},toPosition = {x = 2192, y = 2276, z = 7}}, m = {"250 Noel Event"}, Time = 5}
},
-- Quarta
["Wednesday"] = {
["18:59"] = {nome = "Noel Event", pos = {fromPosition = {x = 1913, y = 2029, z = 7},toPosition = {x = 2192, y = 2276, z = 7}}, m = {"250 Noel Event"}, Time = 5}
},
-- Quinta
["Tursday"] = {
["18:59"] = {nome = "Noel Event", pos = {fromPosition = {x = 1913, y = 2029, z = 7},toPosition = {x = 2192, y = 2276, z = 7}}, m = {"250 Noel Event"}, Time = 5}
},
-- Sexta
["Friday"] = {
["18:59"] = {nome = "Noel Event", pos = {fromPosition = {x = 1913, y = 2029, z = 7},toPosition = {x = 2192, y = 2276, z = 7}}, m = {"250 Noel Event"}, Time = 5}
},
-- Sábado
["Saturday"] = {
["18:59"] = {nome = "Noel Event", pos = {fromPosition = {x = 1913, y = 2029, z = 7},toPosition = {x = 2192, y = 2276, z = 7}}, m = {"250 Noel Event"}, Time = 5}
},
-- Domingo
["Sunday"] = {
["18:59"] = {nome = "Noel Event", pos = {fromPosition = {x = 1913, y = 2029, z = 7},toPosition = {x = 2192, y = 2276, z = 7}}, m = {"250 Noel Event"}, Time = 5}
},
}

local function removeCreatureEvent(tb)
    for x = ((tb.pos.fromPosition.x)-20), ((tb.pos.toPosition.x)+20) do
        for y = ((tb.pos.fromPosition.y)-20), ((tb.pos.toPosition.y)+20) do
            local m = getTopCreature({x=x, y=y, z= tb.pos.fromPosition.z}).uid
            if m ~= 0 and isMonster(m) and getCreatureName(m) == tb.nome then
                doSendMagicEffect(getCreaturePosition(m), 54) -- Efeito no monstro quando for removido
                doSendMagicEffect(getCreaturePosition(m), 3) -- Efeito no monstro quando for removido
                doRemoveCreature(m)
            end
        end
    end
end

local function startEvent(tb)
doBroadcastMessage("invasion " .. tb.nome .. " started, 250 Noel Spawned, in 5 minutes everyone will disappear")
    for _ , x in pairs(tb.m) do
        local c = tonumber(x:match("%d+"))
        if c > 0 then
            repeat
            local pos = {x = math.random(tb.pos.fromPosition.x, tb.pos.toPosition.x), y = math.random(tb.pos.fromPosition.y, tb.pos.toPosition.y), z = tb.pos.fromPosition.z}
                if isWalkable(pos) then
                    local create = doCreateMonster(x:match("%s(.+)"), pos)
                    if create then
                    doSendMagicEffect({x=pos.x+1, y=pos.y, z=pos.z}, 1077) -- Efeito no monstro quando ele nascer
                    doSendMagicEffect(pos, 1043) -- Efeito no monstro quando ele nascer
                    c = c-1 
                    end
                    end
            until (c == 0)
        end
    end
    addEvent(removeCreatureEvent, tb.Time*60*1000, tb)
    addEvent(doBroadcastMessage, tb.Time*60*1000, "A invasão de " .. tb.nome .. " acabou, os que sobrevireram foram embora.") -- Mensagem que vai aparecer para todos do servidor quando a invasão iniciar
end
			
function onThink(interval, lastExecution)
	if days[os.date("%A")] then
		hours = tostring(os.date("%X")):sub(1, 5)
		tb = days[os.date("%A")][hours]
		if tb then
		startEvent(tb)
		end
	end
	return true
end