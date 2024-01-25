local config = {
storage = 19329, -- storage que fica guardado o cooldown
from = {x = 3569, y = 2314, z = 6}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
to = {x = 3616, y = 2345, z = 6}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
cooldown = 30, --- tempo entre um uso e outro (após usar a spell vc vai ficar X segundos sem poder usar ela novamente)
raio = {x = 90, y = 90 }
}


function Byakugan(cid, pos, floo)
local players = getAllPlayersInArea({x = pos.x-config.raio.x, y = pos.y-config.raio.y, z = pos.z}, {x = pos.x+config.raio.x, y = pos.y+config.raio.y, z = pos.z})
local validate = 0
for _, pid in ipairs(players) do
local t_Pos = getPlayerPosition(pid)
if pid ~= cid and  isWalkable(t_Pos, true) then
local cPos = getPlayerPosition(cid)
local distOL = (cPos.x > t_Pos.x and ""..cPos.x-t_Pos.x.."m² ao Oeste" or t_Pos.x > cPos.x and ""..t_Pos.x-cPos.x.."m² ao Leste" or "")
local distNS = (cPos.y > t_Pos.y and ""..cPos.y-t_Pos.y.."m² ao Norte" or t_Pos.y > cPos.y and ""..t_Pos.y-cPos.y.."m² ao Sul" or "")
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, string.format("O jogador %s está a %d m² de você [%s / %s %s]", getCreatureName(pid), getDistanceBetween(cPos, t_Pos), distOL, distNS, (floo and " / Floor "..floo.."" or "")))
doSendMagicEffect({x = t_Pos.x+1, y = t_Pos.y+1, z = t_Pos.z} , 124)
validate = validate +1
end
end

return validate
end


function onCastSpell(cid, var) if isSelado(cid) then return false end

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

local pos2 = {x = pos.x, y = pos.y, z = pos.z+1}
local pos3 = {x = pos.x, y = pos.y, z = pos.z-1}
exhaustion.set(cid, config.storage, config.cooldown)
if (Byakugan(cid, pos) + Byakugan(cid, pos3, "+1") + Byakugan(cid, pos2, "-1")) < 1 then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Nenhum Jogador encontrado")
end

return true
end