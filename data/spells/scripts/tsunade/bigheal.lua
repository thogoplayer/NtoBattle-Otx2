local config = {
cooldown = 60, -- tempo entre uma magia e outra
time = 15, -- tempo em segundos que ficará healando
percent = 5, --- porcentagem da vida que cura
storage = 19330,
effect = 843, --- efeito que vai sair
mana = 0 -- quanto custa de mana
}
function onCastSpell(cid, var)
if getCreatureMana(cid) >= config.mana then
if os.time() - getPlayerStorageValue(cid, config.storage) >= config.cooldown then
doPlayerSetStorageValue(cid, config.storage, os.time())
local i = 0
doCreatureAddMana(cid, -config.mana, 0)
while i < config.time do
i = i+1
addEvent(function()
 if isCreature(cid) then
 if getCreatureMaxHealth(cid) ~= getCreatureHealth(cid) then
 local lifedraw = math.ceil(getCreatureMaxHealth(cid) * (config.percent)/100)
 local pos = getPlayerPosition(cid)
              doCreatureAddHealth(cid, lifedraw, 1) 
              doSendAnimatedText(pos, "+"..lifedraw , TEXTCOLOR_GREEN) 
            doSendMagicEffect(pos, config.effect)
end
end
end, 1000*i)
end
else
doPlayerSendCancel(cid, "Aguarde "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, config.storage))).." segundos para usar novamente.")
end
else
doPlayerSendCancel(cid, 36)
end
return false
end