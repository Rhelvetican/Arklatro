SMODS.Joker({
    key = "",
    atlas = "jokers",

    pos = { x = 0, y = 3 },
    soul_pos = { x = 1, y = 3 },
    rarity = 4,
    cost = 20,

    config = { extra = {} },

    loc_vars = function(_, _, card)
        return {
            vars = {},
        }
    end,

    calculate = function(_, card, ctx) end,
})
