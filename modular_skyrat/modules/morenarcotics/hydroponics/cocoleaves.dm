/obj/item/seeds/cocoapod/cocaleaf
	name = "pack of coca leaf seeds"
	desc = "These seeds grow into coca shrubs. They make you feel energized"
	icon = 'modular_skyrat/modules/morenarcotics/icons/cocoleaf.dmi'
	growing_icon = 'modular_skyrat/modules/morenarcotics/icons/cocoleaf.dmi'
	icon_state = "seed-cocoleaf"
	icon_grow = "cocoleaf-grow" // Uses one growth icons set for all the subtypes
	icon_dead = "cocoleaf-dead" // Same for the dead icon
	species = "cocoleaf"
	plantname = "Coca Leaves"
	maturation = 8
	potency = 20
	growthstages = 1
	product = /obj/item/food/grown/cocaleaf
	mutatelist = list()
	reagents_add = list(/datum/reagent/drug/cocaine = 0.3, /datum/reagent/consumable/nutriment = 0.15)

/obj/item/food/grown/cocaleaf
	seed = /obj/item/seeds/cocoapod/cocaleaf
	name = "coca leaf"
	desc = "A leaf of the coca shrub, which contains a potent psychoactive alkaloid known as 'cocaine'."
	icon = 'modular_skyrat/modules/morenarcotics/icons/cocoleaf.dmi'
	icon_state = "cocoleaf"
	foodtypes = FRUIT //i guess? i mean it grows on trees...
	tastes = list("leaves" = 1)
