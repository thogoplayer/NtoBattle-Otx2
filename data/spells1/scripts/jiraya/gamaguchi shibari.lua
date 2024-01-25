local config = {
pos = {x = 2135, y = 3504, z = 8}, -- posição que será teleportado
effectIn = 703, -- efeito ao ser teleportado
effectOut = 705, -- efeito ao voltar
storage = 19329, -- storage que fica guardado o cooldown
from = {x = 2119, y = 3495, z = 6}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
to = {x = 2150, y = 3516, z = 6}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
cooldown = 90, --- tempo entre um uso e outro (após usar a spell vc vai ficar X segundos sem poder usar ela novamente)
duration = 30, -- tempo pra voltar
raio = {x = 7, y = 5},
key = 19623
}

local function spawnEffectPos(pos, effect, quant, delay)
for i = 1, quant do
addEvent(doSendMagicEffect, i*delay, pos, effect)
end
end

local function adjustPos(playerPos, targetPos)
local X = targetPos.x - playerPos.x
local Y = targetPos.y - playerPos.y
return {x = config.pos.x+X, y = config.pos.y+Y, z = config.pos.z}
end


local function teleportAll(cid, pos) 
local players = getAllPlayersInArea({x = pos.x-config.raio.x, y = pos.y-config.raio.y, z = pos.z}, {x = pos.x+config.raio.x, y = pos.y+config.raio.y, z = pos.z})
for _, pid in ipairs(players) do
    if isWalkable(getCreaturePosition(pid), true) and not getCreatureIn(pid, AREA_ARENA) and not getCreatureIn(pid, AREA_TRAINER) then
        savePos(pid, config.key)
        doTeleportThing(pid, adjustPos(pos, getCreaturePosition(pid)))
        addEvent(tpEffect, TIME_SECONDS * config.duration, pid, getPos(pid, config.key), config.effectOut)
            if pid ~= cid then
            doPlayerSendTextMessage(pid, 27, "You were teleported by ".. getCreatureName(cid) ..".")
            end
        for i = 0,config.duration  do
            addEvent(function()
                if isPlayer(pid) then
                doPlayerSendTextMessage(pid,25,"You'll be back in " .. config.duration -i .. " second(s)")
                end
            end, TIME_SECONDS * i)
        end
    end
end
end


function onCastSpell(cid, var) 
if isSelado(cid) then return false end

if exhaustion.check(cid, config.storage) then
local seetime = exhaustion.get(cid, config.storage)
doPlayerSendCancel(cid, "Aguarde "..math.floor(seetime/60).." minutos e "..math.floor(seetime%60).." segundos para usar o jutsu novamente!")
return false
end

local pos = getPlayerPosition(cid)

if isInRange(pos, config.from, config.to) then
doPlayerSendCancel(cid, "Voce ja esta dentro da dimensão!")
return false
end

if getCreatureIn(cid, AREA_KAMUI) or getCreatureIn(cid, AREA_ARENA) or getCreatureIn(cid, AREA_GENJUTSU) or getCreatureIn(cid, AREA_GGN) or getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_EVENT) then
doPlayerSendCancel(cid, "Voce Nao Pode Usar Esta Spell Aqui!")
return false
end

teleportAll(cid, pos) 
exhaustion.set(cid, config.storage, config.cooldown)
doSendMagicEffect({x = pos.x+1, y = pos.y, z = pos.z}, config.effectIn)
spawnEffectPos({x = pos.x+1, y = pos.y, z = pos.z}, 704, 110, 100)
doPlayerSendTextMessage(cid, 27, "You teleported yourself.")

return true
end