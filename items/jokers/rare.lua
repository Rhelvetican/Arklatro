SMODS.Joker({
    key = "commandments",
    atlas = "jokers",
    pos = { x = 0, y = 2 },

    rarity = 3,
    config = { extra = { xmult = 1, xmult_mod = 0.25 } },

    loc_vars = function(_, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_ark_originium

        return {
            vars = {
                card.ability.extra.xmult_mod,
                card.ability.extra.xmult,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.joker_main and card.ability.extra.xmult > 1 then
            return { xmult = card.ability.extra.xmult }
        end

        if ctx.remove_playing_cards then
            local count = 0

            for _, other in ipairs(ctx.removed or {}) do
                if SMODS.has_enhancement(other, "m_ark_originium") then
                    count = count + 1
                end
            end

            return SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_mod",

                operation = function(ref_table, ref_value, initial, change)
                    ref_table[ref_value] = initial + (count * change)
                end,
            })
        end
    end,
})
