note
	description: "{IMAGE}: The image main class"
	author: "mathieu moreau-plante"
	date: "19 mai 2014"
	revision: "1"

deferred class
	IMAGE

inherit
	WRAPPER

feature {NONE} -- Initialization

	make(a_x, a_y:INTEGER_16; a_image_path:STRING)
			-- Initialization for `Current' as make from `a_x', `a_y' and `a_image_path'.
		require
			not a_image_path.is_empty
		local
    		path_image:C_STRING
    		error:STRING
		do
    		create path_image.make(a_image_path)
    		surface_image := sdl_loadbmp(path_image.item)
    		if surface_image.is_default_pointer then
				create error.make_from_c (SDL_GetError)
				print(error)
    		end
			internal_rect := internal_rect.memory_calloc (1, C_sizeof_SDL_Rect)
			set_x(a_x)
			set_y(a_y)
		ensure
			not surface_image.is_default_pointer
		end

feature -- Access

	x:INTEGER_16 assign set_x
		do
			Result := get_SDL_Rect_x(internal_rect)
		end

	set_x(a_x:INTEGER_16)
		do
			set_SDL_Rect_x(internal_rect,a_x)
		end

	y:INTEGER_16 assign set_y
	do
		Result := get_SDL_Rect_y(internal_rect)
	end

	set_y(a_y:INTEGER_16)
		do
			set_SDL_Rect_y(internal_rect,a_y)
		end

	width:INTEGER_32
		do
			Result := get_SDL_Surface_w(surface_image)
		end


	height:INTEGER_32
		do
			Result := get_SDL_Surface_h(surface_image)
		end

	internal_rect:POINTER

	surface_image:POINTER



invariant
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
