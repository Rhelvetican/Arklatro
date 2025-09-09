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

            j_ark_kettle = {
                name = "Water Kettle",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if {C:attention}#2#{} {C:inactive}[#3#]{}",
                    "cards with {C:clubs}Clubs{} suit were {C:attention}discarded{} this round.",
                },
            },

            j_ark_silver = {
                name = "Silver Forks",
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                },
            },

            j_ark_commandments = {
                name = "Chivalric Commandments",
                text = {
                    "Gain {X:mult,C:white}X#1#{} whenever an {C:attention}Originium Card{}",
                    "is {C:attention}destroyed{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
                },
            },

            j_ark_profound = {
                name = "Profound Silence",
                text = {
                    "Reduces blind size by {C:attention}#1#%{}",
                },
            },

            j_ark_lament = {
                name = "Brilliant Lament",
                text = {
                    "Each card also gives {X:mult,C:white}X#1#{} Mult when {C:attention}scored{}",
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

            j_ark_wisadel = {
                name = "Wis'adel",
                text = {
                    {
                        "When a {C:attention}Blind{} is selected",
                        "set blind size to {C:attention}#1#{}",
                    },
                    {
                        "Disables effect of every {C:attention}Boss Blind{}",
                    },
                    {
                        "{X:mult,C:white}X#2#{} Mult",
                        "All scored cards give {C:chips}+#3#{} Chips",
                    },
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
        labels = {
            k_ark_mythic = "Mythic",
        },

        dictionary = {
            k_ark_mythic = "Mythic",
        },

        v_dictionary = {
            arl_art = { "Art: #1#" },
            arl_code = { "Code: #1#" },
            arl_idea = { "Idea: #1#" },
        },
    },
}
