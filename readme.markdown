#EXERCISE BIKE MARIO KART

or something like that.

Required materials:
arduino
pulse sensor
os x
usb cord or a bluetooth something or other

Basically, the pulse sensor plugs into the arduino. It comes with a fantastic little library that does a great job monitoring your heart rate. That information is transmitted in some form (a USB cord in my case) to the waiting computer. I've used objective-C here to catch the serial comms and simulate keypresses. The keypresses happen on an interval based on your heartrate. In any given second, a resting heartrate triggers a keypress for maybe 1/4 of that second, while an intense workout (140BPM +) keeps the key pressed for the whole second. 

While playing a racing game (like mario kart or something), you can map your game/emulator's keys to custom bindings. match the simulated keypress to the throttle button. Hop on an exercise bike, and hook up the hearyrate sensor to wherever works. Play your games and get rewarded for exercising during it.

Voici et voila! Exercise bike Mario Kart. 