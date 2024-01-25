function onSay(cid, words, param, channel) 

if (words == "!life") or (words == "/life") then
doPlayerSendTextMessage(cid, 27, "Health: ["..getCreatureHealth(cid).."/"..getCreatureMaxHealth(cid).."]")

elseif (words == "!mana") or (words == "/mana") then
doPlayerSendTextMessage(cid, 27, "Mana: ["..getCreatureMana(cid).."/"..getCreatureMaxMana(cid).."]")
end
return TRUE
end