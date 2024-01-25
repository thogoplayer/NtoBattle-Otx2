skillConfig = {skill = getConfigValue('rateSkill'), magiclevel = getConfigValue('rateMagic')}
skillStages = {}
skillStages[SKILL__MAGLEVEL] = {{0,10},{10,10},{20,10},{30,10},{40,10},{50,10},{55,10},{60,10},{70,10},{80,10},{90,10},{100,10},{110,10},{120,10},{130,10},{140,10}}
showInfoOnAdvance = false -- envia uma nova mensagem com a sua nova rate
showInfoOnLogin = false -- envia mensagem da rate ao jogador ao logar

function getPlayerSkillRatesText(cid)
local skillInfo = getPlayerRates(cid)
return "Rates Info: [ Ninjutsu: " .. skillInfo[SKILL__MAGLEVEL] * skillConfig.magiclevel .. "x]"
end