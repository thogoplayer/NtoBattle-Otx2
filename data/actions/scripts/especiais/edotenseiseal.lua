function onUse(cid, item, frompos, itemEx, topos)
if not isInArray({210, 250}, getPlayerVocation(cid)) then
return doPlayerSendTextMessage(cid, 27, "Apenas Orochimaru eTobirama pode usar este item")
end

local edo = getItemAttribute(itemEx.uid, "corpsevocation")
if edo then
    doRemoveItem(item.uid)
    doRemoveItem(itemEx.uid)
if math.random(1,100) < 80 then
    local s = doPlayerAddItem(cid, 11166)
    doItemSetAttribute(s, "name", "Edo Tensei Selado")
    doItemSetAttribute(s, "description", "Contains a " .. edo)
    doItemSetAttribute(s, "edotensei", edo)	
    doSendMagicEffect(topos, 152)
    else
	doSendMagicEffect(topos, 2)
    return doPlayerSendTextMessage(cid, 27, "O selamento falhou")
    end
else
return doPlayerSendTextMessage(cid, 27, "Usado apenas em corpses de Players")
end
return true
end