local mods_to_disable = {
    "rangedweapons",
    "vehicles",
}

local function has_value(table, element)
    for _, value in ipairs(table) do
        if element == value then return true end
    end
    return false
end

for node_id, def in pairs(minetest.registered_items) do
    local mod_name, node_name = node_id:match("^([^:]+):([^:]+)$")
    if has_value(mods_to_disable, mod_name) then
        minetest.log("warning", ("[crafting_disabler] removing recipe for %q"):format(node_id))
        minetest.clear_craft({output=node_id})
    end
end
