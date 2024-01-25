-- Monster Hunter Event feito por Killua, XTibia.com

local monsters = {"nukenin","kabutomushi","devil","dino","tutor","especialist huntsman","gen zetsu","gerotora","shinobi skys"} -- Monstros que podem ser sorteados
local time_min, max = 10, 15 -- Em minutos
local premios, gold = {{5921, 1}}, 0 -- {id do item, quantidade} que o jogador ganha e quantia de gold

function winMonsterEvent()
    local max_sto, winner = 0, 0
    local monster = getGlobalStorageValue(1919211)
    for _, pid in pairs(getPlayersOnline()) do
        local sto = getPlayerStorageValue(pid, 1814210)
        if sto > max_sto then
            max_sto = sto
            winner = pid
        end
    end
    if isPlayer(winner) then
        local artigo = getPlayerSex(winner) == 0 and "A jogadora" or "O jogador"
        doBroadcastMessage(artigo.." "..getCreatureName(winner).." matou "..getPlayerStorageValue(winner, 1814210).." "..monster.."s e venceu o evento, parabens!")
        for _, prize in pairs(premios) do
            doPlayerAddItem(winner, prize[1])
        end
        doPlayerAddMoney(winner, gold)
    else
        doBroadcastMessage("[Monster Hunter Event] O evento terminou e nao houve nenhum vencedor.")
    end 
    setGlobalStorageValue(1919211, 0)
end   


function onTime()
    local random = math.random(1, #monsters)
    local time = math.random(time_min, max)
    for _, pid in pairs(getPlayersOnline()) do
        doPlayerSetStorageValue(pid, 1814210, 0)
    end
    setGlobalStorageValue(1919211, monsters[random])
    doBroadcastMessage("[Monster Hunter Event] O evento comecou e vai durar "..time.." minuto. O monstro sorteado foi "..monsters[random].."! Quem matar mais deles ate o fim sera o vencedor!")
    addEvent(winMonsterEvent, time*1000*60)    
    return true
end