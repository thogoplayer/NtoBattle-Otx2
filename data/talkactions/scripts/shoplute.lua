local shop = {
["Shiny Ultimate Zygarde"] = {pokemon = "Ultimate Zygarde", preco = 600, boost = 720},
["Ultimate Zygarde"] = {pokemon = "Ultimate Zygarde", preco = 350, boost = 620},
["Shiny Hoopa Unbound"] = {pokemon = "Shiny Hoopa Unbound", preco = 210, boost = 300},
["Good Hoopa Unbound"] = {pokemon = "Good Hoopa Unbound", preco = 250, boost = 400},
["Shiny Good Hoopa"] = {pokemon = "Shiny Hoopa Unbound", preco = 300, boost = 600},
["Hoopa Unbound"] = {pokemon = "Hoopa Unbound", preco = 140, boost = 100},
["Shiny Meloetta"] = {pokemon = "Shiny Meloetta", preco = 200, boost = 300},
["Black Mega Aerodactyl"] = {pokemon = "Black Mega Aerodactyl", preco = 67, boost = 100},
["Black Mega Alakazam"] = {pokemon = "Black Mega Alakazam", preco = 60, boost = 100},
["Black Mega Ampharos"] = {pokemon = "Black Mega Ampharos", preco = 60, boost = 100},
["Black Mega Blastoise"] = {pokemon = "Black Mega Blastoise", preco = 60, boost = 100},
["Black Mega Blaziken"] = {pokemon = "Black Mega Blaziken", preco = 60, boost = 100},
["Black Mega Charizard"] = {pokemon = "Black Mega Charizard", preco = 60, boost = 100},
["Black Mega Gengar"] = {pokemon = "Black Mega Gengar", preco = 60, boost = 100},
["Black Mega Gyarados"] = {pokemon = "Black Mega Gyarados", preco = 60, boost = 100},
["Black Mega Swampert"] = {pokemon = "Black Mega Swampert", preco = 60, boost = 100},
["Black Mega Tyranitar"] = {pokemon = "Black Mega Tyranitar", preco = 60, boost = 100},
["Fallen Jirachi"] = {pokemon = "Fallen Jirachi", preco = 50, boost = 100},
["Black Arceus"] = {pokemon = "Black Arceus", preco = 40, boost = 100},
["Shiny Metagross"] = {pokemon = "Shiny Metagross", preco = 35, boost = 100},
["Shiny Arceus"] = {pokemon = "Shiny Arceus", preco = 30, boost = 100},
["Shadow Jirachi"] = {pokemon = "Shadow Jirachi", preco = 30, boost = 100},
["Black Genesect"] = {pokemon = "Black Genesect", preco = 30, boost = 100},
["White Genesect"] = {pokemon = "White Genesect", preco = 25, boost = 100},
["Divine Arceus"] = {pokemon = "Divine Arceus", preco = 20, boost = 100},
["Meloetta"] = {pokemon = "Meloetta", preco = 140, boost = 100},
["Squad Lucario"] = {pokemon = "Squad Lucario", preco = 120, boost = 200},
["Ultimate Stone"] = {itemid = "", preco = 7},
["Shiny Zygarde"] = {pokemon = "Shiny Zygarde", preco = 210, boost = 300},
["Zygarde"] = {pokemon = "Zygarde", preco = 100, boost = 100},
["Chave De Proton"] = {itemid = "8762", preco = 5},
["Hero Vip"] = {itemid = "13160", preco = 20},
["Beta Vip"] = {itemid = "13232", preco = 10},
["Life Boost"] = {itemid = "13308", preco = 25},
["Troca De Sexo"] = {itemid = "10305", preco = 10},
["Sasuke"] = {itemid = "13626", preco = 25}, --certo
["kisame"] = {itemid = "13636", preco = 25}, -- CERTO
["Bear"] = {itemid = "13629", preco = 25}, -- CERTO
["Kaguya"] = {itemid = "13631", preco = 25}, -- CERTO
["Pain"] = {itemid = "13634", preco = 25}, -- CERTO
["Naruto"] = {itemid = "13635", preco = 25}, -- CERTO
["Sasuke Akatsuki"] = {itemid = "13637", preco = 25}, -- CERTO
["Tobi"] = {itemid = "13647", preco = 25},-- CERTO
["Madara"] = {itemid = "13651", preco = 25},-- CERTO
["Minato"] = {itemid = "13654", preco = 25},-- CERTO
--- DO DRAGON BALL-----
["Pink Goku"] = {itemid = "13633", preco = 25}, -- CERTO
["Goku Supreme"] = {itemid = "13653", preco = 25},
-- outfits aleatorias ou varidas--
["Puff"] = {itemid = "13627", preco = 25}, --- CERTO
["Daene"] = {itemid = "13628", preco = 25}, -- CERTO
["Spider Man"] = {itemid = "13630", preco = 25}, -- CERTO
["Cosplay"] = {itemid = "13632", preco = 25}, -- CERTO
["Black Cell"] = {itemid = "13638", preco = 25}, -- CERTO
["Yato Board"] = {itemid = "13639", preco = 25}, -- CERTO
["Iron Man"] = {itemid = "13640", preco = 25}, -- CERTO
["Sub Zero"] = {itemid = "13641", preco = 25}, -- CERTO
["Wolf"] = {itemid = "13642", preco = 20}, -- CERTO
["Izuna"] = {itemid = "13643", preco = 25}, -- CERTO
["Hagoromo"] = {itemid = "13644", preco = 25}, -- CERTO
["Mage Magic"] = {itemid = "13645", preco = 25}, -- CERTO
["Magic Mage"] = {itemid = "13646", preco = 25}, -- CERTO
["Snowbro"] = {itemid = "13648", preco = 25},-- CERTO
["Homer"] = {itemid = "13649", preco = 25},-- CERTO
["Defense"] = {itemid = "13650", preco = 25},-- CERTO
["Scorpion"] = {itemid = "13652", preco = 25},-- CERTO
["Rabiit"] = {itemid = "13655", preco = 25},-- CERTO
["Gengar Puff"] = {itemid = "13656", preco = 25},-- CERTO
["Afk"] = {itemid = "13362", preco = 40},-- CERTO
}
function onSay(cid, words, param, channel)
local points = getdiamonds(cid)
local diamond = 2160
local mydimamonds = getPlayerItemCount(cid, diamond)

