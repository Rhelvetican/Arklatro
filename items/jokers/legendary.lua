SMODS.Joker({
    key = "ceobe",
    atlas = "jokers",

    pos = { x = 0, y = 3 },
    soul_pos = { x = 1, y = 3 },
    rarity = 4,
    cost = 20,

    config = {
        extra = { xmult = 1, size = 0 },
        immutable = { xmult_cap = 6 },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.immutable.xmult_cap,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.joker_main then
            return { xmult = card.ability.extra.xmult }
        end

        if ctx.setting_blind and G.GAME.blind:get_type() == "Boss" then
            card.ability.extra.size = G.GAME.blind.chips
        end

        if ctx.end_of_round and ctx.beat_boss and ctx.main_eval then
            local msg = SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "gain",
                scalar_table = { gain = math.min(math.floor(math.log10(card.ability.extra.size)), card.ability.immutable.xmult_cap) },
            })

            card.ability.extra.size = 0

            return msg
        end
    end,
})
