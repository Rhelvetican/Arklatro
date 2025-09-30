SMODS.Joker({
    key = "",
    atlas = "jokers",

    pos = { x = 0, y = 1 },
    rarity = 2,
    cost = 6,

    config = {
        extra = {},
    },

    loc_vars = function(_, _, card)
        return {
            vars = {},
        }
    end,

    calculate = function(_, card, ctx) end,
})
