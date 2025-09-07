if not Arklatro then
    Arklatro = {}
end

---@param path string
function Arklatro.loadFile(path)
    local val, err = SMODS.load_file(path)
    if err == nil and val ~= nil then
        val()
    end
end

Arklatro.loadFile("libs/palette.lua")
Arklatro.loadFile("libs/math.lua")

Arklatro.loadFile("items/atlas.lua")
Arklatro.loadFile("items/enhancements.lua")
Arklatro.loadFile("items/jokers/common.lua")
Arklatro.loadFile("items/jokers/uncommon.lua")
Arklatro.loadFile("items/jokers/rare.lua")
Arklatro.loadFile("items/jokers/legendary.lua")
