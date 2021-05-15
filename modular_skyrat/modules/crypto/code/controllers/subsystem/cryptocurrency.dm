SUBSYSTEM_DEF(cryptocurrency)
	name = "Cryptocurrency"
	//wait = 1 MINUTES
	wait = 5 SECONDS
	var/cryptoprice = 20
	var/list/cryptoprice_history = list()

	var/trendline
	var/trend_length
	var/trend_starter
	var/volatility = 1.2
	var/breakout_min
	var/breakout_dir = 0
	var/ownedcoins = 0 //total of coins owned
	var/boughtcoins = 0 //change in coins owned

/datum/controller/subsystem/cryptocurrency/Initialize()
	for(var/i=1,i<=40,i++)
		cryptoprice_history += cryptoprice //fills chart with initial value, makes sure it will correctly display

	//generates a random initial trend
	gen_trend()

/datum/controller/subsystem/cryptocurrency/fire()
	//follow trend line...
	cryptoprice+=trendline
	//along with a bit of randomness
	if(prob(50))
		cryptoprice+=volatility*0.2*rand()
	else
		cryptoprice-=volatility*0.2*rand()

	//update price based on change in coins owned...
	cryptoprice+=boughtcoins*0.0025*(volatility^2)
	//and the volitility too
	volatility+=(boughtcoins*0.001)+(trendline*0.005)
	//yes, this means its possible to do pump and dump schemes

	trend_starter+=trendline

	if(cryptoprice<0.1)
		cryptoprice=0.1 //sets a minimum price

	//check if the stock's broken out
	if((trend_starter+breakout_min)<cryptoprice) //positive breakout
		breakout_dir=1
		gen_trend() //generates a bullish trend
	else if((trend_starter-breakout_min)>cryptoprice) //negative breakout
		breakout_dir=-1
		gen_trend() //generates a bearish trend
	else if(trend_length<=0)
		breakout_dir=0
		gen_trend()

	//update graph
	cryptoprice_history+=cryptoprice
	if(cryptoprice_history.len > 40)
		cryptoprice_history.Cut(1, 2)
	announce("[cryptoprice]")

	//reset bought coins
	boughtcoins = 0

	trend_length--

/datum/controller/subsystem/cryptocurrency/proc/announce(message)
	priority_announce(message, sound='sound/misc/notice2.ogg', sender_override="Cryptocurrency Announcement")

/datum/controller/subsystem/cryptocurrency/proc/gen_trend() //generates a new trendline depending on breakout shit; this is all a really fucking rough approximation of the actual stock market
	if(breakout_dir>0)
		trendline = rand(5,10)*volatility*0.2
		trend_length = rand(2,7)
		breakout_min = volatility*1000 //ensures that it doesnt breakout forever
	else if (breakout_dir<0)
		trendline = rand(5,10)*volatility*-0.2
		trend_length = rand(2,7)
		breakout_min = volatility*1000
	else
		trendline = rand(-5,5)*volatility/20
		trend_length = rand(5,12)
		breakout_min = volatility

	breakout_dir=0
	trend_starter = cryptoprice