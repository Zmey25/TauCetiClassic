/mob/living/carbon/alien/larva/regenerate_icons()
	overlays = list()
	update_inv_r_hand(0)
	update_hud()
	update_icons()

/mob/living/carbon/alien/larva/update_icons()
	update_hud()		//TODO: remove the need for this to be here
	overlays.Cut()
	var/state = 0
	if(amount_grown > 150)
		state = 2
	else if(amount_grown > 50)
		state = 1

	if(stat == DEAD)
		icon_state = "larva[state]_dead"
	else if (handcuffed || legcuffed)
		icon_state = "larva[state]_cuff"
	else if (stunned)
		icon_state = "larva[state]_stun"
	else if(lying || resting)
		icon_state = "larva[state]_sleep"
	else
		icon_state = "larva[state]"

/mob/living/carbon/alien/larva/update_hud()
	//TODO
	if (client)
//		if(other)	client.screen |= hud_used.other		//Not used
//		else		client.screen -= hud_used.other		//Not used
		client.screen |= contents
