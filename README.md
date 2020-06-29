# LispAdventure
A text adventure, written in Common Lisp, for the purpose of me learning the language.

## Story
There is no story yet. I'm just trying to get everything to work.

## What works?
As of yet, you can move around the rooms, look in your inventory, look at what's in the room and put it in your inventory.

## Prerequisites

You need to have sbcl installed. 
On arch-based linux distros just run

	sudo pacman -S sbcl

## Run the game
Clone the repository to your hard drive

	git clone https://github.com/TheSingingFox/LispAdventure.git
	cd LispAdventure/

Then start sbcl. In the REPL, type

	(load "game.lisp")

then 

	(start)

Or on linux systems just run the executable:

	./adventure
	
Enjoy!
