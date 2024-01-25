  local CONFIG =  {
        [0] = {"+Taijutsu "},
        [1] = {"+Glove "},
        [2] = {"+Sword "},
        [3] = {"+Weapon "},
        [4] = {"+Distance "},
        [5] = {"+Shielding "},
        [6] = {"+Fishing "},
        [7] = {"+Ninjutsu "},
        [8] = {"+Level "}
}
local USE_EFFECTS = true
function onAdvance(cid, skill, oldlevel, newlevel)
        if skill == SKILL__LEVEL then
                doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
                doCreatureAddMana(cid, getCreatureMaxMana(cid) - getCreatureMana(cid))
        end
        if not CONFIG[skill] or USE_EFFECTS == false then
                return true
        end
        -- local p = getPlayerPosition(cid)
        -- local POSITIONS = {
                -- [1] = {pos={x=p.x+1,y=p.y,z=p.z}, delay = 100, delay2 = 900},
                -- [2] = {pos={x=p.x+1,y=p.y+1,z=p.z}, delay = 200, delay2 = 980},
                -- [3] = {pos={x=p.x,y=p.y+1,z=p.z}, delay = 300, delay2 = 1060},
                -- [4] = {pos={x=p.x-1,y=p.y+1,z=p.z}, delay = 400, delay2 = 1140},
                -- [5] = {pos={x=p.x-1,y=p.y,z=p.z}, delay = 500, delay2 = 1220},
                -- [6] = {pos={x=p.x-1,y=p.y-1,z=p.z}, delay = 600, delay2 = 1300},
                -- [7] = {pos={x=p.x,y=p.y-1,z=p.z}, delay = 700, delay2 = 1380},
                -- [8] = {pos={x=p.x+1,y=p.y-1,z=p.z}, delay = 800, delay2 = 1460}
        -- }
        -- for i = 1, #POSITIONS do
        -- end
        doSendMagicEffect(p, 294)
		doCreatureSay(cid,""..CONFIG[skill][1] .. "["..newlevel.."]", TALKTYPE_MONSTER)
        doPlayerSave(cid, true)
        return true
end 