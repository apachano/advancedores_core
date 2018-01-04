function advancedores_add_ore(ore)


--Create items

	minetest.register_node("advancedores_" .. ore.name .. ":stone_with_" .. ore.name .. "_ore", {
		description = ore.name .. "ore",
		tiles = {"default_stone.png^" .. ore.resources .. "/ore.png"},
		is_ground_content = true,
		groups = {cracky=2},
		drop = 'advancedores_" .. ore.name .. ":' .. ore.name,
		sounds = default.node_sound_stone_defaults(),
	})
	minetest.register_craftitem("advancedores_" .. ore.name .. ":" .. ore.name .. "_ore", {
		description = ore.name .. "_lump",
		inventory_image = ore.resources .. "/lump.png",
	})
	minetest.register_craftitem("advancedores_" .. ore.name .. ":" .. ore.name .. "_ingot", {
		description = ore.name .. "_ingot",
		inventory_image = ore.resources .. "/ingot.png",
	})
	minetest.register_craft({
		type = "cooking",
		output = "advancedores_" .. ore.name .. ":" .. ore.name .. "_ingot",
		recipe = "advancedores_" .. ore.name .. ":" .. ore.name .. "_lump",
	})

--Register ore for spawning

	ore.spawn.ore = "advancedores_" .. ore.name .. ":" .. ore.name

	minetest.register_ore(ore.spawn)

--[[
--Check for extention mods existance and if ore files call for them

	if minetest.get_modpath("advancedores_extended") then
		if ore.extended then
			--Call function for extended items and pass information		
		end
	end

	if minetest.get_modpath("advancedores_tools") then
		if ore.tools then
			--Call function for extended items and pass information		
		end
	end
]]--

end