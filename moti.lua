opw_events.moti = {}
--CRAFTITEMS
core.register_craftitem("opw_events:motillusion", {
    description = "Motillusion Crystal\n" .. core.colorize("#84bac1ff", "By Moti"),
    inventory_image = "motillusion_crystal.png",
    groups = {moti = 1}
})

core.register_craftitem("opw_events:battery_motillusion", {
    description = "Motillusion Battery",
    inventory_image = "battery_motillusion.png",
    on_use = function(itemstack, user)
        if not user or not user.is_player or not user:is_player() then
            return
        end        
        local inv = user:get_inventory()
        local found = false
        local slot = 1
        local size = inv:get_size("main")        
        while not found and slot <= size do
            local item = inv:get_stack("main", slot)
            if item:get_name() == "opw_events:staff_motillusion" then
                local wear = item:get_wear()                
                if wear > 0 then
                    item:set_wear(0)
                    inv:set_stack("main", slot, item)
                    found = true
                end
            end
            slot = slot + 1 
        end
        if found then
            itemstack:take_item(1)
            return itemstack
        end
    end,
    groups = {moti = 1}
})


--NODES
core.register_node("opw_events:block_motillusion", {
	description = "Motillusion Block",
	tiles = {"block_motillusion.png"},
	is_ground_content = false,
	groups = {cracky = 4, level = 3, moti = 1},
	sounds = default.node_sound_glass_defaults(),
    light_source = 14
})

core.register_node("opw_events:stone_with_motillusion", {
    description = "Motillusion Ore",
    tiles = { "default_stone.png^mineral_motillusion.png" },
    groups = {cracky = 1, level = 3, moti = 1},
    drop = "opw_events:motillusion",
    light_source = 9
})

core.register_node("opw_events:motillusion_ghostblock", {
    description = "Ghost Block",
    drawtype = "allfaces", 
    tiles = {"ghostblock_motillusion.png"},
    use_texture_alpha = "blend",
    buildable_to = true,
    drop = "",
    walkable = false,
    groups = {oddly_breakable_by_hand = 3, not_in_creative_inventory = 1, moti = 1},
    paramtype = "light"
})

core.register_node("opw_events:motillusion_ghostblock_placable", {
    description = "Ghost Block (not replaced when placed on)",
    drawtype = "allfaces", 
    tiles = {"ghostblock_motillusion.png"},
    use_texture_alpha = "blend",
    drop = "",
    walkable = false,
    groups = {oddly_breakable_by_hand = 3, not_in_creative_inventory = 1, moti = 1},
    paramtype = "light"
})

core.register_node("opw_events:motillusion_ghostblock_unpointable", {
    description = "Ghost Block (Unpointable)",
    drawtype = "allfaces", 
    tiles = {"ghostblock_motillusion.png^[colorize:#c2c2c2:155"},
    use_texture_alpha = "blend",
    drop = "",
    walkable = false,
    groups = {oddly_breakable_by_hand = 3, not_in_creative_inventory = 1, moti = 1},
    paramtype = "light",
    pointable = false,
    buildable_to = true,
    on_construct = function(pos)
        local timer = core.get_node_timer(pos)
        timer:start(10)
    end,
    on_timer = function(pos)
        core.set_node(pos, {name = "air"})
    end
})
core.register_node("opw_events:motillusion_ghostblock_unpointable_permanent", {
    description = "Ghost Block (Unpointable)",
    drawtype = "allfaces", 
    tiles = {"ghostblock_motillusion.png"},
    use_texture_alpha = "blend",
    drop = "",
    walkable = false,
    groups = {oddly_breakable_by_hand = 3, not_in_creative_inventory = 1, moti = 1},
    paramtype = "light",
    pointable = false,
    buildable_to = true,
})

core.register_node("opw_events:motillusion_glass", {
    description = "Motillusion Glass",
    drawtype = "glasslike_framed", 
    tiles = {"block_motillusion.png", "glass_motillusion.png"},
    use_texture_alpha = "blend",
    groups = {oddly_breakable_by_hand = 1, moti = 1},
    paramtype = "light"
})

