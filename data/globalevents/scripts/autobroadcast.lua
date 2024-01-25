-- [( Script created by leandro)] --
function onThink(interval, lastExecution)
MENSAGEM = {
"Importante: Para duvidas utilizem o Help Channel. Em caso de achar algum BUG ou ver um player fazendo algo contra as regras no servidor fale: !report e escreva o que aconteceu.",
"Utilizem os canais de forma adequada, {Help} para duvidas, {Trade} para trocas e {Game-Chat} para conversas",
"Respeito acima de tudo, staff acima de todos, mantenha o respeito com a staff e com o jogadores em geral, evite ser punido!",
}
doBroadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)],22)
return TRUE
end