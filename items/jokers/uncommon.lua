SMODS.Joker({
    key = "kettle",
    atlas = "jokers",

    pos = { x = 0, y = 1 },
    rarity = 2,
    cost = 6,

    config = {
        extra = {
            xmult = 2.5,
            req = 6,
            needed = 6,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.req,
                card.ability.extra.needed,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.discard and not ctx.blueprint and ctx.other_card:is_suit("Clubs") and card.ability.extra.needed > 0 then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "needed",

                scalar_value = "inc",
                scalar_table = { inc = 1 },

                operation = "-",

                no_message = true,
            })
        end

        if ctx.joker_main and card.ability.extra.needed <= 0 then
            return { xmult = card.ability.extra.xmult }
        end

        if ctx.end_of_round and ctx.main_eval then
            card.ability.extra.needed = card.ability.extra.req
            return {
                message = "Reset!",
            }
        end
    end,
})

SMODS.Joker({
    key = "silver",
    atlas = "jokers",

    pos = { x = 0, y = 1 },
    rarity = 2,
    cost = 6,

    config = { extra = { xmult = 1.5 } },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.xmult,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.joker_main then
            return { xmult = card.ability.extra.xmult }
        end
    end,
})
