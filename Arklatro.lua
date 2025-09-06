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

Arklatro.loadFile("items/atlas.lua")
Arklatro.loadFile("items/enhancements.lua")
Arklatro.loadFile("items/jokers/common.lua")
Arklatro.loadFile("items/jokers/uncommon.lua")
Arklatro.loadFile("items/jokers/rare.lua")
Arklatro.loadFile("items/jokers/legendary.lua")

-- Credits. (Originally from Ascensio/Entropy)

local smcmb = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
    smcmb(obj, badges)
    if not SMODS.config.no_mod_badges and obj and obj.ark_credits then
        local function calc_scale_fac(text)
            local size = 0.9
            local font = G.LANG.font
            local max_text_width = 2 - 2 * 0.05 - 4 * 0.03 * size - 2 * 0.03
            local calced_text_width = 0
            ---@diagnostic disable-next-line: access-invisible, undefined-field
            -- Math reproduced from DynaText:update_text
            for _, c in utf8.chars(text) do
                local tx = font.FONT:getWidth(c) * (0.33 * size) * G.TILESCALE * font.FONTSCALE + 2.7 * 1 * G.TILESCALE * font.FONTSCALE
                ---@diagnostic disable-next-line: assign-type-mismatch
                calced_text_width = calced_text_width + tx / (G.TILESIZE * G.TILESCALE)
            end
            local scale_fac = calced_text_width > max_text_width and max_text_width / calced_text_width or 1
            return scale_fac
        end
        if obj.ark_credits.art or obj.asc_credits.code or obj.asc_credits.idea or obj.asc_credits.name or obj.asc_credits.custom then
            local scale_fac = {}
            local min_scale_fac = 1
            local strings = { "Ascēnsiō" }
            for _, v in ipairs({ "name", "idea", "art", "code" }) do
                if obj.ark_credits[v] then
                    for i = 1, #obj.ark_credits[v] do
                        strings[#strings + 1] = localize({ type = "variable", key = "cry_" .. v, vars = { obj.ark_credits[v][i] } })[1]
                    end
                end
            end
            if obj.ark_credits.custom then
                strings[#strings + 1] = localize({
                    type = "variable",
                    key = obj.ark_credits.custom.key,
                    vars = { obj.ark_credits.custom.text },
                })
            end
            for i = 1, #strings do
                scale_fac[i] = calc_scale_fac(strings[i])
                min_scale_fac = math.min(min_scale_fac, scale_fac[i])
            end
            local ct = {}
            for i = 1, #strings do
                ct[i] = {
                    string = strings[i],
                }
            end
            local cry_badge = {
                n = G.UIT.R,
                config = { align = "cm" },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = {
                            align = "cm",
                            colour = HEX("235bb0"),
                            r = 0.1,
                            minw = 2 / min_scale_fac,
                            minh = 0.36,
                            emboss = 0.05,
                            padding = 0.03 * 0.9,
                        },
                        nodes = {
                            { n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
                            {
                                n = G.UIT.O,
                                config = {
                                    object = DynaText({
                                        string = ct or "ERROR",
                                        colours = { obj.ark_credits and obj.asc_credits.text_colour or G.C.WHITE },
                                        silent = true,
                                        float = true,
                                        shadow = true,
                                        offset_y = -0.03,
                                        spacing = 1,
                                        scale = 0.33 * 0.9,
                                    }),
                                },
                            },
                            { n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
                        },
                    },
                },
            }
            local function eq_col(x, y)
                for _ = 1, 4 do
                    if x[1] ~= y[1] then
                        return false
                    end
                end
                return true
            end
            for i = 1, #badges do
                if eq_col(badges[i].nodes[1].config.colour, HEX("235bb0")) then
                    badges[i].nodes[1].nodes[2].config.object:remove()
                    badges[i] = cry_badge
                    break
                end
            end
        end
    end
end
