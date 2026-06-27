core.register_craftitem("opw_events:motillusion", {
    description = "Motillusion Crystal\n" .. core.colorize("#84bac1ff", "By Moti"),
    inventory_image = "motillusion_crystal.png"
})

core.register_node("opw_events:stone_with_motillusion", {
    description = "Motillusion Ore",
    tiles = { "default_stone.png^mineral_motillusion.png" },
    groups = {cracky = 1, level = 3},
    drop = "opw_events:motillusion"
})

core.register_node("opw_events:stone_with_motillusion_dense", {
    description = "Dense Motillusion Ore",
    tiles = {"default_stone.png^mineral_motillusion_dense.png"},
    groups = {cracky = 4, level = 3},
    drop = {
        max_items = 3,
        items = {
            {
                rarity = 1,
                items = {"opw_events:motillusion"}
            },
            {
                rarity = 2,
                items = {"opw_events:motillusion"}
            },
            {
                rarity = 3,
                items = {"opw_events:motillusion"}
            },
        }
    }
})

core.register_tool("opw_events:pick_motillusion", {
	description = "Motillusion Pickaxe",
	inventory_image = "pick_motillusion.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=4,
		groupcaps={
			cracky = {times={[4] = 4.0, [1]=1.6, [2]=0.8, [3]=0.4}, uses=60, maxlevel=4},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

core.register_tool("opw_events:sword_motillusion", {
	description = "Motillusion Sword",
	inventory_image = "sword_motillusion.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.6, [2]=0.7, [3]=0.18}, uses=80, maxlevel=3},
		},
		damage_groups = {fleshy=10},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

core.register_tool("opw_events:shovel_motillusion", {
	description = "Motillusion Shovel",
	inventory_image = "shovel_motillusion.png",
	wield_image = "shovel_motillusion.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=0.9, [2]=0450, [3]=0.22}, uses=60, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

core.register_tool("opw_events:axe_motillusion", {
	description = "Motillusion Axe",
	inventory_image = "axe_motillusion.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.7, [2]=0.70, [3]=0.40}, uses=60, maxlevel=3},
		},
		damage_groups = {fleshy=11},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

core.register_tool("opw_events:multitool_motillusion", {
	description = "Motillusion Multitool",
	inventory_image = "multitool_motillusion.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=4,
		groupcaps={
			choppy={times={[1]=1.7, [2]=0.70, [3]=0.40}, uses=249, maxlevel=3},
			crumbly = {times={[1]=0.9, [2]=0450, [3]=0.22}, uses=240, maxlevel=3},
			snappy={times={[1]=1.6, [2]=0.7, [3]=0.18}, uses=240, maxlevel=3},
			cracky = {times={[4] = 4.0, [1]=1.6, [2]=0.8, [3]=0.4}, uses=240, maxlevel=4},
		},
		damage_groups = {fleshy=10},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

core.register_node("opw_events:block_motillusion", {
	description = "Motillusion Block",
	tiles = {"block_motillusion.png"},
	is_ground_content = false,
	groups = {cracky = 4, level = 3},
	sounds = default.node_sound_glass_defaults(),
})

stairs.register_all("motillusion_block", "opw_events:block_motillusion", {cracky = 4, level = 3}, {"block_motillusion.png"}, "Motillusion", default.node_sound_glass_defaults(), true)

