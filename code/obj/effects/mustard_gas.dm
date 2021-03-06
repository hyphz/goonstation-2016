/////////////////////////////////////////////
// Mustard Gas
/////////////////////////////////////////////


/obj/effects/mustard_gas
	name = "mustard gas"
	icon_state = "mustard"
	opacity = 1
	anchored = 0.0
	mouse_opacity = 0
	var/amount = 6.0

/obj/effects/mustard_gas/New()
	..()
	spawn (100)
		dispose()
	return

/obj/effects/mustard_gas/Move()
	..()
	for(var/mob/living/carbon/human/R in get_turf(src))
		if (R.internal != null && R.wear_mask && (R.wear_mask.c_flags & MASKINTERNALS))
		else
			R.TakeDamage("chest", 0, 10)
			R.losebreath = max(5, R.losebreath)
			R.emote("scream")
			if (prob(25))
				R.stunned += 1
			R.updatehealth()
	return

/obj/effects/mustard_gas/HasEntered(mob/living/carbon/human/R as mob )
	..()
	if (istype(R, /mob/living/carbon/human))
		if (R.internal != null && R.wear_mask && (R.wear_mask.c_flags & MASKINTERNALS))
			return
		R.losebreath = max(5, R.losebreath)
		R.TakeDamage("chest", 0, 10)
		R.emote("scream")
		if (prob(25))
			R.stunned += 1
		R.updatehealth()
	return