core.register_node("opw_events:stone_with_motillusion_dense", {
    description = "Dense Motillusion Ore",
    tiles = {"default_stone.png^mineral_motillusion_dense.png"},
    groups = {cracky = 4, level = 3, moti = 1},
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
    },
    light_source = 12
})
--TOOLS
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
	groups = {pickaxe = 1, moti = 1}
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
	groups = {sword = 1, moti = 1}
})

core.register_tool("opw_events:shovel_motillusion", {
	description = "Motillusion Shovel",
	inventory_image = "shovel_motillusion.png",
	wield_image = "shovel_motillusion.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=0.9, [2]=0.450, [3]=0.22}, uses=60, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1, moti = 1}
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
	groups = {axe = 1, moti = 1}
})

core.register_tool("opw_events:multitool_motillusion", {
	description = "Motillusion Multitool",
	inventory_image = "multitool_motillusion.png",
    range = 6.0,
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=4,
		groupcaps={
			choppy={times={[1]=1.7, [2]=0.70, [3]=0.40}, uses=249, maxlevel=3},
			crumbly = {times={[1]=0.9, [2]=0.450, [3]=0.22}, uses=240, maxlevel=3},
			snappy={times={[1]=1.6, [2]=0.7, [3]=0.18}, uses=240, maxlevel=3},
			cracky = {times={[4] = 4.0, [1]=1.6, [2]=0.8, [3]=0.4}, uses=240, maxlevel=4},
		},
		damage_groups = {fleshy=10},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1, moti = 1}
})

--STAIRS
stairs.register_all("motillusion_block", "opw_events:block_motillusion", {cracky = 4, level = 3}, {"block_motillusion.png"}, "Motillusion", default.node_sound_glass_defaults(), true)

--RECIPES
local mat = "opw_events:motillusion"
local rod = "basic_materials:steel_bar"

core.register_craft({
    output = "opw_events:block_motillusion",
    type = "shapeless",
    recipe = {mat, mat, mat, mat, mat, mat, mat, mat, mat}
})

core.register_craft({
    output = mat .. " 9",
    type = "shapeless",
    recipe = {"opw_events:block_motillusion"}
})

core.register_craft({
    output = "opw_events:pick_motillusion",
    recipe = {
        {mat, mat, mat},
        {"", rod, ""},
        {"", rod, ""}
    }
})

core.register_craft({
    output = "opw_events:sword_motillusion",
    recipe = {
        {"", mat, ""},
        {"", mat, ""},
        {"", rod, ""}
    }
})

core.register_craft({
    output = "opw_events:shovel_motillusion",
    recipe = {
        {"", mat, ""},
        {"", rod, ""},
        {"", rod, ""}
    }
})

core.register_craft({
    output = "opw_events:axe_motillusion",
    recipe = {
        {mat, mat, ""},
        {mat, rod, ""},
        {"", rod, ""}
    }
})

if core.get_modpath("technic") then
    core.register_craft({
        output = "opw_events:battery_motillusion",
        recipe = {
            {"opw_events:motillusion", "technic:sulfur_block", "opw_events:motillusion"},
            {"birthstones:amethyst", "opw_events:block_motillusion", "birthstones:amethyst"},
            {"opw_events:motillusion", "technic:sulfur_block", "opw_events:motillusion"}
        }
    })
    core.register_craft({
        output = "opw_events:battery_motillusion",
        recipe = {
            {"opw_events:motillusion", "lumpblocks:sulfur_block", "opw_events:motillusion"},
            {"birthstones:amethyst", "opw_events:block_motillusion", "birthstones:amethyst"},
            {"opw_events:motillusion", "technic:sulfur_block", "opw_events:motillusion"}
        }
    })
    
    core.register_craft({
        output = "opw_events:staff_motillusion",
        recipe = {
            {"replacer:replacer_technic", "opw_events:block_motillusion", "default:steelblock"},
            {"myblueprint:chalk", "opw_events:battery_motillusion", "opw_events:multitool_motillusion"},
            {"birthstones:rubyblock", "opw_events:battery_motillusion", "moreores:mithril_block"}
        }
    })
end

