Soft Tetris
================

Welcome to the repository of Soft Tetris. This game is made in Eiffel, 
with the help of SDL 1.2.14.
author: Matheu Moreau-Plante.
version : 1.0
date: 23 mai 2014

Soft Tetris is a puzzle game type solo player inspired by the classic game Tetris.
It involve the classic gameplay of Tetris, but the game is more simple do make line then the original game.
The game use bloc to make the tetramino you use and place this piece what you want by the key control. 
If you make a line the line is remove from the game and the other bloc upper then line remove is move down.
In the same time a line is remove the player do some point relative to the number of line is make.


Installing the game
----------------------
### Install for Windows

Unzip the archive to a folder of your choice with the right version of the game
	
### Install for Linux Debian

Unpack the archive into a folder of your choice. You must, in addition to installing 
the repository, install SDL SDL_mixer binaries and manually with this command:

	sudo apt-get install libsdl1.2 libsdl-mixer1.2
	
Compiling the source
---------------------
The first thing to do is to download the repository Corner Plumber at the following address: 

- [Soft Tetris Repository][1]

If you want to open and edit the code, you will need to download the IDE EiffelStudio at the following address:
- [EiffelStudio Download][2]

You will, however, first you create an account on the site for downloading EiffelStudio.

### Install for Windows
	
	The installation of the repository should be the only step needed to develop the game.
	
### Install for Linux Debian

For installation on Linux, you must, in addition to installing the repository, install the libraries SDL and SDL_mixer manually by this command:

	sudo apt-get install libsdl1.2-dev libsdl-mixer1.2-dev


  [1]: https://github.com/mat601/projectsObj2
  [2]: http://www2.eiffel.com/download/