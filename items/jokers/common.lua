local function count_orig()
    local orig = 0

    if G and G.deck and G.deck.cards then
        for _, card in ipairs(G.deck.cards) do
            if SMODS.has_enhancement(card, "m_ark_originium") then
                orig = orig + 1
            end
        end
    end

    return orig
end

SMODS.Joker({
    key = "originium",
    atlas = "jokers",

    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 2,

    config = { extra = { chips = 5 } },

    loc_vars = function(_, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_ark_originium
        local orig = count_orig()

        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.chips * orig,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.joker_main then
            local orig = count_orig()
            return { chips = orig * card.ability.extra.chips }
        end
    end,
})

SMODS.Joker({
    key = "coin",
    atlas = "jokers",

    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 0,

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

SMODS.Joker({
    key = "vanilla_soda",
    atlas = "jokers",

    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 3,

    config = { extra = { level = 2, level_mod = 1 } },

    loc_vars = function(_, _, card)
        return {
            vars = { card.ability.extra.level, card.ability.extra.level_mod },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.joker_main then
            return { level_up = card.ability.extra.level }
        end

        if ctx.after and not ctx.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "level",
                scalar_value = "level_mod",
                operation = "-",

                scaling_message = {
                    message = "-" .. card.ability.extra.level_mod .. " level",
                    colour = G.C.DARK_EDITION,
                },
            })

            if card.ability.extra.level < 1 then
                SMODS.destroy_cards(card)
            end
        end
    end,
})
