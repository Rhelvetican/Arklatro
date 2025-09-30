SMODS.Enhancement({
    key = "originium",
    atlas = "enhancements",
    pos = { x = 0, y = 0 },

    config = { extra = { scored_left = 3, xmult = 2 } },

    loc_vars = function(_, _, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.scored_left,
                card.ability.extra.scored_left == 1 and "time" or "times",
            },
        }
    end,

    calculate = function(_, card, ctx)
        if ctx.after and card.ability.extra.scored_left < 1 then
            local turn = {}

            for i, other in ipairs(ctx.full_hand) do
                if other == card then
                    turn[#turn + 1] = i - 1
                    turn[#turn + 1] = i + 1
                end
            end

            SMODS.destroy_cards(card)

            for _, i in ipairs(turn) do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local card = ctx.full_hand[i]

                        if card then
                            card:flip()
                            card:juice_up(0.3, 0.5)
                            card:set_ability(G.P_CENTERS.m_ark_originium)
                            card:flip()
                            card:juice_up(0.3, 0.5)
                        end

                        return true
                    end,
                }))
            end
        end

        if ctx.cardarea == G.play and ctx.main_scoring then
            card.ability.extra.scored_left = math.min(card.ability.extra.scored_left - 1, 0)
            return { xmult = card.ability.extra.xmult }
        end
    end,
})
