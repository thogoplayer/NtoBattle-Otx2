local storageBuff = 102053  
local tempo = 60 -- tempo em segundos.
local effect = 577
local skillpoint = 25 
local health = 2000 
local speed = 800  
local skills = {{C_NINJUTSU, 10}, {C_GLOVE, 15}, {C_FIST, 10}}

function onCastSpell(cid, var)
if isBuffed(cid, storageBuff, 1) then doPlayerSendCancel(cid, "Sua aura já esta ativa!.") return false end  
local mpos = getPlayerPosition(cid)

doCreatureAddBuff(cid, skills, health, speed, tempo, 1)
createLoopEffectBuff(cid, tempo, effect, false, 600, true, 1)
setPlayerStorageValue(cid, storageBuff,1) -- storage verifica transformado, quando = 1 player esta transformado.
return true
end