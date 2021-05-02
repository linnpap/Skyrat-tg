SUBSYSTEM_DEF(cryptocurrency)
	name = "Cryptocurrency"
	wait = 1 MINUTES
	var/cryptoprice = 10

/datum/controller/subsystem/cryptocurrency/fire()
	cryptoprice++
	announce("[cryptoprice]")

/datum/controller/subsystem/cryptocurrency/proc/announce(message)
	priority_announce(message, sound='sound/misc/notice2.ogg', sender_override="Cryptocurrency Announcement")
