local pdays = 7 -- Dias de Premium que ira ganhar
    function onUse(cid, item, fromPosition, itemEx, toPosition)
            doPlayerAddPremiumDays(cid, pdays)
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ganhou  " .. pdays .. " dias de preium account.")
            doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
            doRemoveItem(item.uid, 1)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce sera desconectado em 5 segundos.")
            addEvent(doRemoveCreature, 1500, cid)
end