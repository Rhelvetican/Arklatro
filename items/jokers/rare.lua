SMODS.Joker({
    key = "commandments",
    atlas = "jokers",
    pos = { x = 0, y = 2 },

    rarity = 3,
    config = { extra = { xmult = 1, xmult_mod = 0.1 } },
    cost = 10,

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

SMODS.Joker({
    key = "profound",
    atlas = "jokers",
    pos = { x = 0, y = 2 },

    rarity = 3,
    config = { extra = { reduce = 20 } },
    cost = 12,

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.reduce,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.setting_blind then
            local new_blind_size = get_blind_size() * math.max(0, (1 - (card.ability.extra.reduce / 100)))
            modify_blind_size(new_blind_size)

            return {
                message = "Weakened!",
            }
        end
    end,
})

SMODS.Joker({
    key = "lament",
    atlas = "jokers",
    pos = { x = 0, y = 2 },

    rarity = 3,
    config = { extra = { xmult = 1.2 } },
    cost = 14,

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.xmult,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.individual and ctx.cardarea == G.play then
            return { xmult = card.ability.extra.xmult }
        end
    end,
})