local liberar = "Falso"


if param == "" then
doPlayerSendTextMessage(cid, 19, "Voce tem " .. mydimamonds .. " diamonds.")
doPlayerSendTextMessage(cid, 19, "Antes de comprar Qualquer outfit diga /desbugaroutfit ou !desbugaroutfit So se for comprar")
doPlayerSendTextMessage(cid, 19, "Para saber o'que voce pode comprar digite /shop lista")
doPlayerSendTextMessage(cid, 19, "Para escolher um item digite /shop [nome do item]")
doPlayerSendTextMessage(cid, 19, "Listas disponiveis: /shop lista, /shop lista2, /shop lista3, /shop lista4, /shop lista5, /shop lista6,  /shop lista7,  /shop lista8")
doPlayerSendTextMessage(cid, 19, "Exemplo: /shop Shiny Metagross")
return true
end

if(param == "lista") then 
local str = {}
      table.insert(str, "1- [Beta VIP] -\nPreco: +[" .. shop["Beta Vip"].preco .." diamonds]+\n\n")   
      table.insert(str, "1- [Black Mega Aerodactyl] -\nPreco: +[" .. shop["Black Mega Aerodactyl"].preco .." diamonds]+\n\n")   
      table.insert(str, "2- [Black Mega Alakazam] -\nPreco: +[" .. shop["Black Mega Alakazam"].preco .." diamonds]+\n\n")   
      table.insert(str, "3- [Black Mega Ampharos] -\nPreco: +[" .. shop["Black Mega Ampharos"].preco .." diamonds]+\n\n")   
      table.insert(str, "4- [Black Mega Blastoise] -\nPreco: +[" .. shop["Black Mega Blastoise"].preco .." diamonds]+\n\n")   
      table.insert(str, "5- [Black Mega Blaziken] -\nPreco: +[" .. shop["Black Mega Blaziken"].preco .." diamonds]+\n\n")   
      table.insert(str, "6- [Black Mega Charizard] -\nPreco: +[" .. shop["Black Mega Charizard"].preco .." diamonds]+\n\n")   
      table.insert(str, "7- [Black Mega Gengar] -\nPreco: +[" .. shop["Black Mega Gengar"].preco .." diamonds]+\n\n")   
      table.insert(str, "8- [Black Mega Gyarados] -\nPreco: +[" .. shop["Black Mega Gyarados"].preco .." diamonds]+\n\n")   
      table.insert(str, "9- [Black Mega Swampert] -\nPreco: +[" .. shop["Black Mega Swampert"].preco .." diamonds]+\n\n")   
      table.insert(str, "10- [Black Mega Tyranitar] -\nPreco: +[" .. shop["Black Mega Tyranitar"].preco .." diamonds]+\n\n")   




