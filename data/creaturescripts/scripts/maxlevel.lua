local maxlevel = 1200
function onAdvance(cid, skill, oldLevel, newLevel)
    if skill == SKILL__LEVEL then
        if newLevel > maxlevel then
            doPlayerAddExp(cid, getExperienceForLevel(maxlevel)-getPlayerExperience(cid))
            return false
        end
    end 
return true
end