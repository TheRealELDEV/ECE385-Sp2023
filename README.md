# PianoTiles

This final project is an attempt at recreating the game piano tiles.

## Parts

This game requires a USB keyboard, Monitor and VGA cable/converter, an audio output device (speaker, etc.), and FPGA. 

## Usage

To run the game, the MAX10 device should first be programmed, and then in eclipse the configuration corresponding to the finalproject_app project should be run (this runs the code in sgtl5000.c, which allows audio to start up). With the USB keyboard plugged into the USB input, audio output device connected to the headphone out port, and VGA cable connected between the monitor and MAX10 FPGA, the initial main menu display of the game should show up on the monitor, and audio should be playable with the keys. The number keys 1-5 can be pressed to choose between each of the 5 songs from the main menu. Once a song is selected, the screen changes to the game itself and tiles start falling. The piano displayed on the screen shows the keys that each note corresponds to, so they can be pressed on the keyboard to play the corresponding note. When the song is done and the tiles are done falling, the enter key can be pressed followed by the backspace key to return to the main menu, from where another song can be selected with the number keys. 

## Creators

Akhil Devarajan and Milind Sagaram