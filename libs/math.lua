---@diagnostic disable: assign-type-mismatch
---@diagnostic disable-next-line: undefined-global
if not Talisman then
    Arklatro.Math = math
    return
end

---@alias Num table|number|integer
Arklatro.Math = {}

---@param n Num
---@return boolean
function Arklatro.Math.isBigNum(n)
    if type(n) == "table" then
        local meta = getmetatable(n)
        ---@diagnostic disable-next-line: undefined-global
        return meta == OmegaMeta or meta == BigMeta
    end

    return false
end

---@param n Num
---@return Num
function Arklatro.Math.abs(n)
    if Arklatro.Math.isBigNum(n) then
        return n:abs()
    end

    return math.abs(n)
end

---@param a Num
---@param b Num
---@return Num
function Arklatro.Math.add(a, b)
    if Arklatro.Math.isBigNum(a) or Arklatro.Math.isBigNum(b) then
        return Big:ensureBig(a):add(Big:ensureBig(b))
    end

    return a + b
end

---@param a Num
---@param b Num
---@return Num
function Arklatro.Math.sub(a, b)
    if Arklatro.Math.isBigNum(a) or Arklatro.Math.isBigNum(b) then
        return Big:ensureBig(a):sub(Big:ensureBig(b))
    end

    return a - b
end

---@param a Num
---@param b Num
---@return Num
function Arklatro.Math.mul(a, b)
    if Arklatro.Math.isBigNum(a) or Arklatro.Math.isBigNum(b) then
        return Big:ensureBig(a):mul(Big:ensureBig(b))
    end

    return a * b
end

---@param a Num
---@param b Num
---@return Num
function Arklatro.Math.div(a, b)
    if Arklatro.Math.isBigNum(a) or Arklatro.Math.isBigNum(b) then
        return Big:ensureBig(a):div(Big:ensureBig(b))
    end

    return a / b
end

---@param n Num
---@return Num
function Arklatro.Math.log10(n)
    if Arklatro.Math.isBigNum(n) then
        return n:log10()
    end

    return math.log10(n)
end

---@param n Num
---@return Num
function Arklatro.Math.ln(n)
    if Arklatro.Math.isBigNum(n) then
        return n:ln()
    end

    return math.log(n)
end

---@param n Num
---@param base Num
---@return Num
function Arklatro.Math.log(n, base)
    if Arklatro.Math.isBigNum(n) or Arklatro.Math.isBigNum(base) then
        return Big:ensureBig(n):logBase(Big:ensureBig(base))
    end

    return math.log(n, base)
end

---@param n Num
---@return Num
function Arklatro.Math.ceil(n)
    if Arklatro.Math.isBigNum(n) then
        return n:ceil()
    end

    return math.ceil(n)
end

---@param n Num
---@return Num
function Arklatro.Math.floor(n)
    if Arklatro.Math.isBigNum(n) then
        return n:floor()
    end

    return math.floor(n)
end
