note
	description: "{APPLICATION}: The game main class"
	author: "mathieu moreau-plante"
	date: "15 mai 2014"
	revision: "1"

class
	APPLICATION

inherit

	WRAPPER

create
	make

feature {NONE} -- Initialization

	make
			-- Run application
		local
			l_targetarea: POINTER
			Screen: POINTER
			error: INTEGER
			l_espace: ESPACE_JEUX
			l_background: BACKGROUND
			l_conversation: CONVERSATION
			l_fin: BOOLEAN
			l_event: POINTER
			l_fin_event: INTEGER
			l_tetramino: TETRAMINO
			compteur: INTEGER
			audio_init: INTEGER
    		path_sound: C_STRING
    		path_sound2: C_STRING
    		surface_sound: POINTER
    		surface_sound2: POINTER
    		play_channel: INTEGER
    		l_son: SON
    		l_endgame: END_GAME
    		l_is_top:BOOLEAN

		do
				--| Add your code here
			create l_conversation.make (5, 240)
			create l_background.make ()
			create l_espace.make (275, 0)
			create l_endgame.make ()
			create path_sound.make("tetris.wav")
			create path_sound2.make("Tetris_end.WAV")
			create l_tetramino.make_random (415, 15)
			error := SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO)
			create l_conversation.make (5, 240)
			create l_background.make ()
			create l_espace.make (275, 0)
			create l_tetramino.make_random (415, 15)
			compteur := 0
			l_event := l_event.memory_calloc (1, C_sizeof_SDL_Event)
			audio_init:= Mix_OpenAudio(44100, AUDIO_S16SYS, 2, 4096)
			surface_sound := Mix_LoadWAV( path_sound.item)
			play_channel:= Mix_PlayChannel( 1, surface_sound, 0)
			screen := SDL_SetVideoMode (650, 600, 32, SDL_SWSURFACE)

			from
				l_fin := False
			until
				l_fin
			loop
				error := SDL_blitsurface (l_background.surface_image, create {POINTER}, screen, l_background.internal_rect)
				l_targetarea := l_targetarea.memory_calloc (1, C_sizeof_SDL_Rect)
				error := SDL_blitsurface (l_espace.surface_image, create {POINTER}, screen, l_espace.internal_rect)
				across
					l_tetramino.blocs as la_blocs
				loop
					error := SDL_blitsurface (la_blocs.item.surface_image, create {POINTER}, screen, la_blocs.item.internal_rect)
				end

				across
					l_espace.blocs as la_blocs
				loop
					error := SDL_blitsurface (la_blocs.item.surface_image, create {POINTER}, screen, la_blocs.item.internal_rect)
				end
				if compteur = 20 then
					l_tetramino.move_down
					if is_collision(l_tetramino.blocs, l_espace.blocs) = True then
							l_tetramino.move_up
							l_is_top:=False
							across l_tetramino.blocs as la_tet_blocs  loop
								if la_tet_blocs.item.y = 15 then
									l_is_top:=True
								end
							end
							if l_is_top then
								error := SDL_blitsurface (l_endgame.surface_image, create {POINTER}, screen, l_endgame.internal_rect) --end game
							    error := SDL_Flip(screen)
								l_fin := True
								SDL_delay(8000)
							else
								l_espace.blocs.append (l_tetramino.blocs)
								if is_line(l_espace.blocs) = true then
									surface_sound2 := Mix_LoadWAV(path_sound2.item)
									play_channel:= Mix_PlayChannel( 2, surface_sound2, 0)
								end
							end
						create l_tetramino.make_random (415, 15)
					end
					l_tetramino.update
					compteur := 0
				end
				compteur := (compteur + 1)
				l_targetarea := l_targetarea.memory_calloc (1, C_sizeof_SDL_Rect)
				error := SDL_blitsurface (l_conversation.surface_image, create {POINTER}, screen, l_conversation.internal_rect)
				error := SDL_Flip (screen)
				from
					l_fin_event := sdl_pollevent (l_event)
				until
					l_fin_event = 0
				loop
					if get_SDL_Event_type (l_event) = SDL_Quit_const then
						l_fin := true
					end
					if get_SDL_Event_type (l_event) = SDL_KEYDOWN then
						if key_sym (l_event) = sdlk_left then
							if l_tetramino.x >= 265 then
								l_tetramino.move_left
							end
							if is_collision(l_tetramino.blocs, l_espace.blocs)= true then
								l_tetramino.move_right
							end
						end
					end
					if get_SDL_Event_type (l_event) = SDL_KEYDOWN then
						if key_sym (l_event) = sdlk_right then
							if l_tetramino.x <= 600 then
								l_tetramino.move_right
							end
							if is_collision(l_tetramino.blocs, l_espace.blocs) = true then
								l_tetramino.move_left
							end
						end
					end
					if get_SDL_Event_type (l_event) = SDL_KEYDOWN then
						if key_sym (l_event) = sdlk_up then
							l_tetramino.rotate_right
							l_tetramino.update
							if is_collision(l_tetramino.blocs, l_espace.blocs) = true then
								l_tetramino.rotate_left
							end
						end
					end
					if get_SDL_Event_type (l_event) = SDL_KEYDOWN then
						if key_sym (l_event) = sdlk_down then
							l_tetramino.move_down
							if is_collision(l_tetramino.blocs, l_espace.blocs) = true then
								l_tetramino.move_up
								l_espace.blocs.append (l_tetramino.blocs)
								if is_line(l_espace.blocs) = true then
									surface_sound2 := Mix_LoadWAV(path_sound2.item)
									play_channel:= Mix_PlayChannel( 2, surface_sound2, 0)
								end
								create l_tetramino.make_random (415, 15)
								l_tetramino.update
							end
						end
					end
					l_fin_event := sdl_pollevent (l_event)
				end
				SDL_Delay (2)
			end
			Mix_CloseAudio
			SDL_Quit
		end
feature {none}
	is_line(l_liste1:LIST[BLOC]):BOOLEAN
		-- create of `Current' as line from `l_liste1'.
		local
			i,j,count:INTEGER
		do
			Result := False
			from
				i:=565
			until
				i < 15
			loop
				count := 0
				from
					j:=290
				until
					j > 590
				loop
					across
							l_liste1 as la_liste1
					loop
						if la_liste1.item.y = i then
							if la_liste1.item.x =  j then
								count := count + 1
							end
						end
					end
					j:=j+25
				end
				if count = 13 then
					Result := True
					from
						l_liste1.start
					until
						l_liste1.exhausted
					loop
						if l_liste1.item.y = i then
							l_liste1.remove
						else
							if l_liste1.item.y < i then
									l_liste1.item.y := l_liste1.item.y + 25
							end
							l_liste1.forth
						end
					end
				else
					i:=i-25
				end

			end
		end

	is_collision(l_liste1, l_liste2:LIST[BLOC]):BOOLEAN
		-- creatw of `Current' as collision from `l_liste1' and `l_liste2'.
		do
			Result := False
		across
			l_liste1 as la_liste1
		loop
			across
				l_liste2 as la_liste2
			loop
				if Result = false then
					if la_liste1.item.x = la_liste2.item.x and la_liste1.item.y = la_liste2.item.y  then
						Result := true
					end
				end
			end
			if la_liste1.item.x >= 600 or la_liste1.item.x <= 265 then
				result := true
			end
			if la_liste1.item.y >= 590 then
				result := true
			end
		end
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
