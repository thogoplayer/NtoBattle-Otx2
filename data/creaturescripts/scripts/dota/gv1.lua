function onDeath(cid, corpse, killer) 

local M ={
 ["Gerador Vermelho I"] = {Pos = {x=673,y=42,z=7},id= 1354, Pos2 = {x=673,y=41,z=7},id2= 1354, Pos3 = {x=673,y=40,z=7},id3= 1354, Pos4 = {x=673,y=43,z=7},id4= 1354, Pos5 = {x=673,y=44,z=7},id5= 1354},
}
local mensage1 = "[Evento Dota] Gerador Vermelho I Foi Destruido!" -- Mensagem depois que o Gerador for Destruido
local monster1 = "Gerador Vermelho II" -- Boss que irá aparecer na invasão!

local x = M[getCreatureName(cid)]
if x then
        local parede = getTileItemById(x.Pos, x.id)
        local parede2 = getTileItemById(x.Pos2, x.id2) 
        local parede3 = getTileItemById(x.Pos3, x.id3) 
        local parede4 = getTileItemById(x.Pos4, x.id4) 
        local parede5 = getTileItemById(x.Pos5, x.id5) 
        if parede then
                doRemoveItem(parede.uid, 1)
                doRemoveItem(parede2.uid, 1)
                doRemoveItem(parede3.uid, 1)
                doRemoveItem(parede4.uid, 1)
                doRemoveItem(parede5.uid, 1)

				doCreateMonster(monster1, {x=667, y=41, z=7})
broadcastMessage(mensage1, MESSAGE_EVENT_ADVANCE) 
        end 
end
return true 
end