core.register_craft({
    output = "opw_events:multitool_motillusion",
    recipe = {
        {"", "opw_events:shovel_motillusion", "opw_events:pick_motillusion"},
        {"opw_events:block_motillusion", "opw_events:sword_motillusion", "opw_events:axe_motillusion"},
        {"default:steel_ingot", "opw_events:block_motillusion", ""}
    }
})
--OREGEN
core.register_ore({
	ore_type       = "scatter",
	ore            = "opw_events:stone_with_motillusion_dense",
	wherein        = "default:stone",
	clust_scarcity = 100000,
	clust_num_ores = 16,
	clust_size     = 4,
	y_max          = -400,
	y_min          = -3000,
})

core.register_ore({
	ore_type       = "scatter",
	ore            = "opw_events:stone_with_motillusion",
	wherein        = "default:stone",
	clust_scarcity = 60000,
	clust_num_ores = 3,
	clust_size     = 3,
	y_max          = -400,
	y_min          = -3000,
})

--ARMOR
--[[
if core.get_modpath("3d_armor") then

	armor:register_armor("opw_events:helmet_motillusion", {
		description = "Motillusion Helmet",
		inventory_image = "opw_events_inv_helmet_motillusion.png",
		groups = {armor_head=1, armor_heal=12, armor_use=200},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
	})


	armor:register_armor(":opw_events:chestplate_motillusion", {
		description = "Motillusion Chestplate",
		inventory_image = "opw_events_inv_chestplate_motillusion.png",
		groups = {armor_torso=1, armor_heal=12, armor_use=200},
		armor_groups = {fleshy=20},
		damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
	})

	armor:register_armor(":opw_events:leggings_motillusion", {
		description = "Motillusion Leggings",
		inventory_image = "opw_events_inv_leggings_motillusion.png",
		groups = {armor_legs=1, armor_heal=12, armor_use=200},
		armor_groups = {fleshy=20},
		damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
	})

	armor:register_armor(":opw_events:boots_motillusion", {
		description = "motillusion Boots",
		inventory_image = "opw_events_inv_boots_motillusion.png",
		groups = {armor_feet=1, armor_heal=12, armor_use=200},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
	})

	local m = "opw_events:motillusion_crystal"
    local s = "motillusion"

	core.register_craft({
		output = "opw_events:helmet_"..s,
		recipe = {
			{m, m, m},
			{m, "", m},
			{"", "", ""},
		},
	})
	core.register_craft({
		output = "opw_events:chestplate_"..s,
		recipe = {
			{m, "", m},
			{m, m, m},
			{m, m, m},
		},
	})
	core.register_craft({
		output = "opw_events:leggings_"..s,
		recipe = {
			{m, m, m},
			{m, "", m},
			{m, "", m},
		},
	})
	core.register_craft({
		output = "opw_events:boots_"..s,
		recipe = {
			{m, "", m},
			{m, "", m},
		},
	})
end
]]

--STAFF

local modes = {}
local modes_actions = {}

-- Gets the current mode, defaults to 1
local function get_mode(itemstack)
    local meta = itemstack:get_meta()
    local mode = meta:get_int("mode")
    return mode
end

-- Sets the mode
local function set_mode(itemstack, mode)
    local meta = itemstack:get_meta()
    meta:set_int("mode", mode)
    return itemstack
end

-- Cycles to the next mode
local function increment_mode(itemstack)
    local mode = get_mode(itemstack)
    if mode < #modes then
        mode = mode + 1
    else
        mode = 1
    end
    return set_mode(itemstack, mode)
end

-- Adds a builder mode
function opw_events.moti.add_builder_mode(name, functions)
    --needs a string
    if type(name) ~= "string" then
        error("[opw_events] Name of builder mode must be a string!")
    end
    --and cannot exist already
    if modes_actions[name] then
        error("[opw_events] Builder mode '" .. name .. "' already exists!")
    end

    functions = functions or {}

    table.insert(modes, name)

    local old_on_set = functions.on_set

    functions.on_set = function(itemstack, user, pointed_thing)
        if old_on_set then
            itemstack = old_on_set(itemstack, user, pointed_thing) or itemstack
        end
        if user and user:is_player() then
            core.chat_send_player(user:get_player_name(), "Mode set to: " .. name)
        end
        return itemstack
    end
    modes_actions[name] = functions