doShowTextDialog(cid, 8762, "[+] -- Loja PokeLute -- [+]\n\n --{ + Ordem Alfabetica + }--\n\n\n" .. table.concat(str) .. "\n\n\n\nwww.pokelute2.com") 
return true
end

if(param == "lista2") then 
local str2 = {}
      table.insert(str2, "11- [Black Genesect] -\nPreco: +[" .. shop["Black Genesect"].preco .." diamonds]+\n\n")   
      table.insert(str2, "12- [Black Arceus] -\nPreco: +[" .. shop["Black Arceus"].preco .." diamonds]+\n\n")     
      table.insert(str2, "13- [Chave de Proton] -\nPreco: +[" .. shop["Chave De Proton"].preco .." diamonds]+\n\n")   
      table.insert(str2, "14- [Divine Arceus] -\nPreco: +[" .. shop["Divine Arceus"].preco .." diamonds]+\n\n")   
      table.insert(str2, "15- [Fallen Jirachi] -\nPreco: +[" .. shop["Fallen Jirachi"].preco .." diamonds]+\n\n")   
      table.insert(str2, "16- [Hoopa Unbound] -\nPreco: +[" .. shop["Hoopa Unbound"].preco .." diamonds]+\n\n")   	 
      table.insert(str2, "17- [Hero VIP] -\nPreco: +[" .. shop["Hero Vip"].preco .." diamonds]+\n\n") 	  
      table.insert(str2, "18- [Life Boost] -\nPreco: +[" .. shop["Life Boost"].preco .." diamonds]DESATIVADA+\n\n") 	  
      table.insert(str2, "19- [Meloetta] -\nPreco: +[" .. shop["Meloetta"].preco .." diamonds]+\n\n")   




doShowTextDialog(cid, 8762, "[+] -- Loja PokeLute -- [+]\n\n --{ + Ordem Alfabetica + }--\n\n\n" .. table.concat(str2) .. "\n\n\n\nwww.pokelute2.com") 
return true
end

if(param == "lista3") then 
local str3 = {}
      table.insert(str3, "20- [Shadow Jirachi] -\nPreco: +[" .. shop["Shadow Jirachi"].preco .." diamonds]+\n\n")   	  	  
      table.insert(str3, "21- [Shiny Meloetta] -\nPreco: +[" .. shop["Shiny Meloetta"].preco .." diamonds]+\n\n")   
      table.insert(str3, "22- [Shiny Zygarde] -\nPreco: +[" .. shop["Shiny Zygarde"].preco .." diamonds]+\n\n")   
      table.insert(str3, "23- [Shiny Metagross] -\nPreco: +[" .. shop["Shiny Metagross"].preco .." diamonds]+\n\n")   
      table.insert(str3, "24- [Shiny Arceus] -\nPreco: +[" .. shop["Shiny Arceus"].preco .." diamonds]+\n\n")   
 	




doShowTextDialog(cid, 8762, "[+] -- Loja PokeLute -- [+]\n\n --{ + Ordem Alfabetica + }--\n\n\n" .. table.concat(str3) .. "\n\n\n\nwww.pokelute2.com") 
return true
end

if(param == "lista4") then 	
local str4 = {}
      table.insert(str4, "25- [Shiny Hoopa Unbound] -\nPreco: +[" .. shop["Shiny Hoopa Unbound"].preco .." diamonds]+\n\n")  
      table.insert(str4, "26- [Good Hoopa Unbound] -\nPreco: +[" .. shop["Good Hoopa Unbound"].preco .." diamonds]+\n\n")   
      table.insert(str4, "27- [Shiny Good Hoopa] -\nPreco: +[" .. shop["Shiny Good Hoopa"].preco .." diamonds]+\n\n") 	
      table.insert(str4, "28- [Squad Lucario] -\nPreco: +[" .. shop["Squad Lucario"].preco .." diamonds]+\n\n")   
      table.insert(str4, "29- [Troca de Sexo] -\nPreco: +[" .. shop["Troca De Sexo"].preco .." diamonds]+\n\n")   	  
 




