SMODS.Enhancement({
    key = "originium",
    atlas = "enhancements",
    pos = { x = 0, y = 0 },

    config = { extra = { round_left = 5, xmult = 1.1 } },

    ark_credits = {
        art = { "Lil Mr. Slipstream" },
        coding = { "Rhelvatican" },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {},
        }
    end,
})
