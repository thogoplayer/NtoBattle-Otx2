local cor = 121 -- cor do texto
local effect = 573 -- id do magic effect 
local msg = "BLOCK" -- msg
local chanceblock = 15
 
function onStatsChange(cid, attacker, type, combat, value)
    local chancex = math.random(1, 1000)
	local pos = getCreaturePosition(cid)
    if type == STATSCHANGE_HEALTHLOSS then
        if chanceblock >= chancex then
        doSendMagicEffect({x=pos.x+1, y=pos.y, z=pos.z}, effect)
        doSendAnimatedText(getCreaturePosition(cid), msg, cor)
        return false
        end
    end
    return true
end