doShowTextDialog(cid, 8762, "[+] -- Loja PokeLute -- [+]\n\n --{ + Ordem Alfabetica + }--\n\n\n" .. table.concat(str4) .. "\n\n\n\nwww.pokelute2.com") 
return true
end

if(param == "lista5") then 	
local str5 = {}
      table.insert(str5, "30- [Ultimate Stone] -\nPreco: +[" .. shop["Ultimate Stone"].preco .." diamonds]+\n\n")     	  
      table.insert(str5, "31- [White Genesect] -\nPreco: +[" .. shop["White Genesect"].preco .." diamonds]+\n\n")   
      table.insert(str5, "32- [Zygarde] -\nPreco: +[" .. shop["Zygarde"].preco .." diamonds]+\n\n")   
      table.insert(str5, "--{ +[OUTFITS LOGO A ABAIXO]+ }\n\n--") 
      table.insert(str5, "33- [Sasuke] -\nPreco: +[" .. shop["Sasuke"].preco .." diamonds]+\n\n")
      table.insert(str5, "34- [kisame] -\nPreco: +[" .. shop["kisame"].preco .." diamonds]+\n\n")   
      table.insert(str5, "35- [Bear] -\nPreco: +[" .. shop["Bear"].preco .." diamonds]+\n\n")   
      table.insert(str5, "36- [Pain] -\nPreco: +[" .. shop["Pain"].preco .." diamonds]+\n\n") 
      table.insert(str5, "37- [Naruto] -\nPreco: +[" .. shop["Naruto"].preco .." diamonds]+\n\n") 
      table.insert(str5, "38- [Sasuke Akatsuki] -\nPreco: +[" .. shop["Sasuke Akatsuki"].preco .." diamonds]+\n\n") 


doShowTextDialog(cid, 8762, "[+] -- Loja PokeLute -- [+]\n\n --{ + Ordem Alfabetica + }--\n\n\n" .. table.concat(str5) .. "\n\n\n\nwww.pokelute2.com") 
return true
end

if(param == "lista6") then 	
local str6 = {}
      table.insert(str6, "39- [Tobi] -\nPreco: +[" .. shop["Tobi"].preco .." diamonds]+\n\n")     	  
      table.insert(str6, "40- [Madara] -\nPreco: +[" .. shop["Madara"].preco .." diamonds]+\n\n")   
      table.insert(str6, "41- [Minato] -\nPreco: +[" .. shop["Minato"].preco .." diamonds]+\n\n")   
      table.insert(str6, "42- [Pink Goku] -\nPreco: +[" .. shop["Pink Goku"].preco .." diamonds]+\n\n")
      table.insert(str6, "43- [Goku Supreme] -\nPreco: +[" .. shop["Goku Supreme"].preco .." diamonds]+\n\n")   
      table.insert(str6, "44- [Puff] -\nPreco: +[" .. shop["Puff"].preco .." diamonds]+\n\n")   
      table.insert(str6, "45- [Daene] -\nPreco: +[" .. shop["Daene"].preco .." diamonds]+\n\n") 
	  table.insert(str6, "46- [Spider Man] -\nPreco: +[" .. shop["Spider Man"].preco .." diamonds]+\n\n") 
	  table.insert(str6, "47- [Cosplay] -\nPreco: +[" .. shop["Cosplay"].preco .." diamonds]+\n\n") 
	  table.insert(str6, "48- [Black Cell] -\nPreco: +[" .. shop["Black Cell"].preco .." diamonds]+\n\n") 


doShowTextDialog(cid, 8762, "[+] -- Loja PokeLute -- [+]\n\n --{ + Outfits + }--\n\n\n" .. table.concat(str6) .. "\n\n\n\nwww.pokelute2.com") 
return true
end

if(param == "lista7") then 	
local str7 = {}
      table.insert(str7, "49- [Yato Board] -\nPreco: +[" .. shop["Yato Board"].preco .." diamonds]+\n\n")     	  
      table.insert(str7, "50- [Iron Man] -\nPreco: +[" .. shop["Iron Man"].preco .." diamonds]+\n\n")   
      table.insert(str7, "51- [Sub Zero] -\nPreco: +[" .. shop["Sub Zero"].preco .." diamonds]+\n\n")   
      table.insert(str7, "52- [Wolf] -\nPreco: +[" .. shop["Wolf"].preco .." diamonds]+\n\n")
      table.insert(str7, "53- [Izuna] -\nPreco: +[" .. shop["Izuna"].preco .." diamonds]+\n\n")   
      table.insert(str7, "54- [Hagoromo] -\nPreco: +[" .. shop["Hagoromo"].preco .." diamonds]+\n\n")   
      table.insert(str7, "55- [Mage Magic] -\nPreco: +[" .. shop["Mage Magic"].preco .." diamonds]+\n\n") 
	  table.insert(str7, "56- [Magic Mage] -\nPreco: +[" .. shop["Magic Mage"].preco .." diamonds]+\n\n") 
	  table.insert(str7, "57- [Snowbro] -\nPreco: +[" .. shop["Snowbro"].preco .." diamonds]+\n\n") 
	  table.insert(str7, "58- [Homer] -\nPreco: +[" .. shop["Homer"].preco .." diamonds]+\n\n") 


