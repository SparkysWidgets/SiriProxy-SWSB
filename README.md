SiriProxy-SWGDO

About:

SiriProxy-SWSB is a Siri Proxy plugin that allows you to send commands to the Smart Box power box created for an instructable using a SW-04-010A widgets from our store. This is ment to be a demo for a video but can easily be extended for whatever tasks are needed

Credits:

SiriProxy-SWSB was created by Sparky's Widgets. Please feel free to use this however you wish, just through use a mention and well be happy that we helped!

Usage: This is still a WIP and usages features/updates documentation will be added here

Installation:

To install SiriProxy-SWGDO, add the following to your Siri Proxy config.yml file (~/.siriproxy/config.yml):
 name: 'SWGDO' 
 git: 'git://github.com/SparkysWidgets/SiriProxy-SWGDO.git' 
 comport: '/dev/rfcomm0' 
 baudrate: 9600
 databits: 8
 stopbits: 1
 parity: 0

1)Stop Siri Proxy (CTRL-C or killall siriproxy)

2)Update Siri Proxy (siriproxy update)

3)Start Siri Proxy (siriproxy server)
