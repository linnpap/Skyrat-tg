/datum/computer_file/program/cointrader
	filename = "cointrader"
	filedesc = "CoinTrader"
	program_icon_state = "id"
	extended_desc = "Program for crypto trading, news, and more!"
	requires_ntnet = TRUE
	size = 4
	tgui_id = "NtosCoinTrader"
	program_icon = "clipboard-list"
	var/cryptocurrency

/datum/computer_file/program/cointrader/ui_data(mob/user)
	var/list/data = get_header_data()
	//cryptocurrency = locate(/datum/controller/subsystem/cryptocurrency) in Master.subsystems
	//cryptocurrency = SS
	data["crypto_price"] = SScryptocurrency.cryptoprice
	return data
