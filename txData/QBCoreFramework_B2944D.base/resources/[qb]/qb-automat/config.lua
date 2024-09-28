Config = {
	Locale = "en", -- Set your locale
	Framework = "qb", -- "qb" or "esx"

	ZOffsets = { -- Text Height Fix
		["prop_vend_coffe_01"] = 1.0,
		["prop_slush_dispenser"] = 0.35
	},

	Machines = { -- Types are "Vending", "Beverage", "Coffee"

		["prop_vend_coffe_01"] = {
			Type = "Coffee",
			Title = "Coffees",
			Items = {
				{
					Item = "coffee",
					Label = "Coffee",
					Price = 5,
					Prop = "v_club_vu_coffeecup",
					PropOffset = {
						-0.075,
						-0.245,
						0.66
					}
				}
			}
		},

		["apa_mp_h_acc_coffeemachine_01"] = {
			Type = "Coffee",
			Title = "Coffees",
			Items = {
				{
					Item = "coffee",
					Label = "Coffee",
					Price = 5,
					Prop = "v_club_vu_coffeecup"
				}
			}
		},

		["ex_mp_h_acc_coffeemachine_01"] = {
			Type = "Coffee",
			Title = "Coffees",
			Items = {
				{
					Item = "coffee",
					Label = "Coffee",
					Price = 5,
					Prop = "v_club_vu_coffeecup"
				}
			}
		},

		["hei_heist_kit_coffeemachine_01"] = {
			Type = "Coffee",
			Title = "Coffees",
			Items = {
				{
					Item = "coffee",
					Label = "Coffee",
					Price = 5,
					Prop = "v_club_vu_coffeecup"
				}
			}
		},

		["mp_b_kit_coffeemachine_01"] = {
			Type = "Coffee",
			Title = "Coffees",
			Items = {
				{
					Item = "coffee",
					Label = "Coffee",
					Price = 5,
					Prop = "v_club_vu_coffeecup"
				}
			}
		},

		["prop_juice_dispenser"] = {
			Type = "Beverage",
			Title = "Fruit Juices",
			Items = {
				{
					Item = "bigfruit",
					Label = " Fruit",
					Price = 5,
					Prop = "prop_plastic_cup_02",
					PropOffset = {
						0.12,
						-0.2,
						0.18
					}
				}
			}
		},

		["prop_slush_dispenser"] = {
			Type = "Beverage",
			Title = "Fruit Juices",
			Items = {
				{
					Item = "bigfruit",
					Label = " Fruit",
					Price = 5,
					Prop = "prop_plastic_cup_02",
					PropOffset = {
						-0.12,
						-0.2,
						0.18
					}
				}
			}
		},

		["prop_food_bs_soda_01"] = {
			Type = "Beverage",
			Title = "Drinks",
			Items = {
				{
					Item = "kurkakola",
					Label = "Cola",
					Price = 5,
					Prop = "prop_plastic_cup_02",
					PropOffset = {
						0.28,
						-0.15,
						0.14
					}
				}
			}
		},

		["prop_food_cb_soda_01"] = {
			Type = "Beverage",
			Title = "Drinks",
			Items = {
				{
					Item = "kurkakola",
					Label = "Cola",
					Price = 5,
					Prop = "prop_cs_paper_cup",
					PropOffset = {
						-0.28,
						-0.15,
						0.1
					}
				}
			}
		},

		["prop_food_bs_soda_02"] = {
			Type = "Beverage",
			Title = "Drinks",
			Items = {
				{
					Item = "kurkakola",
					Label = "Cola",
					Price = 5,
					Prop = "prop_food_bs_juice01",
					PropOffset = {
						0.4,
						-0.15,
						0.075
					}
				}
			}
		},

		["prop_food_cb_soda_02"] = {
			Type = "Beverage",
			Title = "Drinks",
			Items = {
				{
					Item = "kurkakola",
					Label = "Cola",
					Price = 5,
					Prop = "prop_food_cb_juice01",
					PropOffset = {
						-0.4,
						-0.15,
						0.075
					}
				}
			}
		},

		["prop_vend_soda_01"] = {
			Type = "Vending",
			Title = "Drinks",
			Items = {
				{
					Item = "water_bottle",
					Label = "Water",
					Price = 3,
					Prop = "prop_ld_flow_bottle"
				},

				{
					Item = "kurkakola",
					Label = "Cola",
					Price = 5,
					Stock = 21,
					Prop = "prop_ecola_can"
				}
			}
		},

		["prop_vend_soda_02"] = {
			Type = "Vending",
			Title = "Drinks",
			Items = {
				{
					Item = "water_bottle",
					Label = "Water",
					Price = 3,
					Prop = "prop_ld_flow_bottle"
				},

				{
					Item = "kurkakola",
					Label = "Cola",
					Price = 5,
					Stock = 21,
					Prop = "prop_ecola_can"
				}
			}
		},

		["prop_vend_snak_01"] = {
			Type = "Vending",
			Title = "Snacks",
			Items = {
				{
					Item = "chocolate",
					Label = "Chocolate",
					Price = 3,
					Stock = 5,
					Prop = "prop_candy_pqs"
				},

				{
					Item = "potato_chips",
					Label = "Chips",
					Price = 5,
					Stock = 7,
					Prop = "prop_ld_snack_01"
				}
			}
		}
	}
}