doShowTextDialog(cid, 8762, "[+] -- Loja PokeLute -- [+]\n\n --{ + Outfits + }--\n\n\n" .. table.concat(str7) .. "\n\n\n\nwww.pokelute2.com") 
return true
end

if(param == "lista8") then 	
local str8 = {}
      table.insert(str8, "59- [Defense] -\nPreco: +[" .. shop["Defense"].preco .." diamonds]+\n\n")     	  
      table.insert(str8, "60- [Scorpion] -\nPreco: +[" .. shop["Scorpion"].preco .." diamonds]+\n\n")   
      table.insert(str8, "61- [Rabiit] -\nPreco: +[" .. shop["Rabiit"].preco .." diamonds]+\n\n")   
      table.insert(str8, "62- [Gengar Puff] -\nPreco: +[" .. shop["Gengar Puff"].preco .." diamonds]+\n\n")
      table.insert(str8, "--{ +[NOVOS DONATES]+ }\n\n--") 
      table.insert(str8, "63- [Ultimate Zygarde] -\nPreco: +[" .. shop["Ultimate Zygarde"].preco .." diamonds]+\n\n") 
      table.insert(str8, "64- [Afk] -\nPreco: +[" .. shop["Afk"].preco .." diamonds]+\nDescricao:\n--{Esse Item faz voce adquirir o comando de afk}--\n")
      table.insert(str8, "65- [Shiny Ultimate Zygarde] -\nPreco: +[" .. shop["Shiny Ultimate Zygarde"].preco .." diamonds]+\n\n") 

doShowTextDialog(cid, 8762, "[+] -- Loja PokeLute -- [+]\n\n --{ + Outfits + }--\n\n\n" .. table.concat(str8) .. "\n\n\n\nwww.pokelute2.com") 
return true
end

pokemon = doCorrectString(param) 
local b = shop[pokemon]
if not b then 
		doPlayerSendTextMessage(cid, 25, "Este item nao existe.(" .. pokemon .. ")")
		return true
		end
local preco = b.preco
if mydimamonds >= preco then
	if b.pokemon then
	addPokeToPlayer(cid, pokemon, b.boost, "Masculino", "normal", false)
    doPlayerRemoveItem(cid, diamond, preco)
    doPlayerSendTextMessage(cid, 25, "Voce adquiriu um(a) " .. pokemon .. ".")
	
	local keyone = math.random(100,999)
	local keytwo = math.random(100,999)
	local keythree = math.random(100,999)
	local finalkey = "" .. keyone .. "-" .. keytwo .. "-" .. keythree
	local data = os.date("%d") .. "/" .. os.date("%m") .. "/" .. os.date("%Y")
	elseif b.itemid then
    doPlayerSendTextMessage(cid, 25, "Voce adquiriu um(a) " .. pokemon .. ".")
	doPlayerAddItem(cid, b.itemid, 1)
	doPlayerRemoveItem(cid, diamond, preco)
	
	local keyone = math.random(100,999)
	local keytwo = math.random(100,999)
	local keythree = math.random(100,999)
	local finalkey = "" .. keyone .. "-" .. keytwo .. "-" .. keythree
	local data = os.date("%d") .. "/" .. os.date("%m") .. "/" .. os.date("%Y")
	elseif not b.pokemon then
		if not b.itemid then
		doPlayerSendTextMessage(cid, 25, "Ocorreu um Error, reporte a um administrador.(" .. pokemon .. ")")
		end
		return true
	end
return true
else
		doPlayerSendTextMessage(cid, 25, "Voce nao possui diamonds necessarios, Necessita de: " .. preco .. ", Voce possui: " .. mydimamonds .. " diamonds")
		return true
		
end

end