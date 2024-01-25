function onEquip(cid, item, slot)
doPlayerSendTextMessage(cid, 22, 'Voce possui 20% a mais de XP!')
doPlayerSetExperienceRate(cid, getConfigValue("rateExperience")*1.2)
return true
end

function onDeEquip(cid, item, slot)
doPlayerSendTextMessage(cid, 22, 'Experiencia extra cancelada.')
doPlayerSetExperienceRate(cid, 1)
return true
end