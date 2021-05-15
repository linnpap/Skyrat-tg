/datum/computer_file/program/cointrader
	filename = "cointrader"
	filedesc = "CoinTrader"
	program_icon_state = "id"
	extended_desc = "Program for crypto trading, news, and more!"
	requires_ntnet = TRUE
	size = 4
	tgui_id = "NtosCoinTrader"
	program_icon = "clipboard-list"
	var/datum/bank_account/current_user

/datum/computer_file/program/cointrader/ui_data(mob/user)
	var/list/data = get_header_data()
	var/obj/item/computer_hardware/card_slot/card_slot = computer.all_components[MC_CARD]
	if(card_slot && card_slot.stored_card && card_slot.stored_card.registered_account)
		current_user = card_slot.stored_card.registered_account
	if(current_user)
		data["accountName"] = current_user.account_holder
	data["crypto_price"] = SScryptocurrency.cryptoprice
	data["crypto_price_history"] = SScryptocurrency.cryptoprice_history
	data["crypto_trend"] = SScryptocurrency.trendline
	return data

/datum/computer_file/program/cointrader/ui_act(action, list/params)
	. = ..()
	if(.)
		return
	switch(action)
		if("buyCrypto")
			if(!current_user)
				computer.say("Please swipe a valid ID first.")
				return TRUE
			SScryptocurrency.boughtcoins++
			SScryptocurrency.ownedcoins++
		if("sellCrypto")
			if(!current_user)
				computer.say("Please swipe a valid ID first.")
				return TRUE
			SScryptocurrency.boughtcoins--
			SScryptocurrency.ownedcoins--