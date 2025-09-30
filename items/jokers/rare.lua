SMODS.Joker({
    key = "golden_chalice",
    atlas = "jokers",
    pos = { x = 0, y = 2 },

    rarity = 3,
    config = {
        extra = {
            retrigger_cost = 20,
        },

        immutable = {
            max_retrigger = 120,
        },
    },
    cost = 10,

    loc_vars = function(_, _, card)
        local retrigger = math.min(math.floor(get_cash() / card.ability.extra.retrigger_cost), card.ability.immutable.max_retrigger)

        return {
            vars = {
                card.ability.extra.retrigger_cost,
                card.ability.immutable.max_retrigger,
                retrigger,
                (retrigger == 1) and "retrigger" or "retriggers",
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.repetition and ctx.cardarea == G.play then
            local retrigger = math.min(math.floor(get_cash() / card.ability.extra.retrigger_cost), card.ability.immutable.max_retrigger)

            if retrigger > 0 then
                return {
                    repetitions = retrigger,
                }
            end
        end
    end,
})
