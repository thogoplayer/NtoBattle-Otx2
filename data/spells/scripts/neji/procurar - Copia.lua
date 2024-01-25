local config = {
pos = {x = 3592, y = 2324, z = 6}, -- posição que será teleportado
tempo = 11, -- tempo pra voltar
effect1 = 386, -- efeito ao ser teleportado
effect2 = 386, -- efeito ao voltar
storage = 19321, -- storage que fica guardado o cooldown
from = {x = 3569, y = 2314, z = 6}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
to = {x = 3616, y = 2345, z = 6}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
cooldown = 1, --- tempo entre um uso e outro (após usar a spell vc vai ficar X segundos sem poder usar ela novamente)
raio = {x = 90, y = 90 }
}

function Byakugan(cid, relative_pos, raio, floo)
local players = CheckMobs(relative_pos, raio)
if #players > 0 then
for _, pid in ipairs(players) do
if pid ~= cid then
local nametarget = getCreatureName(pid)
local mypos = getPlayerPosition(cid)
local targetpos = getPlayerPosition(pid)
local distancia = getDistanceBetween(mypos, targetpos)
local myposx = getPlayerPosition(cid).x
local myposy = getPlayerPosition(cid).y
local targetposx = getPlayerPosition(pid).x
local targetposy = getPlayerPosition(pid).y
local distOL = (myposx > targetposx and ""..myposx-targetposx.."m ao Oeste" or targetposx > myposx and ""..targetposx-myposx.."m ao Leste" or "")
local distNS = (myposy > targetposy and ""..myposy-targetposy.."m ao Norte" or targetposy > myposy and ""..targetposy-myposy.."m ao Sul" or "")
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "O jogador "..nametarget.." está a "..distancia.." m² de você ["..distOL.." /  "..distNS..""..(floo and " / Floor "..floo.."").."]")
doSendMagicEffect({x = targetpos.x+1, y = targetpos.y+1, z = targetpos.z} , 124)
end
end
return #players
else
return 0
end
return 0
end


function onCastSpell(cid, var) if isSelado(cid) then return false end
local pos = getPlayerPosition(cid)


if isInRange(pos, config.from, config.to) then
doPlayerSendCancel(cid, "Voce ja esta dentro da dimensão!")
return false
end

-- if getPlayerInKamui(cid) or getPlayerInArena(cid) or getPlayerInGenjutsu(cid) or getPlayerInGGN(cid) or getPlayerInTrainer(cid) or getPlayerInEvent(cid) then
-- doPlayerSendCancel(cid, "Voce Nao Pode Usar Esta Spell Aqui!")
-- return false
-- end


if os.time() - getPlayerStorageValue(cid, config.storage) >= config.cooldown then
doPlayerSetStorageValue(cid, config.storage, os.time())
local pos2 = {x = pos.x, y = pos.y, z = pos.z+1}
local pos3 = {x = pos.x, y = pos.y, z = pos.z-1}

if (Byakugan(cid, pos, config.raio) + Byakugan(cid, pos2, config.raio, "+1") + Byakugan(cid, pos2, config.raio, "-1")) > 1 then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Nenhum Jogador encontrado")
end
else
doPlayerSendCancel(cid, "Your skill is in cooldown, you must wait "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, config.storage))).." seconds.")
return false
end

return true
end