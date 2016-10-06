I'm on Ubuntu gnome 16.04. Solution is to enable auto-detection, pair the headset again and select it in the list of output audio devices.

Change #AutoEnable=false to AutoEnable=true in the  /etc/bluetooth/main.conf (notice new line is un-commented)
Unpair the headset
Restart the bluetooth service sudo /etc/init.d/bluetooth restart
Pair your headset again and connect it
Go to sound settings. From the output device tab you should now see the headset listed along with other output device like internal speakers
Choose it as the sound output device.
