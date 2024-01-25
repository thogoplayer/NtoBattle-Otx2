function onDeath(cid, corpse, killer) 

local M ={
 ["Gerador Vermelho III"] = {Pos = {x=648,y=40,z=7},id= 1354,Pos2 = {x=640,y=42,z=7},id2= 1353,Pos3 = {x=625,y=42,z=7},id3= 1353,Pos4 = {x=613,y=42,z=7},id4= 1353},
}
local mensage1 = "[Evento Dota] Gerador Vermelho III Foi Destruido! Time Vermelho foi o Vencedor desta Rodada do Evento Dota! Sala dos vencedores Liberada, Comemorem!" -- Mensagem depois que o Gerador for Destruido
local a3 = {x=631, y=42, z=7, stackpos=253} -- position a3
local a2 = {x=619, y=41, z=7, stackpos=253} -- position a2
local a1 = {x=607, y=42, z=7, stackpos=253} -- position a1

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
			doRemoveCreature(getThingfromPos(a3).uid)
			doRemoveCreature(getThingfromPos(a2).uid)
			doRemoveCreature(getThingfromPos(a1).uid)

broadcastMessage(mensage1, MESSAGE_EVENT_ADVANCE) 
        end 
end
return true 
end