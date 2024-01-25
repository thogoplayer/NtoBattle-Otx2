local days = {
-- Segunda
-- ["Monday"] = {
-- ["15:30"] = {nome = "Bunny", pos = {fromPosition = {x = 1916, y = 2054, z = 7},toPosition = {x = 2168, y = 2263, z = 7}}, m = {"50 Bunny", "25 D-Bunny"}, Time = 30}
-- },
-- Terça
["Tuesday"] = {
["09:00"] = {nome = "Bunny", pos = {fromPosition = {x = 1989, y = 2094, z = 7},toPosition = {x = 2153, y = 2177, z = 7}}, m = {"75 Bunny", "35 D-Bunny"}, Time = 30},
["18:00"] = {nome = "Bunny", pos = {fromPosition = {x = 1989, y = 2094, z = 7},toPosition = {x = 2153, y = 2177, z = 7}}, m = {"75 Bunny", "35 D-Bunny"}, Time = 30}
},
-- Quarta
-- ["Wednesday"] = {
-- ["20:00"] = {nome = "Hebi", pos = {fromPosition = {x = 2009, y = 2023, z = 7}, toPosition = {x = 2182, y = 2147, z = 7}}, m = {"15 Purple Kyodaijya", "20 Senjuu Kyodaijya", "15 water snake", "25 hebi", "15 hebi shiro", "25 Kyodaijya"}, Time = 25}
-- },
-- Quinta
["Tursday"] = {
["11:33"] = {nome = "Bunny", pos = {fromPosition = {x = 1989, y = 2094, z = 7},toPosition = {x = 2153, y = 2177, z = 7}}, m = {"75 Bunny", "35 D-Bunny"}, Time = 30},
["11:38"] = {nome = "Bunny", pos = {fromPosition = {x = 1989, y = 2094, z = 7},toPosition = {x = 2153, y = 2177, z = 7}}, m = {"75 Bunny", "35 D-Bunny"}, Time = 30}
},
-- Sexta
-- ["Friday"] = {
-- ["14:00"] = {nome = "Bunny", pos = {fromPosition = {x = 1916, y = 2054, z = 7},toPosition = {x = 2168, y = 2263, z = 7}}, m = {"50 Bunny", "25 D-Bunny"}, Time = 30}
-- },
-- Sábado
["Saturday"] = {
["09:00"] = {nome = "Bunny", pos = {fromPosition = {x = 1989, y = 2094, z = 7},toPosition = {x = 2153, y = 2177, z = 7}}, m = {"75 Bunny", "35 D-Bunny"}, Time = 30},
["18:00"] = {nome = "Bunny", pos = {fromPosition = {x = 1989, y = 2094, z = 7},toPosition = {x = 2153, y = 2177, z = 7}}, m = {"75 Bunny", "35 D-Bunny"}, Time = 30}
}
-- Domingo
-- ["Sunday"] = {
-- ["14:30"] = {nome = "Infernal Demon", pos = {fromPosition = {x = 1989, y = 2094, z = 7},toPosition = {x = 2153, y = 2177, z = 7}}, m = {"1 Infernal Demon", "60 devil"}, Time = 30}
-- }
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
doBroadcastMessage("invasion " .. tb.nome .. " started, in 15 minutes everyone will disappear")
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
    addEvent(doBroadcastMessage, tb.Time*60*1000, "A invasão de " .. tb.nome .. " acabou.") -- Mensagem que vai aparecer para todos do servidor quando a invasão iniciar
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