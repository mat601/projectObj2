note
	description: "{ESPACE_JEUX}: The espace_jeux main class"
	author: "mathieu moreau-plante"
	date: "19 mai 2014"
	revision: "1"

class
	ESPACE_JEUX

inherit
	IMAGE
		rename
			make as make_image
		end

create
	make

feature {NONE} -- Initialization
	make(a_x, a_y:INTEGER_16)
			-- Initialization for `Current' as espace_jeux from `a_x' and `a_y'.
		local
    		l_tetramino: TETRAMINO

		do
			make_image(a_x,a_y,"espaceJeux.bmp")
			create {LINKED_LIST[BLOC]} blocs.make
			create l_tetramino.make_random(420,15)
		end
feature
	blocs:LIST[BLOC]


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
