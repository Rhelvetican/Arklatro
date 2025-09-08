SMODS.Joker({
    key = "kettle",
    atlas = "jokers",

    pos = { x = 0, y = 1 },
    rarity = 2,
    cost = 6,

    config = { extra = { dollars = 6 } },

    loc_vars = function(_, _, card)
        return {
            vars = { card.ability.extra.dollars },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.selling_self then
            ease_dollars(card.ability.extra.dollars)
        end
    end,
})
