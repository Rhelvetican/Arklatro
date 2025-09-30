SMODS.Joker({
    key = "guldul_silence",
    atlas = "jokers",

    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 4,

    config = {
        extra = {
            blind_size = 2.5,
            money = 5,
        },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.blind_size,
                card.ability.extra.money,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.setting_blind then
            modify_blind_size(get_blind_size() * card.ability.extra.blind_size)

            return {
                message = "Cursed!",
            }
        end
    end,

    calc_dollar_bonus = function(_, card)
        return card.ability.extra.money
    end,
})