end
local safetoreplace = {
    ["opw_events:motillusion_ghostblock"] = true,
    ["air"] = true,
    ["opw_events:motillusion_ghostblock_unpointable"] = true,
    ["opw_events:motillusion_ghostblock_unpointable_permanent"] = true
}
--mode one:just place blocks like myblueprint chalk
opw_events.moti.add_builder_mode("Blueprint", {

    on_place = function(itemstack, placer, pointed_thing)
        if pointed_thing.type ~= "node" then
            return itemstack
        end
        local pos = pointed_thing.above
        local pname = placer and placer:get_player_name() or ""
        if core.is_protected(pos, pname) then return itemstack end
        local wear = itemstack:get_wear()
        if wear + 10 >= 65535 then return itemstack end
        core.set_node(pos, {name = "opw_events:motillusion_ghostblock"})
        itemstack:set_wear(wear + 10)
        return itemstack
    end,
})

--copy and paste
opw_events.moti.add_builder_mode("Copy and Paste", {
    --selecting the area
    on_use = function(itemstack, placer, pointed_thing)
        local playername = placer:get_player_name()
        --if its not a node, do nothing
        if pointed_thing.type ~= "node" then
            return itemstack
        end
        local meta = itemstack:get_meta()
        --get the step. step 0 = pos1, and step1 = pos2
        local step = meta:get_int("copy_and_paste_step")
        local pos = core.pos_to_string(pointed_thing.under)
        --if the step is 0
        if step == 0 then
            --save pos1
            meta:set_string("copy_and_paste_pos1", pos)
            meta:set_int("copy_and_paste_step", 1)
            --and say pos1 was set
            core.chat_send_player(playername, "Pos 1 set!")
        end
        --if the step is 1
        if step == 1 then
            --save pos2
            meta:set_string("copy_and_paste_pos2", pos)
            local pos1 = core.string_to_pos(meta:get_string("copy_and_paste_pos1"))
            local pos2 = pointed_thing.under
            local corner1 = {}
            local corner2 = {}
            --check if the area is too big
            if math.abs(pos1.x - pos2.x) > 8 or
               math.abs(pos1.y - pos2.y) > 8 or
               math.abs(pos1.z - pos2.z) > 8 then
                core.chat_send_player(playername, "Area is too big!")
                meta:set_int("copy_and_paste_step", 0)
                return itemstack
            end
            --modify the edges so vislib looks nice, and set up the corners
            for _, axis in ipairs({"x", "y", "z"}) do
                if pos1[axis] > pos2[axis] then
                    corner2[axis] = pos1[axis]
                    corner1[axis] = pos2[axis]
                    pos1[axis] = pos1[axis] + 0.5
                    pos2[axis] = pos2[axis] - 0.5
                else
                    corner2[axis] = pos2[axis]
                    corner1[axis] = pos1[axis]
                    pos2[axis] = pos2[axis] + 0.5
                    pos1[axis] = pos1[axis] - 0.5
                end
            end
            --this is the table where the schem will be saved
            local schem = {}
            --the size
            schem.dimensions = {
                x = corner2.x - corner1.x,
                y = corner2.y - corner1.y,
                z = corner2.z - corner1.z,
            }
            --where the nodes go
            schem.schem = {}
            local num = 1
            --put all the blocks in sequentially
            for x = corner1.x, corner2.x do
                for y = corner1.y, corner2.y do
                    for z = corner1.z, corner2.z do
                        local pos = {x = x, y = y, z = z}
                        local node = core.get_node(pos)
                        schem.schem[num] = {
                            name = node.name,
                            param2 = node.param2
                        }
                        num = num + 1
                    end
                end
            end
            --serialize data
            local copydata = core.serialize(schem)
            --store it
            --rip server logs after getting a 1000 entry table serialized into a items metadata
            meta:set_string("copy_and_paste_schem", copydata)
            --draw the area and make it last 30 seconds
            vizlib.draw_area(pos1, pos2, {
                expiry = core.get_us_time() + 30000000
            })
            --set the step back to 0
            meta:set_int("copy_and_paste_step", 0)
            --say pos 2 was set
            core.chat_send_player(playername, "Pos 2 set!")
        end

        return itemstack
    end,
    
    on_place = function(itemstack, placer, pointed_thing)

        local playername = placer:get_player_name()
        local meta = itemstack:get_meta()
        local copydata = meta:get_string("copy_and_paste_schem")
        local schem = core.deserialize(copydata)
        if not schem then return itemstack end
        local dimensions = schem.dimensions
        local corner1 = pointed_thing.above
        local num = 1
        local nodes_placed = 0

        local controls = placer:get_player_control()
        local inv = placer:get_inventory()
        local has_creative = core.check_player_privs(playername, {creative=true})
        local wear = itemstack:get_wear()
        for x = 0, dimensions.x do
            for y = 0, dimensions.y do
                for z = 0, dimensions.z do
                    local pos = {x = corner1.x + x, y = corner1.y +y, z = corner1.z + z}
                    local name = schem.schem[num].name or "air"
                    local param2 = schem.schem[num].param2 or 0
                    local current_node = core.get_node(pos)
                    local is_protected = core.is_protected(pos, playername)
                    local stackitem = ItemStack(name)
                    if (name ~= "air" and safetoreplace[current_node.name] and not is_protected) and wear + 10 < 65535 then
                        if controls.sneak then
                            if name == "opw_events:motillusion_ghostblock" or inv:remove_item("main", stackitem) == stackitem or has_creative then
                                core.set_node(pos, {name = name, param2 = param2})
                                nodes_placed = nodes_placed + 1
                                wear = wear + 10
                            end
                        else
                            core.set_node(pos, {name = "opw_events:motillusion_ghostblock_unpointable"})
                            nodes_placed = nodes_placed + 1
                        end
                    end
                    num = num + 1
                end
            end
        end
        core.chat_send_player(playername, "Pasted " .. nodes_placed .. " nodes!")
        itemstack:set_wear(wear)
        return itemstack
    end
})
--randomplace
opw_events.moti.add_builder_mode("Randomplace", {

    on_place = function(itemstack, placer, pointed_thing)
        local playername = placer:get_player_name()
        local has_creative = core.check_player_privs(playername, {creative=true})

        if pointed_thing.type ~= "node" then
            return itemstack
        end
        local pos = pointed_thing.above
        local pname = placer and placer:get_player_name() or ""
        if core.is_protected(pos, pname) then return itemstack end
        local wear = itemstack:get_wear()
        if wear + 10 >= 65535 then return itemstack end
        local inv = placer:get_inventory()
        local usablestacks = {}
        local has_usable_stack
        for i = 1, 8 do
            local stack = inv:get_stack("main", i)
            local itemname = stack:get_name()
            if core.registered_nodes[itemname] then
                table.insert(usablestacks, i)
                has_usable_stack = true
            end
        end
        if has_usable_stack then
            local randomnum = math.random(1, #usablestacks)
            local usablenum = usablestacks[randomnum]
            local stack = inv:get_stack("main", usablenum)

            if has_creative then
                core.item_place_node(stack, placer, pointed_thing)
            else 
                local takenstack = ItemStack(stack:get_name())
                if inv:remove_item("main", takenstack) == takenstack then
                    core.item_place_node(stack, placer, pointed_thing)
                end
            end
            itemstack:set_wear(wear + 10)
        end
        return itemstack
    end,
})
--fill
opw_events.moti.add_builder_mode("Fill", {
    on_use = function(itemstack, placer, pointed_thing)
        local playername = placer:get_player_name()
        --if its not a node, do nothing
        if pointed_thing.type ~= "node" then
            return itemstack
        end
        local meta = itemstack:get_meta()
        --get the step. step 0 = pos1, and step1 = pos2
        local step = meta:get_int("fill_step")
        local pos = core.pos_to_string(pointed_thing.under)
        --if the step is 0
        if step == 0 then
            --save pos1
            meta:set_string("fill_pos1", pos)
            meta:set_int("fill_step", 1)
            --and say pos1 was set
            core.chat_send_player(playername, "Pos 1 set!")
        elseif step == 1 then
            --and say pos2 was set
            core.chat_send_player(playername, "Pos 2 set!")
            local pos1 = core.string_to_pos(meta:get_string("fill_pos1"))
            local pos2 = pointed_thing.under
            --check if the area is too big
            if math.abs(pos1.x - pos2.x) > 8 or
               math.abs(pos1.y - pos2.y) > 8 or
               math.abs(pos1.z - pos2.z) > 8 then
                core.chat_send_player(playername, "Area is too big!")
                meta:set_string("fill_pos1", "")
                meta:set_int("fill_step", 0)
                return itemstack
            end
            --save pos2
            meta:set_string("fill_pos2", pos)
            --modify the edges so vislib looks nice
            for _, axis in ipairs({"x", "y", "z"}) do
                if pos1[axis] > pos2[axis] then
                    pos1[axis] = pos1[axis] + 0.5
                    pos2[axis] = pos2[axis] - 0.5
                else
                    pos2[axis] = pos2[axis] + 0.5
                    pos1[axis] = pos1[axis] - 0.5
                end
            end
            --draw the area and make it last 30 seconds
            vizlib.draw_area(pos1, pos2, {
                expiry = core.get_us_time() + 30000000
            })
            meta:set_int("fill_step", 0)
        end
        return itemstack
    end,
    on_place = function(itemstack, placer, pointed_thing)
        local meta = itemstack:get_meta()
        local pos1string = meta:get_string("fill_pos1")
        local pos2string = meta:get_string("fill_pos2")
        local playername = placer:get_player_name()
        local has_creative = core.check_player_privs(playername, {creative=true})
        local inv = placer:get_inventory()
        local nodename = inv:get_stack("main", 1):get_name()
        if not core.registered_nodes[nodename] then return itemstack end
        local node = ItemStack(nodename)

        local wear = itemstack:get_wear()
        if pos1string ~= "" and pos2string ~= "" then
            local pos1 = core.string_to_pos(pos1string)
            local pos2 = core.string_to_pos(pos2string)
            local corner1 = {}
            local corner2 = {}
            for _, axis in ipairs({"x", "y", "z"}) do
                if pos1[axis] > pos2[axis] then
                    corner2[axis] = pos1[axis]
                    corner1[axis] = pos2[axis]
                else
                    corner2[axis] = pos2[axis]
                    corner1[axis] = pos1[axis]
                end
            end
            for x = corner1.x, corner2.x do
                for y = corner1.y, corner2.y do
                    for z = corner1.z, corner2.z do
                        local pos = {x = x, y = y, z = z}
                        local is_protected = core.is_protected(pos, playername)
                        if not is_protected then
                            if wear + 10 < 65535 then
                                if safetoreplace[core.get_node(pos).name] then
                                    if has_creative or inv:remove_item("main", node) == node then
                                        core.set_node(pos, {name = nodename})
                                        wear = wear + 10
                                    end
                                end
                            end
                        end
                    end
                end
            end
            itemstack:set_wear(wear)
        else
            core.chat_send_player(playername, "Pos 1 or Pos 2 not set!")
        end
        return itemstack
    end



})
core.register_tool("opw_events:staff_motillusion", {
    description = "Builders Wand",
    inventory_image = "staff_motillusion.png",
    range = 8,
    light_source = 13,
    node_placement_prediction = "opw_events:motillusion_ghostblock_placable",
    groups = {moti = 1, not_repaired_by_anvil = 1, disable_repair = 1, },

    wear_represents = "motillusion_charge",

    on_secondary_use = function(itemstack, user, pointed_thing)
        if not user or not user.is_player or not user:is_player() then
            return itemstack
        end  
        itemstack = increment_mode(itemstack)
        local mode = get_mode(itemstack)
        local action = modes_actions[modes[mode]]
        if action then
            return action.on_set(itemstack, user, pointed_thing)
        end
        return itemstack
    end,

    on_place = function(itemstack, placer, pointed_thing)
        if not placer or not placer.is_player or not placer:is_player() then
            return itemstack
        end  
        local mode = get_mode(itemstack)
        local action = modes_actions[modes[mode]]
        if action and action.on_place then
            return action.on_place(itemstack, placer, pointed_thing)
        end
        return itemstack
    end,

    on_use = function(itemstack, user, pointed_thing)
        if not user or not user.is_player or not user:is_player() then
            return itemstack
        end  
        local mode = get_mode(itemstack)
        local action = modes_actions[modes[mode]]
        if action and action.on_use then
            return action.on_use(itemstack, user, pointed_thing)
        end
        return itemstack
    end,
})