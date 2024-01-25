local items = {
    [13893] = {maxAmmount = 80, chance = 100},
}

function onUse(cid, item)
    for i, e in pairs(items) do
        if math.random(100) <= e.chance then
            local ammount = math.random(1, e.maxAmmount)
            
            doPlayerAddItem(cid, i, ammount)
            doPlayerSendTextMessage(cid, 27, "Voce ganhou "..ammount.."x "..getItemNameById(i))
        end
    end
    doRemoveItem(item.uid)
    return true
end