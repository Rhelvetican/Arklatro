if not Arklatro then
    Arklatro = {}
end

---@param path string
function Arklatro.loadFile(path)
    local val, err = SMODS.load_file(path)
    if err == nil and val ~= nil then
        val()
    end
end

---@param dir string
function Arklatro.recursiveLoad(dir)
    for _, entr in ipairs(NFS.getDirectoryItemsInfo(dir)) do
        if entr.type == "directory" then
            Arklatro.recursiveLoad(dir .. "/" .. entr.name)
        elseif entr.type == "file" then
            Arklatro.loadFile(dir .. "/" .. entr.name)
        end
    end
end

Arklatro.recursiveLoad("libs")
Arklatro.recursiveLoad("items")
