function onSay(cid, words, param)
local TEMPO = 10 -- Intervalo de Tempo em segundos.

local CARGO = getPlayerGroupName(cid)
if CARGO == "player" then
doPlayerSendCancel(cid, "Voce nao possui cargo")
return true
end


local config = {
["administrador"] = {"ADMIN", 0},      
["diretor"] = {"DIRETOR", 0},  
["gamemaster"] = {"GAMEMASTER", 0},    
["tutor"] = {"TUTOR", 0},   
["help"] = {"HELP", 0},  
["you tuber"] = {"YOU TUBER", 0}
}

local group = config[CARGO]
local frase = group[1]
local effect = group[2]

local function doSendAutoMessage(cid, pos)
if (isCreature(cid) == true) then
if not isPlayerGhost(cid) then
doSendMagicEffect(getCreaturePosition(cid), effect)
doSendAnimatedText(getCreaturePosition(cid),""..frase.."", math.random(1,256))
end
addEvent(doSendAutoMessage, TEMPO*1000, cid, getCreaturePosition(cid))
end
end

local pos = getCreaturePosition(cid)
doSendMagicEffect(pos, effect)
doSendAnimatedText(pos,""..frase.."", math.random(1,256))
addEvent(doSendAutoMessage, TEMPO*1000, cid, pos)
return true
end 