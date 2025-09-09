---@param new_value number|table
function modify_blind_size(new_value)
    G.GAME.blind.chips = new_value
    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    G.HUD_blind:recalculate()
end

---@return number|table
function get_blind_size()
    return G.GAME.blind.chips
end
