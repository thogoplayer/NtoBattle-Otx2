local storageBuff = 102053  
local tempo = 60 -- tempo em segundos.
local effect = {126} 
local skillpoint = 10 
local health = 1000 
local speed = 400  
         
function onCastSpell(cid, var)
if isBuffed(cid, storageBuff, 1) then doPlayerSendCancel(cid, "Sua aura ja esta ativa!.") return false end  
local mpos = getPlayerPosition(cid)
AddBuff(cid, skillpoint, speed, health, CONDITION_PARAM_SKILL_DISTANCE)
    tempo2 = 0
    while (tempo2 ~= (tempo*1000)) do
        addEvent(EffectBuffAll, tempo2,cid, effect[1], false, storageBuff, true, 1)
        tempo2 = tempo2 + 600
    end
    setPlayerStorageValue(cid, storageBuff,1) -- storage verifica transformado, quando = 1 player esta transformado.
return true
end