local bathtub_def = {{
	style = "modern",
	material = "stone",
	description = "Bathtub",
	visual_scale = 0.5,
	mesh = "multidecor_bathtub.b3d",
	tiles = {
		"multidecor_marble_material.png",
		"multidecor_metal_material.png",
		"multidecor_bathroom_leakage.png",
		"multidecor_coarse_metal_material.png"
	},
	bounding_boxes = {
		{-0.5, -0.5, -0.5, 1.5, -0.1, 0.5},
		{-0.5, -0.1, -0.35, -0.35, 0.5, 0.35},
		{1.35, -0.1, -0.35, 1.5, 0.5, 0.35},
		{-0.5, -0.1, -0.5, 1.5, 0.5, -0.35},
		{-0.5, -0.1, 0.35, 1.5, 0.5, 0.5}
	}
},
{
	seat_data = {
		pos = {x=0.8, y=0.2, z=0.0},
		rot = {x=0, y=0, z=0},
		model = multidecor.sitting.standard_model,
		anims = {"sit1", "sit2"}
	}
}}

multidecor.register.register_seat("bathtub", bathtub_def[1], bathtub_def[2])

local ceramic_tiles = {
	"darkceladon",
	"darksea",
	"light",
	"sand",
	"red",
	"green_mosaic"
}

