local mythic_gradient = SMODS.Gradient({
    key = "mythic_gradient",
    cycle = 6,
    colours = {
        HEX("FF3434"),
        HEX("F7FF5E"),
        HEX("52FFAE"),
        HEX("8046FF"),
    },
})

SMODS.Rarity({
    key = "mythic",
    pools = { ["Joker"] = { weight = 0 } },
    badge_colour = mythic_gradient,
})

SMODS.Joker({
    key = "wisadel",
    atlas = "jokers",

    pos = { x = 0, y = 3 },
    soul_pos = { x = 1, y = 3 },
    rarity = "ark_mythic",
    cost = 1e300,

    config = {
        immutable = { size = 1, chips = 1e50, xmult = 1e150 },
    },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.immutable.size,
                card.ability.immutable.xmult,
                card.ability.immutable.chips,
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.setting_blind then
            if ctx.blind.boss then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.blind:disable()
                                play_sound("timpani")
                                delay(0.4)
                                return true
                            end,
                        }))
                        SMODS.calculate_effect({ message = localize("ph_boss_disabled") }, card)
                        return true
                    end,
                }))
            end

            modify_blind_size(card.ability.immutable.size)
            return {
                message = "Explosive Dawn!",
            }
        end

        if ctx.before and ctx.main_eval then
            modify_blind_size(card.ability.immutable.size)
        end

        if ctx.individual and ctx.cardarea == G.play then
            modify_blind_size(card.ability.immutable.size)
            return { chip = card.ability.immutable.chips }
        end

        if ctx.joker_main then
            modify_blind_size(card.ability.immutable.size)
            return { xmult = card.ability.immutable.xmult }
        end
    end,

    add_to_deck = function(_, card, _)
        if G.GAME.blind then
            if G.GAME.blind.boss and not G.GAME.blind.disabled then
                G.GAME.blind:disable()
                play_sound("timpani")
                SMODS.calculate_effect({ message = localize("ph_boss_disabled") }, card)
            end

            modify_blind_size(card.ability.immutable.size)
        end
    end,
})
