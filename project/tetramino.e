note
	description: "{TETRAMINO}: The tetramino main class"
	author: "mathieu moreau-plante"
	date: "19 mai 2014"
	revision: "1"
class
	TETRAMINO
inherit
WRAPPER


create
	make_random,
	make_bar,
	make_L,
	make_J,
	make_Z,
	make_S,
	make_T,
	make_carree

feature {NONE} --initialization

	make_random(a_x,a_y:INTEGER)
			-- Initialization of `Current' as random generator from `a_x' and `a_y'.
		local
			l_choix:INTEGER
		do
			set_x(a_x)
			set_y(a_y)
			random_generator.forth
			l_choix := random_generator.item \\ 7
			if l_choix = 0 then
				make_bar
			elseif l_choix = 1 then
				make_L
			elseif l_choix = 2 then
				make_J
			elseif l_choix = 3 then
				make_Z
			elseif l_choix = 4 then
				make_S
			elseif l_choix = 5 then
				make_T
			else
				make_carree
			end
			io.put_integer_32 (random_generator.item)
		end

	make_bar
		-- Initialization of `Current' as bar.
	    do
	    	type:=0
			create {ARRAYED_LIST[BLOC]}blocs.make (4)
	    	blocs.extend (create {BLOC}.make (x.to_integer_16,y.to_integer_16,"bloc.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+25,y.to_integer_16,"bloc.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+50,y.to_integer_16,"bloc.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+75,y.to_integer_16,"bloc.bmp"))
		end

	make_L
		-- Initialization of `Current' as L.
	    do
	    	type:=1
			create {ARRAYED_LIST[BLOC]}blocs.make (4)
	    	blocs.extend (create {BLOC}.make (x.to_integer_16,y.to_integer_16,"bloc2.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16,y.to_integer_16+25,"bloc2.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16,y.to_integer_16+50,"bloc2.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+25,y.to_integer_16+50,"bloc2.bmp"))
		end

	make_J
		-- Initialization of `Current' as j.
	    do
	    	type:=2
			create {ARRAYED_LIST[BLOC]}blocs.make (4)
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+25,y.to_integer_16,"bloc3.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+25,y.to_integer_16+25,"bloc3.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+25,y.to_integer_16+50,"bloc3.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16,y.to_integer_16+50,"bloc3.bmp"))
	    end

	make_Z
		-- Initialization of `Current' as z.
	    do
	    	type:=3
			create {ARRAYED_LIST[BLOC]}blocs.make (4)
	    	blocs.extend (create {BLOC}.make (x.to_integer_16,y.to_integer_16,"bloc4.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+25,y.to_integer_16,"bloc4.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+25,y.to_integer_16+25,"bloc4.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+50,y.to_integer_16+25,"bloc4.bmp"))
		end

	make_S
		-- Initialization of `Current' as s.
	    do
	    	type:=4
			create {ARRAYED_LIST[BLOC]}blocs.make (4)
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+50,y.to_integer_16,"bloc5.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+25,y.to_integer_16,"bloc5.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+25,y.to_integer_16+25,"bloc5.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16,y.to_integer_16+25,"bloc5.bmp"))
		end

	make_T
		-- Initialization of `Current' as t.
	    do
	    	type:=5
			create {ARRAYED_LIST[BLOC]}blocs.make (4)
	    	blocs.extend (create {BLOC}.make (x.to_integer_16,y.to_integer_16,"bloc6.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+25,y.to_integer_16,"bloc6.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+50,y.to_integer_16,"bloc6.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+25,y.to_integer_16+25,"bloc6.bmp"))
		end

	make_carree
		-- Initialization of `Current' as carree.
	    do
	    	type:=6
			create {ARRAYED_LIST[BLOC]}blocs.make (4)
	    	blocs.extend (create {BLOC}.make (x.to_integer_16,y.to_integer_16,"bloc7.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+25,y.to_integer_16,"bloc7.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16,y.to_integer_16+25,"bloc7.bmp"))
	    	blocs.extend (create {BLOC}.make (x.to_integer_16+25,y.to_integer_16+25,"bloc7.bmp"))
		end

feature -- Access
	x:INTEGER assign set_x
		--x coordinate of `Current'.
	y:INTEGER assign set_y
		--y coordinate of `Current'.

	set_x(a_x:INTEGER)
		-- assign of `Current' as set_x from `a_x'.
		do
			x:=a_x
		end
	set_y(a_y:INTEGER)
		-- assign of `Current' as set_x from `a_x'.
		do
			y:=a_y
		end


	orientation:INTEGER assign set_orientation
		--orientation of `Current'.

	set_orientation(a_orientation:INTEGER)
		-- assign of `Current' as set_orientation from `a_orientation'.
		do
			orientation:=a_orientation
		end

	type:INTEGER
	blocs:ARRAYED_LIST[BLOC]

	update
		-- update of `Current' as update orientation.
		do
			if type = 0 then
				update_bar
			elseif type = 1 then
				update_L
			elseif type = 2 then
				Update_J
			elseif type = 3 then
				update_Z
			elseif type = 4 then
				update_S
			elseif type = 5 then
				update_T
			elseif type = 6 then
				update_carree
			end
		end

	update_bar
		-- update of `Current' as update bar from `bloc'.
		do
			if orientation = 0 or orientation= 2 then
				blocs[1].x := x.to_integer_16
				blocs[2].x := x.to_integer_16+25
				blocs[3].x := x.to_integer_16+50
				blocs[4].x := x.to_integer_16+75
				blocs[1].y := y.to_integer_16
				blocs[2].y := y.to_integer_16
				blocs[3].y := y.to_integer_16
				blocs[4].y := y.to_integer_16
			elseif orientation = 1 or orientation = 3 then
				blocs[1].x := x.to_integer_16
				blocs[2].x := x.to_integer_16
				blocs[3].x := x.to_integer_16
				blocs[4].x := x.to_integer_16
				blocs[1].y := y.to_integer_16
				blocs[2].y := y.to_integer_16+25
				blocs[3].y := y.to_integer_16+50
				blocs[4].y := y.to_integer_16+75
			end
		end

	update_L
		-- update of `Current' as update L from `bloc'.
		do
			if orientation = 0 then
				blocs[1].x := x.to_integer_16
				blocs[2].x := x.to_integer_16
				blocs[3].x := x.to_integer_16
				blocs[4].x := x.to_integer_16+25
				blocs[1].y := y.to_integer_16+50
				blocs[2].y := y.to_integer_16+25
				blocs[3].y := y.to_integer_16
				blocs[4].y := y.to_integer_16+50
			elseif orientation = 1 then
				blocs[1].x := x.to_integer_16
				blocs[2].x := x.to_integer_16
				blocs[3].x := x.to_integer_16+25
				blocs[4].x := x.to_integer_16+50
				blocs[1].y := y.to_integer_16+25
				blocs[2].y := y.to_integer_16
				blocs[3].y := y.to_integer_16
				blocs[4].y := y.to_integer_16
			elseif orientation = 2 then
				blocs[1].x := x.to_integer_16+25
				blocs[2].x := x.to_integer_16+25
				blocs[3].x := x.to_integer_16+25
				blocs[4].x := x.to_integer_16
				blocs[1].y := y.to_integer_16+50
				blocs[2].y := y.to_integer_16+25
				blocs[3].y := y.to_integer_16
				blocs[4].y := y.to_integer_16
			elseif orientation = 3 then
				blocs[1].x := x.to_integer_16
				blocs[2].x := x.to_integer_16+25
				blocs[3].x := x.to_integer_16+50
				blocs[4].x := x.to_integer_16+50
				blocs[1].y := y.to_integer_16+25
				blocs[2].y := y.to_integer_16+25
				blocs[3].y := y.to_integer_16+25
				blocs[4].y := y.to_integer_16
			end
		end

	Update_J
		-- update of `Current' as update j from `bloc'.
		do
			if orientation = 0 then
				blocs[1].x := x.to_integer_16
				blocs[2].x := x.to_integer_16+25
				blocs[3].x := x.to_integer_16+25
				blocs[4].x := x.to_integer_16+25
				blocs[1].y := y.to_integer_16+50
				blocs[2].y := y.to_integer_16+50
				blocs[3].y := y.to_integer_16+25
				blocs[4].y := y.to_integer_16
			elseif orientation = 1 then
				blocs[1].x := x.to_integer_16
				blocs[2].x := x.to_integer_16+25
				blocs[3].x := x.to_integer_16+50
				blocs[4].x := x.to_integer_16
				blocs[1].y := y.to_integer_16+25
				blocs[2].y := y.to_integer_16+25
				blocs[3].y := y.to_integer_16+25
				blocs[4].y := y.to_integer_16
			elseif orientation = 2 then
				blocs[1].x := x.to_integer_16
				blocs[2].x := x.to_integer_16
				blocs[3].x := x.to_integer_16
				blocs[4].x := x.to_integer_16+25
				blocs[1].y := y.to_integer_16+50
				blocs[2].y := y.to_integer_16+25
				blocs[3].y := y.to_integer_16
				blocs[4].y := y.to_integer_16
			elseif orientation = 3 then
				blocs[1].x := x.to_integer_16+50
				blocs[2].x := x.to_integer_16+50
				blocs[3].x := x.to_integer_16+25
				blocs[4].x := x.to_integer_16
				blocs[1].y := y.to_integer_16+25
				blocs[2].y := y.to_integer_16
				blocs[3].y := y.to_integer_16
				blocs[4].y := y.to_integer_16
			end
		end

	Update_Z
		-- update of `Current' as update z from `bloc'.
		do
			if orientation = 0 or orientation = 2 then
				blocs[1].x := x.to_integer_16+50
				blocs[2].x := x.to_integer_16+25
				blocs[3].x := x.to_integer_16+25
				blocs[4].x := x.to_integer_16
				blocs[1].y := y.to_integer_16+25
				blocs[2].y := y.to_integer_16+25
				blocs[3].y := y.to_integer_16
				blocs[4].y := y.to_integer_16
			elseif orientation = 1 or orientation = 3 then
				blocs[1].x := x.to_integer_16
				blocs[2].x := x.to_integer_16
				blocs[3].x := x.to_integer_16+25
				blocs[4].x := x.to_integer_16+25
				blocs[1].y := y.to_integer_16+50
				blocs[2].y := y.to_integer_16+25
				blocs[3].y := y.to_integer_16+25
				blocs[4].y := y.to_integer_16
			end
		end

	Update_S
		-- update of `Current' as update s from `bloc'.
		do
			if orientation =  0 or orientation = 2 then
				blocs[1].x := x.to_integer_16
				blocs[2].x := x.to_integer_16+25
				blocs[3].x := x.to_integer_16+25
				blocs[4].x := x.to_integer_16+50
				blocs[1].y := y.to_integer_16+25
				blocs[2].y := y.to_integer_16+25
				blocs[3].y := y.to_integer_16
				blocs[4].y := y.to_integer_16
			elseif orientation = 1 or orientation = 3 then
				blocs[1].x := x.to_integer_16+25
				blocs[2].x := x.to_integer_16+25
				blocs[3].x := x.to_integer_16
				blocs[4].x := x.to_integer_16
				blocs[1].y := y.to_integer_16+50
				blocs[2].y := y.to_integer_16+25
				blocs[3].y := y.to_integer_16+25
				blocs[4].y := y.to_integer_16
			end
		end

	Update_T
		-- update of `Current' as update t from `bloc'.
		do
			if orientation = 0 then
				blocs[1].x := x.to_integer_16
				blocs[2].x := x.to_integer_16+25
				blocs[3].x := x.to_integer_16+50
				blocs[4].x := x.to_integer_16+25
				blocs[1].y := y.to_integer_16
				blocs[2].y := y.to_integer_16
				blocs[3].y := y.to_integer_16
				blocs[4].y := y.to_integer_16+25
			elseif orientation = 1 then
				blocs[1].x := x.to_integer_16+25
				blocs[2].x := x.to_integer_16+25
				blocs[3].x := x.to_integer_16+25
				blocs[4].x := x.to_integer_16
				blocs[1].y := y.to_integer_16
				blocs[2].y := y.to_integer_16+25
				blocs[3].y := y.to_integer_16+50
				blocs[4].y := y.to_integer_16+25
			elseif orientation = 2 then
				blocs[1].x := x.to_integer_16
				blocs[2].x := x.to_integer_16+25
				blocs[3].x := x.to_integer_16+50
				blocs[4].x := x.to_integer_16+25
				blocs[1].y := y.to_integer_16+25
				blocs[2].y := y.to_integer_16+25
				blocs[3].y := y.to_integer_16+25
				blocs[4].y := y.to_integer_16
			elseif orientation = 3 then
				blocs[1].x := x.to_integer_16
				blocs[2].x := x.to_integer_16
				blocs[3].x := x.to_integer_16
				blocs[4].x := x.to_integer_16+25
				blocs[1].y := y.to_integer_16
				blocs[2].y := y.to_integer_16+25
				blocs[3].y := y.to_integer_16+50
				blocs[4].y := y.to_integer_16+25
			end
		end

	update_carree
		-- update of `Current' as update carree from `bloc'.
		do
			if orientation = 0 or orientation = 1 or orientation = 2 or orientation = 3 then
				blocs[1].x := x.to_integer_16
				blocs[2].x := x.to_integer_16+25
				blocs[3].x := x.to_integer_16
				blocs[4].x := x.to_integer_16+25
				blocs[1].y := y.to_integer_16
				blocs[2].y := y.to_integer_16
				blocs[3].y := y.to_integer_16+25
				blocs[4].y := y.to_integer_16+25
			end
		end

	move_left
		-- create of `Current' as move_left from `set_x'.
		do
			set_x(x-25)
			update
		end

	move_right
		-- create of `Current' as move_right from `set_x'.
		do
			set_x(x+25)
			update
		end

	move_up
		-- create of `Current' as move_up from `set_y'.
		local
		do
			set_y(y-25)
			update
		end

	move_down
		-- create of `Current' as move_down from `set_y'.
		do
			set_y(y+25)
			update
		end

	rotate_left
		-- create of `Current' as rotate_left from `orientation'.
		do
			orientation := (orientation+3)\\4
			update
		end

	rotate_right
		-- create of `Current' as rotate_right from `orientation'.
		do
			orientation := (orientation+1)\\4
			update
		end

feature {NONE}

	random_generator:RANDOM
		-- Initialization of `Current' as time of random generator.
	local
		l_time:TIME
		l_seed:INTEGER
	once
		create l_time.make_now
		l_seed := l_time.minute
     	l_seed := l_seed * 60 + l_time.second
    	l_seed := l_seed * 1000 + l_time.milli_second
		create Result.set_seed (l_time.milli_second)
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
