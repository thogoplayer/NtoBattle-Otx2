function onDeath(cid, corpse, killer) 

local M ={
 ["Gerador Azul III"] = {Pos = {x=638,y=43,z=7},id= 1353,Pos2 = {x=646,y=42,z=7},id2= 1354,Pos3 = {x=661,y=42,z=7},id3= 1354,Pos4 = {x=673,y=42,z=7},id4= 1354},
}
local mensage1 = "[Evento Dota] Gerador Azul III Foi Destruido! Time Azul foi o Vencedor desta Rodada do Evento Dota! Sala dos vencedores Liberada, Comemorem!" -- Mensagem depois que o Gerador for Destruido
local v3 = {x=655, y=42, z=7, stackpos=253} -- position v3
local v2 = {x=667, y=41, z=7, stackpos=253} -- position v2
local v1 = {x=679, y=42, z=7, stackpos=253} -- position v1

local x = M[getCreatureName(cid)]
if x then
        local parede = getTileItemById(x.Pos, x.id)
		local parede2 = getTileItemById(x.Pos2, x.id2) 
        local parede3 = getTileItemById(x.Pos3, x.id3) 
	    local parede4 = getTileItemById(x.Pos4, x.id4) 
        if parede then 
                doRemoveItem(parede.uid, 1) 
				doRemoveItem(parede2.uid, 1) 
		        doRemoveItem(parede3.uid, 1) 
			    doRemoveItem(parede4.uid, 1) 
			doRemoveCreature(getThingfromPos(v3).uid)
			doRemoveCreature(getThingfromPos(v2).uid)
			doRemoveCreature(getThingfromPos(v1).uid)
			
broadcastMessage(mensage1, MESSAGE_EVENT_ADVANCE) 
        end 
end
return true 
end