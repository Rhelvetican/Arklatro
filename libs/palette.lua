---@class Colour
---@field key string
---@field hex string
---@overload fun(self: Colour): Colour
Arklatro.Colour = setmetatable({}, {
    ---@param self Colour
    __call = function(_, self)
        ---@diagnostic disable-next-line: undefined-global
        loc_colour()
        G.ARGS.LOC_COLOURS[self.key] = HEX(self.hex)

        return self
    end,
})

Arklatro.Colour({
    key = "originium",
    hex = "000000",
})