for _, tile in ipairs(ceramic_tiles) do
	local name = "bathroom_ceramic_" .. tile .. "_tile"
	local tex_name = "multidecor_" .. name .. ".png"
	local upper_tile = multidecor.helpers.upper_first_letters(tile)
	minetest.register_node(":multidecor:" .. name, {
		description = "Bathroom Ceramic " .. upper_tile .. " Tile",
		visual_scale = 0.5,
		paramtype = "light",
		paramtype2 = "facedir",
		tiles = {tex_name},
		groups = {cracky=1.5},
		sounds = default.node_sound_stone_defaults()
	})
	
	local bathtub_with_shields_def = table.copy(bathtub_def)
	bathtub_with_shields_def[1].description = "Bathtub With " .. upper_tile .. " Shields"
	bathtub_with_shields_def[1].mesh = "multidecor_bathtub_with_shields.b3d"
	table.insert(bathtub_with_shields_def[1].tiles, tex_name)
	
	multidecor.register.register_seat("bathtub_with_shields_" .. tile, bathtub_with_shields_def[1], bathtub_with_shields_def[2])
	
	multidecor.register.register_table("bathroom_washbasin_" .. tile, {
		style = "modern",
		material = "stone",
		description = "Bathroom Washbasin With " .. upper_tile .. " Doors",
		mesh = "multidecor_bathroom_washbasin.b3d",
		visual_scale = 0.5,
		tiles = {
			"multidecor_marble_material.png",
			"multidecor_metal_material.png",
			"multidecor_coarse_metal_material.png",
			"multidecor_bathroom_leakage.png",
			tex_name,
		},
		bounding_boxes = {
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.5}
		},
		callbacks = {
			on_construct = function(pos)
				multidecor.shelves.set_shelves(pos)
			end,
			can_dig = multidecor.shelves.default_can_dig
		}
	},
	{
		shelves_data = {
			common_name = "bathroom_washbasin_" .. tile,
			{
				type = "sym_doors",
				pos = {x=0.35, y=-0.2, z=0.08},
				pos2 = {x=-0.35, y=-0.2, z=0.08},
				base_texture = tex_name,
				object = "modern:bathroom_washbasin_door",
				inv_size = {w=5,h=3},
				acc = 1,
				sounds = {
					open = "multidecor_squeaky_door_open",
					close = "multidecor_squeaky_door_close"
				}
			}
		}
	})
	
	multidecor.register.register_table("bathroom_wall_cabinet_" .. tile, {
		style = "modern",
		material = "wood",
		description = "Bathroom Wall Cabinet With " .. upper_tile .. " Doors",
		mesh = "multidecor_bathroom_wall_cabinet.b3d",
		visual_scale = 0.5,
		tiles = {"multidecor_white_pine_wood.png"},
		bounding_boxes = {
			{-0.5, -0.5, 0.0, 0.5, 0.5, 0.5}
		},
		callbacks = {
			on_construct = function(pos)
				multidecor.shelves.set_shelves(pos)
			end,
			can_dig = multidecor.shelves.default_can_dig
		}
	},
	{
		shelves_data = {
			common_name = "bathroom_wall_cabinet_" .. tile,
			{
				type = "sym_doors",
				pos = {x=0.5, y=0, z=0.1},
				pos2 = {x=-0.5, y=0, z=0.1},
				base_texture = tex_name,
				object = "modern:bathroom_wall_cabinet_door",
				inv_size = {w=6,h=4},
				acc = 1,
				sounds = {
					open = "multidecor_squeaky_door_open",
					close = "multidecor_squeaky_door_close"
				}
			}
		}
	})
	
	multidecor.register.register_table("bathroom_wall_set_with_mirror_" .. tile, {
		style = "modern",
		material = "wood",
		visual_scale = 0.5,
		description = "Bathroom " .. upper_tile .. "Wall Set With Mirror",
		mesh = "multidecor_bathroom_wall_set_with_mirror.b3d",
		tiles = {
			"multidecor_white_pine_wood.png",
			"multidecor_gloss.png",
			"multidecor_plastic_material.png",
			"multidecor_metal_material.png",
			"multidecor_bathroom_set.png",
			"multidecor_shred.png"
		},
		bounding_boxes = {{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
		callbacks = {
			on_construct = function(pos)
				multidecor.shelves.set_shelves(pos)
			end,
			can_dig = multidecor.shelves.default_can_dig
		}
	},
	{
		shelves_data = {
			common_name = "bathroom_wall_set_with_mirror_" .. tile,
			{
				type = "door",
				pos = {x=0.5, y=-0.25, z=0.05},
				base_texture = tex_name,
				object = "modern:bathroom_wall_set_with_mirror_door",
				inv_size = {w=5,h=2},
				side = "left",
				acc = 1,
				sounds = {
					open = "multidecor_squeaky_door_open",
					close = "multidecor_squeaky_door_close"
				}
			}
		}
	})
end

multidecor.register.register_furniture_unit("bathroom_fluffy_rug", {
	type = "decoration",
	style = "modern",
	material = "plastic",
	visual_scale = 0.5,
	description = "Bathroom Fluffy Rug",
	mesh = "multidecor_bathroom_fluffy_rug.b3d",
	tiles = {
		"multidecor_fluff_material.png"
	},
	bounding_boxes = {{-0.4, -0.5, -0.3, 0.4, -0.35, 0.3}}
})

multidecor.register.register_furniture_unit("bathroom_sink", {
	type = "decoration",
	style = "modern",
	material = "stone",
	visual_scale = 0.5,
	description = "Bathroom Sink",
	mesh = "multidecor_bathroom_sink.b3d",
	tiles = {
		"multidecor_marble_material.png",
		"multidecor_metal_material.png",
		"multidecor_coarse_metal_material.png",
		"multidecor_bathroom_leakage.png"
	},
	bounding_boxes = {{-0.5, -0.4, -0.4, 0.5, 0.5, 0.5}}
})

multidecor.register.register_furniture_unit("toilet", {
	type = "decoration",
	style = "modern",
	material = "stone",
	visual_scale = 0.5,
	description = "Toilet",
	mesh = "multidecor_toilet.b3d",
	tiles = {
		"multidecor_marble_material.png",
		"multidecor_metal_material.png",
		"multidecor_water.png"
	},
	bounding_boxes = {
		{-0.35, -0.5, -0.4, 0.35, -0.1, 0.5},
		{-0.35, -0.1, 0.4, 0.35, 0.5, 0.5}
	}
})

multidecor.register.register_furniture_unit("bathroom_tap_with_cap_flap", {
	type = "decoration",
	style = "modern",
	material = "metal",
	visual_scale = 0.5,
	description = "Bathroom Tap With Cap Flap",
	mesh = "multidecor_bathroom_tap_with_cap_flap.b3d",
	tiles = {"multidecor_metal_material.png"},
	bounding_boxes = {{-0.4, -0.2, 0.0, 0.4, 0.2, 0.5}}
})

multidecor.register.register_furniture_unit("bathroom_tap_with_side_flaps", {
	type = "decoration",
	style = "modern",
	material = "metal",
	visual_scale = 0.5,
	description = "Bathroom Tap With Side Flaps",
	mesh = "multidecor_bathroom_tap_with_side_flaps.b3d",
	tiles = {"multidecor_metal_material.png"},
	bounding_boxes = {{-0.4, -0.2, 0.0, 0.4, 0.2, 0.5}}
})

multidecor.register.register_furniture_unit("bathroom_mirror", {
	type = "decoration",
	style = "modern",
	material = "glass",
	visual_scale = 0.5,
	description = "Bathroom Mirror",
	mesh = "multidecor_bathroom_mirror.b3d",
	tiles = {"multidecor_gloss.png"},
	bounding_boxes = {{-0.4, -0.5, 0.4, 0.4, 0.5, 0.5}}
})


minetest.register_entity("modern:bathroom_washbasin_door", {
	visual = "mesh",
	visual_size = {x=5, y=5, z=5},
	mesh = "multidecor_bathroom_washbasin_door.b3d",
	textures = {"multidecor_" .. ceramic_tiles[1] .. ".png", "multidecor_metal_material.png"},
	use_texture_alpha = true,
	physical = false,
	backface_culling = false,
	selectionbox = {-0.5, -0.53, 0, 0, 0.53, 0.075},
	static_save = true,
	on_activate = multidecor.shelves.default_on_activate,
	on_rightclick = multidecor.shelves.default_on_rightclick,
	on_step = multidecor.shelves.default_door_on_step,
	get_staticdata = multidecor.shelves.default_get_staticdata
})

minetest.register_entity("modern:bathroom_wall_cabinet_door", {
	visual = "mesh",
	visual_size = {x=5, y=5, z=5},
	mesh = "multidecor_bathroom_wall_cabinet_door.b3d",
	textures = {"multidecor_" .. ceramic_tiles[1] .. ".png", "multidecor_metal_material.png"},
	use_texture_alpha = true,
	physical = false,
	backface_culling = false,
	selectionbox = {-0.5, -0.53, 0, 0, 0.53, 0.075},
	static_save = true,
	on_activate = multidecor.shelves.default_on_activate,
	on_rightclick = multidecor.shelves.default_on_rightclick,
	on_step = multidecor.shelves.default_door_on_step,
	get_staticdata = multidecor.shelves.default_get_staticdata
})

minetest.register_entity("modern:bathroom_wall_set_with_mirror_door", {
	visual = "mesh",
	visual_size = {x=5, y=5, z=5},
	mesh = "multidecor_bathroom_wall_set_with_mirror_door.b3d",
	textures = {"multidecor_" .. ceramic_tiles[1] .. ".png", "multidecor_metal_material.png"},
	use_texture_alpha = true,
	physical = false,
	backface_culling = false,
	selectionbox = {-0.5, -0.18, 0, 0, 1.03, 0.075},
	static_save = true,
	on_activate = multidecor.shelves.default_on_activate,
	on_rightclick = multidecor.shelves.default_on_rightclick,
	on_step = multidecor.shelves.default_door_on_step,
	get_staticdata = multidecor.shelves.default_get_staticdata
})
