SMODS.Joker({
    key = "originium",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    rarity = 1,

    config = { extra = { chips = 10 } },

    loc_vars = function(_, info_queue, card)
        table.insert(info_queue, { key = "m_ark_originium", set = "Enhanced" })
    end,

    ark_credits = {},
})
