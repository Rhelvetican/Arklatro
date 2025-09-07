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

        Joker = {
            j_ark_originium = {
                name = "Originium Joker",
                text = {
                    "{C:chips}+#1#{} Chips for every {C:attention}Originium Card{} in deck",
                    "{C:inactive}(Currently {C:chips}+#2#{} {C:inactive}Chips){}",
                },
            },

            j_ark_coin = {
                name = "Antique Coin",
                text = {
                    "Gain {C:money}$#1#{} when {C:attention}sold{}",
                },
            },

            j_ark_vanilla_soda = {
                name = "Vanilla Soda",
                text = {
                    "Upgrade level of {C:attention}played hand{} by {C:attention}#1#{}",
                    "Reduces by {C:red}#2#{} per hand played",
                },
            },

            j_ark_commandments = {
                name = "Chivalric Commandments",
                text = {
                    "Gain {X:mult,C:white}X#1#{} whenever an {C:attention}Originium Card{}",
                    "is {C:attention}destroyed{}",
                },
            },

            j_ark_ceobe = {
                name = "Ceobe",
                text = {
                    "When a {C:attention}Boss Blind{} is {C:attention}defeated{}",
                    "gain {X:mult,C:white}XMult{} equal to {C:attention}blind size's{}",
                    "rounded down standard logarithm",
                    "{C:inactive,s:0.75}(Up to{} {X:mult,C:white,s:0.75}X#2#{} {C:inactive,s:0.75}Mult can be gained at once){}",
                    "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}",
                },
            },
        },

        Enhanced = {
            m_ark_originium = {
                name = "Originium Card",
                text = {
                    {
                        "{X:mult,C:white}X#1#{} Mult",
                        "Self-destructing after being scored {C:attention}#2#{} #3#",
                        "and convert {C:attention}adjacent{} cards into {C:attention}Originium Cards{}",
                    },
                },
            },
        },
    },

    misc = {
        dictionary = {},
        v_dictionary = {
            arl_art = { "Art: #1#" },
            arl_code = { "Code: #1#" },
            arl_idea = { "Idea: #1#" },
        },
    },
}
