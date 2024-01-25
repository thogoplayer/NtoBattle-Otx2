local function seal(c_name, target, time)
if isCreature(target) then
local t_Pos = getCreaturePosition(target)
doPlayerSendTextMessage(target,19,"Voce foi Selado pelo player "..c_name.." por "..time.." Segundos!")
doSendMagicEffect({x=t_Pos.x+1, y=t_Pos.y+1, z=t_Pos.z}, 721)
doSendAnimatedText(t_Pos, "SELADO", math.random(01,255))
exhaustion.set(target, 7689, time)
end
end

function onCastSpell(cid, var)
local target = getCreatureTarget(cid)
local targetpos = getCreaturePosition(target)
local time = 5 -- tempo para voltar em segundos

if exhaustion.check(cid, 45432) then
doPlayerSendTextMessage(cid, 23, "Aguarde " .. exhaustion.get(cid, 45432) .. " segundos para usar novamente.")
return false
end


if isPlayer(target) then
exhaustion.set(cid, 45432, 300)
doCreatureAddHealth(cid, - getCreatureMaxHealth(cid)/3)
doSendMagicEffect({x=targetpos.x, y=targetpos.y, z=targetpos.z}, 732)
addEvent(seal, 600,getCreatureName(cid), target, time)
else
doPlayerSendCancel(cid, "Voce so pode usar esta magia em players!")
end
return true
end
