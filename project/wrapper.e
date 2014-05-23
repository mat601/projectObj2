note
	description: "Summary description for {WRAPPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	WRAPPER

inherit
	ARGUMENTS


feature {NONE} -- Initialization

		frozen SDL_INIT_VIDEO:NATURAL_32
		external
			"C inline use  <SDL.h>"
		alias
			"SDL_INIT_VIDEO"
		end

		frozen C_sizeof_SDL_Rect:INTEGER
		external
			"C inline use  <SDL.h>"
		alias
			"sizeof(SDL_Rect)"
		end

		frozen SDL_Init(flags:NATURAL_32):INTEGER
		external
			"C (Uint32) : int | <SDL.h>"
		alias
			"SDL_Init"
		end

		frozen SDL_GetError:POINTER
		external
			"C : char* | <SDL.h>"
		alias
			"SDL_GetError"
		end

		frozen SDL_LoadBMP(file:POINTER):POINTER
		external
		"C (const char *) : SDL_Surface * | <SDL.h>"
		alias
			"SDL_LoadBMP"
		end
		frozen SDL_SetVideoMode(width, height, bpp:INTEGER; flags:NATURAL_32):POINTER
		external
			"C (int,int,int, Uint32) : SDL_Surface * | <SDL.h>"
		alias
			"SDL_SetVideoMode"
		end

		frozen SDL_SWSURFACE:NATURAL_32
		external
			"C inline use <SDL.h>"
		alias
			"SDL_SWSURFACE"
		end

		frozen set_SDL_Rect_x (SDL_Rect:POINTER;value:INTEGER_16)
		external
			"C [struct <SDL.h>] (SDL_Rect,Sint16)"
		alias
			"x"
		end

		frozen set_SDL_Rect_y (SDL_Rect:POINTER;value:INTEGER_16)
		external
			"C [struct <SDL.h>] (SDL_Rect,Sint16)"
		alias
			"y"
		end

		frozen set_SDL_Rect_w (SDL_Rect:POINTER;value:NATURAL_16)
		external
			"C [struct <SDL.h>] (SDL_Rect,Uint16)"
		alias
			"w"
		end

		frozen set_SDL_Rect_h (SDL_Rect:POINTER;value:NATURAL_16)
		external
			"C [struct <SDL.h>] (SDL_Rect,Uint16)"
		alias
			"h"
		end

		frozen get_SDL_Rect_x (SDL_Rect:POINTER):INTEGER_16
		external
			"C [struct <SDL.h>] (SDL_Rect):Sint16"
		alias
			"x"
		end

		frozen get_SDL_Rect_y (SDL_Rect:POINTER):INTEGER_16
		external
			"C [struct <SDL.h>] (SDL_Rect):Sint16"
		alias
			"y"
		end

		frozen get_SDL_Rect_w (SDL_Rect:POINTER):NATURAL_16
		external
			"C [struct <SDL.h>] (SDL_Rect):Uint16"
		alias
			"w"
		end

		frozen get_SDL_Rect_h (SDL_Rect:POINTER):NATURAL_16
		external
			"C [struct <SDL.h>] (SDL_Rect):Uint16"
		alias
			"h"
		end

		frozen get_SDL_Surface_w (SDL_Rect:POINTER):NATURAL_16
		external
			"C [struct <SDL.h>] (SDL_Surface):Uint16"
		alias
			"w"
		end

		frozen get_SDL_Surface_h (SDL_Rect:POINTER):NATURAL_16
		external
			"C [struct <SDL.h>] (SDL_Surface):Uint16"
		alias
			"h"
		end

		frozen SDL_BlitSurface(SDL_Surface1, SDL_Rect1, SDL_Surface2, SDL_Rect2:POINTER):INTEGER
		external
			"C (SDL_Surface *, SDL_Rect *, SDL_Surface *, SDL_Rect*): int|<SDL.h>"
		alias
			"SDL_BlitSurface"
		end

		frozen SDL_Flip(SDL_Surface:POINTER):INTEGER
		external
			"C (SDL_Surface *): int|<SDL.h>"
		alias
			"SDL_Flip"
		end

		frozen SDL_Delay(ms:NATURAL_32)
		external
			"C (Uint32) | <SDL.h>"
		alias
			"SDL_Delay"
		end

        frozen C_sizeof_SDL_Event:INTEGER
		external
			"C inline use  <SDL.h>"
		alias
			"sizeof(SDL_Event)"
		end

		frozen SDL_PollEvent(SDL_Event:POINTER):INTEGER
		external
			"C (SDL_Event *): int | <SDL.h>"
		alias
			"SDL_PollEvent"
		end

		frozen get_SDL_Event_type(SDL_Event:POINTER):NATURAL_32
		external
			"C [struct <SDL.h>] (SDL_Event):Uint32"
		alias
			"type"
		end

		frozen SDL_Quit
		external
			"C | <SDL.h>"
		alias
			"SDL_Quit"
		end

		frozen SDL_Quit_const:NATURAL_8
		external
			"C inline use <SDL.h>"
		alias
			"SDL_QUIT"
		end

		frozen key_sym (event:POINTER):INTEGER
		external
			"C inline use <SDL.h>"
		alias
			"((SDL_Event *)$event)->key.keysym.sym"
		end

		frozen SDL_keydown:NATURAL_8
		external
			"C inline use <SDL.h>"
		alias
			"SDL_KEYDOWN"
		end

		frozen SDLK_LEFT:INTEGER
		external
			"C inline use <SDL.h>"
		alias
			"SDLK_LEFT"
		end

		frozen SDLK_RIGHT:INTEGER
		external
			"C inline use <SDL.h>"
		alias
			"SDLK_RIGHT"
		end

		frozen SDLK_UP:INTEGER
		external
			"C inline use <SDL.h>"
		alias
			"SDLK_UP"
		end

		frozen SDLK_DOWN:INTEGER
		external
			"C inline use <SDL.h>"
		alias
			"SDLK_DOWN"
		end

		frozen SDL_INIT_AUDIO:NATURAL_32
		external
			"C inline use  <SDL.h>"
		alias
			"SDL_INIT_AUDIO"
		end

		frozen Mix_OpenAudio(frequency:INTEGER; format:NATURAL_16; channel, chunksize:INTEGER):INTEGER
		external
			"C (int, Uint16, int, int):int | <SDL_mixer.h>"
		alias
			"Mix_OpenAudio"
		end

		frozen Mix_LoadWAV(fname:POINTER):POINTER
		external
			"C (const char *):Mix_Chunk * | <SDL_mixer.h>"
		alias
			"Mix_LoadWAV"
		end

		frozen Mix_CloseAudio
		external
			"C | <SDL_mixer.h>"
		alias
			"Mix_CloseAudio"
		end

		frozen Mix_PlayChannel(channel:INTEGER; Mix_Chunk:POINTER; loops:INTEGER):INTEGER
		external
			"C (int, Mix_Chunk*, int) : int  | <SDL_mixer.h>"
		alias
			"Mix_PlayChannel"
		end

		frozen MIX_DEFAULT_FORMAT:NATURAL_16
			external
				"C inline use <SDL_mixer.h>"
			alias
				"MIX_DEFAULT_FORMAT"
		end

		frozen AUDIO_S16SYS:NATURAL_16
			external
				"C inline use <SDL_mixer.h>"
			alias
				"AUDIO_S16SYS"
		end



note
	copyright: "Copyright (c) 1984-2013, Eiffel Software and others"
	license:   "[
		    This program is free software: you can redistribute it and/or modify
		    it under the terms of the GNU General Public License as published by
		    the Free Software Foundation, either version 3 of the License, or
		    (at your option) any later version.

		    This program is distributed in the hope that it will be useful,
		    but WITHOUT ANY WARRANTY; without even the implied warranty of
		    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
		    GNU General Public License for more details.

		    You should have received a copy of the GNU General Public License
		    along with this program.  If not, see <http://www.gnu.org/licenses/>.
		]"
	source: "[
			CEGEP de Drummondville </br> 960 , rue St-Georges Drummondville(Québec)
				J2C 6A2 Local 2608   Téléphone: 819-478-4671 poste 293
		]"

end
