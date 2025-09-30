return {
    descriptions = {
        Mod = {
            Arklatro = {
                name = "Arklatro",
                text = {
                    "Arknights X Balatro.",
                    " ",
                    "Artists:",
                },
            },
        },

        ---@type {[string]: { name: string|string[], text: string[]|string[][] }}
        Joker = {
            j_ark_guldul_silence = {
                name = "Gul'dul's Silence",
                text = {
                    "{X:attention,C:white}X#1#{} {C:attention}Blind size{}",
                    "Earn an extra {C:money}$#2#{} at the end of round",
                },
            },

            j_ark_golden_chalice = {
                name = "Golden Chalice",
                text = {
                    "Retrigger played cards {C:attention}once{}",
                    "for every {C:money}$#1#{} you have",
                    "{C:inactive}(Up to{} {C:attention}#2#{} retriggers){}",
                    "{C:inactive}(Currently {C:attention}#3#{} {C:inactive} #4#){}",
                },
            },
        },

        Enhanced = {
            m_ark_originium = {
                name = "Originium Card",
                text = {
                    {
                        "{X:mult,C:white}X#1#{} Mult",
                        "Self-destruct after being scored {C:attention}#2#{} #3#",
                        "and convert {C:attention}adjacent{} cards into {C:attention}Originium Cards{}",
                    },
                },
            },
        },
    },

    misc = {
        labels = {},

        dictionary = {},

        v_dictionary = {
            ark_art = { "Art: #1#" },
            ark_code = { "Code: #1#" },
            ark_idea = { "Idea: #1#" },
        },
    },
}
