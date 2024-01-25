local config = {
["kaguya cetro"] = {id = 12027, sell = 'yes 15', buy = 'yes 15' },
["kage shuriken"] = {id = 2659, sell = 'yes 15', buy = 'yes 15' },
["raijin nidaime sword"] = {id = 7869, sell = 'yes 15', buy = 'yes 15' },
["slayer glove"] = {id = 2388, sell = 'yes 15', buy = 'yes 15' },
["yondaime tunic"] = {id = 12011, sell = 'yes 8', buy = 'yes 25' },
["tobi mask"] = {id = 12012, sell = 'yes 8', buy = 'yes 15' },
["sennin legs"] = {id = 12010, sell = 'yes 3', buy = 'yes 15' },
["vital boots"] = {id = 12009, sell = 'yes 3', buy = 'yes 10' },
["mes premium"] = {id = 9004, sell = 'yes 5', buy = 'yes 10' },
["madara rinnegan shield"] = {id = 12048, sell = 'yes 8', buy = 'yes 10' },
["minato vocation"] = {id = 12051, sell = 'yes 25', buy = 'yes 30' },
["madara vocation"] = {id = 12053, sell = 'yes 25', buy = 'yes 30' },
["hashirama vocation"] = {id = 12052, sell = 'yes 25', buy = 'yes 30' },

}



function upperfirst(first, rest)
return first:upper()..rest:lower()
end

function onSay(cid, words, param, channel)

if getGlobalStorageValue(5000) < 2000 then
setGlobalStorageValue(5000, 2000) 
return true
end
local file = "data/logs/Shop Donate.txt"
local text = io.open(file, "a+")

if exhaustion.get(cid, 5545795) then	
	return doPlayerSendTextMessage(cid,29,"Wait 1 second to buy again.")
end

exhaustion.set(cid, 5545795, 1)
if (param == nil or param == '' or param == 'lista' or param == 'list') then
if (words == "!sellshop" or words == "/sellshop") then
str = "(Beta Test) Para Vender use:\n !sellshop [NOME DO ITEM]:\n\n"
else
str = "(Beta Test) Para Comprar use: !buyshop [NOME DO ITEM]:\n\n"
end
for item, vars in pairs(config) do
if (words == "!sellshop" or words == "/sellshop") then
expl = string.explode(vars.sell, " ")
else
expl = string.explode(vars.buy, " ")
end
item = item:gsub("(%a)([%w_']*)", upperfirst)
if (expl[1] == 'no') then
str = str
else
str = str .. item.. " - " .. expl[2] .. " Donate Points\n"
end
end
return doPlayerPopupFYI(cid, str)  
end
local item = config[param:lower()]
param = param:lower()
if (item) then
local sell = string.explode(item.sell, " ")
local buy = string.explode(item.buy, " ")
if (words == "!sellshop" or words == "/sellshop") then
if (sell[1] == "yes") then
if (doPlayerRemoveItem(cid, item.id, 1)) then
doPlayerAddItem(cid, 10558, sell[2])
doSendMagicEffect(getPlayerPosition(cid), 13)
return doPlayerSendTextMessage(cid,29,"Voce vendeu seu "..param.." por "..sell[2].." Donate Points.")
else
doSendMagicEffect(getPlayerPosition(cid), 2)
return doPlayerSendTextMessage(cid,29,"Voce nao tem 1 "..param.." para vender.")
end
else
doSendMagicEffect(getPlayerPosition(cid), 2)
return doPlayerSendTextMessage(cid,29,"Sorry, "..param.." cannot be sold.")
end
else
if (buy[1] == "yes") then
if (doPlayerRemoveItem(cid, 10558, buy[2])) then
local x = doPlayerAddItem(cid, item.id)
doItemSetAttribute(x, "description", 'Comprado pelo jogador '..getCreatureName(cid)..' \n['..os.date('%d/%m/%Y %X', os.time())..'] \n Item ID ['..getGlobalStorageValue(5000)..']')
doItemSetAttribute(x, "uid", getGlobalStorageValue(5000)) 
doSendMagicEffect(getPlayerPosition(cid), 5)
setGlobalStorageValue(5000,getGlobalStorageValue(5000)+1)
text:write("["..os.date("%d/%m/%Y %X", os.time()).."] "..getPlayerName(cid).." ["..getPlayerLevel(cid).."]: Comprou 1 "..getItemNameById(item.id).." Item ID ["..getGlobalStorageValue(5000).."] por "..buy[2].." Vip Points.\n")
text:close()
return doPlayerSendTextMessage(cid,29,"Você comprou 1 "..param.." por "..buy[2].." Donate Points.")
else
doSendMagicEffect(getPlayerPosition(cid), 2)
return doPlayerSendTextMessage(cid,29,"Voce nao tem Donate Points.")
end
else
doSendMagicEffect(getPlayerPosition(cid), 2)
return doPlayerSendTextMessage(cid,29,"Sorry, "..param.." cannot be bought.")
end
end

else
doSendMagicEffect(getPlayerPosition(cid), 2)
if (words == "!sellshop") then
return doPlayerSendTextMessage(cid,29,"Este item nao existe.")	
else
return doPlayerSendTextMessage(cid,29,"Este item nao existe.") 
end
end
end