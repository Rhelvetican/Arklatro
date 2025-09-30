---@param region? Card[]
---@param predicate? fun(card: Card): boolean
---@return integer
function count_card(region, predicate)
    local x = 0

    if region then
        for _, card in ipairs(region) do
            if not predicate or predicate(card) then
                x = x + 1
            end
        end
    end

    return x
end
