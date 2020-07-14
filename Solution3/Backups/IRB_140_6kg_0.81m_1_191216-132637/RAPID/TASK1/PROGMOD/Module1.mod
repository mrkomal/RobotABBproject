MODULE Module1
       !Declaring the points
	CONST robtarget home:=[[525.31,-6.92,695.63],[0.6866,0.0182588,0.726758,0.00833769],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget triangleright:=[[10.96,557.40,97.95],[0.00645268,0.73559,-0.677314,0.0105946],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget squareright:=[[10.96,500.40,97.95],[0.00645268,0.73559,-0.677314,0.0105946],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget squareleft:=[[60.16,-550.47,102.60],[0.0576312,0.706564,0.70514,-00.0149725],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget triangleleft:=[[60.16,-588.47,102.60],[0.0576312,0.706564,0.70514,-00.0149725],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget changetool:=[[-535.85,-155.51,572.03],[0.105179,0.891744,0.0895816,-0.430936],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget safetyright:=[[10.96,557.40,597.95],[0.00645268,0.73559,-0.677314,0.0105946],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget safetyleft:=[[60.16,-588.47,602.60],[0.0576312,0.706564,0.70514,-0.0149725],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget safetytool:=[[-335.85,-155.51,572.03],[0.105179,0.891744,0.0895816,-0.430936],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	VAR robtarget Peak1r;
	VAR robtarget Peak2r;
	VAR robtarget Peak3r;
	VAR robtarget Peak4r;
	VAR robtarget Peak5r;
	VAR robtarget Peak6r;
	VAR robtarget Peak1l;
	VAR robtarget Peak2l;
	VAR robtarget Peak3l;
	VAR robtarget Peak4l;
	VAR robtarget Peak5l;
	VAR robtarget Peak6l;
	VAR robtarget s1r;
	VAR robtarget s2r;
	VAR robtarget s3r;
	VAR robtarget s4r;
	VAR robtarget s5r;
	VAR robtarget s6r;
	VAR robtarget s7r;
	VAR robtarget s8r;
	VAR robtarget s9r;
	VAR robtarget s10r;
	VAR robtarget s11r;
	VAR robtarget s12r;
	VAR robtarget s13r;
	VAR robtarget s14r;
	VAR robtarget s15r;
	VAR robtarget s16r;
	VAR robtarget s1l;
	VAR robtarget s2l;
	VAR robtarget s3l;
	VAR robtarget s4l;
	VAR robtarget s5l;
	VAR robtarget s6l;
	VAR robtarget s7l;
	VAR robtarget s8l;
	VAR robtarget s9l;
	VAR robtarget s10l;
	VAR robtarget s11l;
	VAR robtarget s12l;
	VAR robtarget s13l;
	VAR robtarget s14l;
	VAR robtarget s15l;
	VAR robtarget s16l;
	VAR robtarget ss1;
	VAR robtarget ss2;
	VAR robtarget ss3;
	VAR robtarget ss4;
	VAR robtarget ss5;
	VAR robtarget ss6;
	VAR robtarget ss1l;
	VAR robtarget ss2l;
	VAR robtarget ss3l;
	VAR robtarget ss4l;
	VAR robtarget ss5l;
	VAR robtarget ss6l;
	!Declaring frames for 45 angle
	PERS wobjdata Rampframe:=[FALSE,TRUE," ",[[10.96,500.40,97.95],[0.873304640093516,0.487174512460510,0,0]],[[0,0,0],[1,0,0,0]]];
	PERS wobjdata Rampframe2:=[FALSE,TRUE," ",[[60.16,-500.47,50.60],[0.873304640093516,-0.487174512460510,0,0]],[[0,0,0],[1,0,0,0]]];
    !Declaring neccessary variables
    VAR num number_of_orders;
    VAR num number_of_components;
    VAR num answer;
    VAR num answer_plate;
    VAR num number_of_triangles;
    VAR num number_of_squares;
    VAR bool Exit_loop;
    VAR num sensor_triangle:=0; ! correct value is 1
    VAR num sensor_sqaure:=2; !correct value is 2
    VAR num parameter; !new sensor value
    VAR intnum stop_error;
    
	PROC main()
        interruption;
       go_home;
       user_selection; 
       print_choice;
       change_tool;
       printing_triangles;
       IF number_of_squares <> 0 THEN
            change_tool;
       ENDIF
       printing_squares;
       go_home;
       TPWrite "I have finished :)";
    ENDPROC
        
    PROC user_selection()
	TPWrite "Hello!";
    TPReadFK number_of_orders,"Choose the number of orders (MAX 3):","1","2","3", stEmpty, stEmpty;
    FOR a FROM 1 TO number_of_orders DO
        TPWrite "ORDER: " \Num:= a;
        Exit_loop := FALSE;
        number_of_components := 5;
                FOR b FROM 1 TO number_of_components DO
                    IF NOT Exit_loop THEN
                        TPReadFK answer, "Select which figure to cut", "Square","Triangle", "Done", stEmpty, stEmpty;
                            IF answer = 1 THEN
                                number_of_squares := number_of_squares + 1;
                            ENDIF
                            IF answer = 2 THEN
                                 number_of_triangles := number_of_triangles + 1;
                            ENDIF
                            IF answer = 3 THEN
                                Exit_loop := TRUE;
                            ENDIF
                            IF b = 5 THEN
                                Exit_loop := TRUE;
                            ENDIF
                    ENDIF
                ENDFOR
    ENDFOR
	ENDPROC
    
    PROC print_choice()
        TPWrite "Ordered number of squares:" \Num:=number_of_squares;
        TPWrite "Ordered number of triangles:" \Num:=number_of_triangles;
        TPWrite "Optimize order:";
        IF number_of_triangles <> 0 THEN
            FOR i FROM 1 TO number_of_triangles DO
                TPWrite "Triangle";
            ENDFOR
        ENDIF
        IF number_of_squares <> 0 THEN
            FOR g FROM 1 TO number_of_squares DO
                TPWrite "Square";
            ENDFOR
        ENDIF
    ENDPROC
    
    PROC print_triangle_right()
        MOVEJ safetyright,v400,fine,tool0;
		MOVEJ triangleright,v200,fine,tool0;
		
		Peak1r:=offs(triangleright,50,50*sqrt(3),0);
		Peak2r:=offs(Peak1r,50,-50*sqrt(3),0);
		Peak3r:=offs(Peak2r,50,50*sqrt(3),0);
		Peak4r:=offs(Peak3r,50,-50*sqrt(3),0);
		Peak5r:=offs(Peak4r,50,50*sqrt(3),0);
		Peak6r:=offs(Peak5r,50,-50*sqrt(3),0);
			
	 	MOVEL Peak1r,v200,fine,tool0;
		MOVEL Peak2r,v200,fine,tool0;
		MOVEL Peak3r,v200,fine,tool0;
		MOVEL Peak4r,v200,fine,tool0;
		MOVEL Peak5r,v200,fine,tool0;
		MOVEL Peak6r,v200,fine,tool0;
		MOVEL triangleright,v200,fine,tool0;
		MOVEJ safetyright,v200,fine,tool0;
        TPWrite "You can take the plate from the right site";
        MOVEJ home,v400,fine,tool0;
    ENDPROC
    
    PROC print_triangle_left()
        MOVEJ safetyleft,v400,fine,tool0;
		MOVEJ triangleleft,v200,fine,tool0;

		Peak1l:=offs(triangleleft,-50,-50*sqrt(3),0);
		Peak2l:=offs(Peak1l,-50,50*sqrt(3),0);
		Peak3l:=offs(Peak2l,-50,-50*sqrt(3),0);
		Peak4l:=offs(Peak3l,-50,50*sqrt(3),0);
		Peak5l:=offs(Peak4l,-50,-50*sqrt(3),0);
		Peak6l:=offs(Peak5l,-50,50*sqrt(3),0);
			
	 	MOVEL Peak1l,v200,fine,tool0;
		MOVEL Peak2l,v200,fine,tool0;
		MOVEL Peak3l,v200,fine,tool0;
		MOVEL Peak4l,v200,fine,tool0;
		MOVEL Peak5l,v200,fine,tool0;
		MOVEL Peak6l,v200,fine,tool0;

		MOVEL triangleleft,v200,fine,tool0;
		MOVEJ safetyleft,v200,fine,tool0;
        TPWrite "You can take the plate from the left site";
        MOVEJ home,v400,fine,tool0;
    ENDPROC
    
    PROC change_tool()
        TPWrite "I am changing the tool :)";
        MOVEJ safetytool,v400,fine,tool0;
		MOVEJ changetool,v200,fine,tool0;
		MOVEJ safetytool,v200,fine,tool0;
		MOVEJ home,v400,fine,tool0;
    ENDPROC
    
    PROC printing_triangles()
        IF number_of_triangles <> 0 THEN
        FOR i FROM 1 TO number_of_triangles DO
            IF i MOD 2=0 THEN
                TPWrite "Put the plate for the triangle on the LEFT";
                goback:
                TPReadFK answer_plate, "Have you placed the plate?", "Yes",stEmpty,stEmpty, stEmpty, stEmpty;
                    IF answer_plate = 1 THEN
                        IF sensor_triangle = 1 THEN
                            print_triangle_left;    
                        ELSE 
                            TPWrite "You put the wrong plate! Change it for the triangle on the LEFT.";
                            TPReadNum parameter,"Type the new value of sensor (correct value is 1)";
                            sensor_triangle:=parameter;
                            GOTO goback;
                        ENDIF
                    ENDIF
            ELSE
                TPWrite "Put the plate for the triangle on the RIGHT";
                goback2:
                TPReadFK answer_plate, "Have you placed the plate?", "Yes",stEmpty,stEmpty, stEmpty, stEmpty;
                IF answer_plate = 1 THEN
                    IF sensor_triangle = 1 THEN
                            print_triangle_right;    
                        ELSE 
                            TPWrite "You put the wrong plate! Change it for the triangle on the RIGHT .";
                            TPReadNum parameter,"Type the new value of sensor (correct value is 1)";
                            sensor_triangle:=parameter;
                            GOTO goback2;
                        ENDIF             
                ENDIF
            ENDIF
        ENDFOR
        ENDIF
    ENDPROC
    
    PROC print_squares_left()
        MOVEJ safetyleft,v400,fine,tool0;
		MOVEJ squareleft,v200,fine,tool0\wobj:=Rampframe2;
		
		s1l:=offs(squareleft,-50,0,0);
		s2l:=offs(s1l,0,-50,0);
                s3l:=offs(s2l,50,0,0);
		
		MOVEL s1l,v200,fine,tool0\wobj:=Rampframe2;
		MOVEL s2l,v200,fine,tool0\wobj:=Rampframe2;	
		MOVEL s3l,v200,fine,tool0\wobj:=Rampframe2;
		MOVEL squareleft,v200,fine,tool0\wobj:=Rampframe2;
		
		ss1l:=offs(squareleft,0,0,20);
		ss2l:=offs(ss1l,-70,0,0);
		
		MOVEJ ss1l,v200,fine,tool0\wobj:=Rampframe2;
		MOVEJ ss2l,v200,fine,tool0\wobj:=Rampframe2;
		
		s5l:=offs(squareleft,-70,0,0);
		s6l:=offs(s5l,-50,0,0);
                s7l:=offs(s6l,0,-50,0);
		s8l:=offs(s7l,50,0,0);

		MOVEJ s5l,v200,fine,tool0\wobj:=Rampframe2;		
		MOVEL s6l,v200,fine,tool0\wobj:=Rampframe2;
		MOVEL s7l,v200,fine,tool0\wobj:=Rampframe2;	
		MOVEL s8l,v200,fine,tool0\wobj:=Rampframe2;
		MOVEL s5l,v200,fine,tool0\wobj:=Rampframe2;
		
		ss3l:=offs(s5l,0,0,20);
		ss4l:=offs(ss3l,0,-70,0);
		
		MOVEJ ss3l,v200,fine,tool0\wobj:=Rampframe2;
		MOVEJ ss4l,v200,fine,tool0\wobj:=Rampframe2;
		
		s9l:=offs(s5l,0,-70,0);
		s10l:=offs(s9l,-50,0,0);
                s11l:=offs(s10l,0,-50,0);
		s12l:=offs(s11l,50,0,0);

		MOVEJ s9l,v200,fine,tool0\wobj:=Rampframe2;
		MOVEL s10l,v200,fine,tool0\wobj:=Rampframe2;
		MOVEL s11l,v200,fine,tool0\wobj:=Rampframe2;	
		MOVEL s12l,v200,fine,tool0\wobj:=Rampframe2;
		MOVEL s9l,v200,fine,tool0\wobj:=Rampframe2;
		
		ss5l:=offs(s9l,0,0,20);
		ss6l:=offs(ss5l,70,0,0);
		
		MOVEJ ss5l,v200,fine,tool0\wobj:=Rampframe2;
		MOVEJ  ss6l,v200,fine,tool0\wobj:=Rampframe2;
			
		s13l:=offs(s9l,70,00,0);
		s14l:=offs(s13l,-50,0,0);
                s15l:=offs(s14l,0,-50,0);
		s16l:=offs(s15l,50,0,0);
		
		MOVEJ s13l,v200,fine,tool0\wobj:=Rampframe2;
		MOVEL s14l,v200,fine,tool0\wobj:=Rampframe2;
		MOVEL s15l,v200,fine,tool0\wobj:=Rampframe2;	
		MOVEL s16l,v200,fine,tool0\wobj:=Rampframe2;
		MOVEL s13l,v200,fine,tool0\wobj:=Rampframe2;
		
		MOVEJ safetyleft,v200,fine,tool0;
        TPWrite "You can take the plate from the left site";
        MOVEJ home,v400,fine,tool0;
    ENDPROC
    
    PROC print_sqaures_right()
        MOVEJ safetyright,v400,fine,tool0;
		MOVEJ squareright,v200,fine,tool0\wobj:=Rampframe;
		
		s1r:=offs(squareright,-50,0,0);
		s2r:=offs(s1r,0,50,0);
                s3r:=offs(s2r,50,0,0);
		
		MOVEL s1r,v200,fine,tool0\wobj:=Rampframe;
		MOVEL s2r,v200,fine,tool0\wobj:=Rampframe;	
		MOVEL s3r,v200,fine,tool0\wobj:=Rampframe;
		MOVEL squareright,v200,fine,tool0\wobj:=Rampframe;
		
		ss1:=offs(squareright,0,0,20);
		ss2:=offs(ss1,-70,0,0);
		
		MOVEJ ss1,v200,fine,tool0\wobj:=Rampframe;
		MOVEJ ss2,v200,fine,tool0\wobj:=Rampframe;
		
		s5r:=offs(squareright,-70,0,0);
		s6r:=offs(s5r,-50,0,0);
                s7r:=offs(s6r,0,50,0);
		s8r:=offs(s7r,50,0,0);
		
		MOVEJ s5r,v200,fine,tool0\wobj:=Rampframe;
		MOVEL s6r,v200,fine,tool0\wobj:=Rampframe;
		MOVEL s7r,v200,fine,tool0\wobj:=Rampframe;	
		MOVEL s8r,v200,fine,tool0\wobj:=Rampframe;
		MOVEL s5r,v200,fine,tool0\wobj:=Rampframe;
		
		ss3:=offs(s5r,0,0,20);
		ss4:=offs(ss3,0,70,0);
		
		MOVEJ ss3,v200,fine,tool0\wobj:=Rampframe;
		MOVEJ ss4,v200,fine,tool0\wobj:=Rampframe;
		
		s9r:=offs(s5r,0,70,0);
		s10r:=offs(s9r,-50,0,0);
                s11r:=offs(s10r,0,50,0);
		s12r:=offs(s11r,50,0,0);

		MOVEJ s9r,v200,fine,tool0\wobj:=Rampframe;
		MOVEL s10r,v200,fine,tool0\wobj:=Rampframe;
		MOVEL s11r,v200,fine,tool0\wobj:=Rampframe;	
		MOVEL s12r,v200,fine,tool0\wobj:=Rampframe;
		MOVEL s9r,v200,fine,tool0\wobj:=Rampframe;
		
		ss5:=offs(s9r,0,0,20);
		ss6:=offs(ss5,70,0,0);
		
		MOVEJ ss5,v200,fine,tool0\wobj:=Rampframe;
		MOVEJ ss6,v200,fine,tool0\wobj:=Rampframe;
			
		s13r:=offs(s9r,70,0,0);
		s14r:=offs(s13r,-50,0,0);
                s15r:=offs(s14r,0,50,0);
		s16r:=offs(s15r,50,0,0);
		
		MOVEJ s13r,v200,fine,tool0\wobj:=Rampframe;
		MOVEL s14r,v200,fine,tool0\wobj:=Rampframe;
		MOVEL s15r,v200,fine,tool0\wobj:=Rampframe;	
		MOVEL s16r,v200,fine,tool0\wobj:=Rampframe;
		MOVEL s13r,v200,fine,tool0\wobj:=Rampframe;
		
		MOVEJ safetyright,v200,fine,tool0;
        TPWrite "You can take the plate from the right site";
        MOVEJ home,v400,fine,tool0;
    ENDPROC
    
    PROC printing_squares()
        IF number_of_squares <> 0 THEN
        IF number_of_triangles MOD 2 = 0 THEN
            FOR i FROM 1 TO number_of_squares DO
                IF i MOD 2=0 THEN
                    TPWrite "Put the plate for the square on the LEFT";
                    goback3:
                    TPReadFK answer_plate, "Have you placed the plate?", "Yes",stEmpty,stEmpty, stEmpty, stEmpty;
                    IF answer_plate = 1 THEN
                         IF sensor_sqaure = 2 THEN
                            print_squares_left; 
                         ELSE 
                            TPWrite "You put the wrong plate! Change it for the square on the LEFT.";
                            TPReadNum parameter,"Type the new value of sensor (correct value is 2)";
                            sensor_sqaure:=parameter;
                            GOTO goback3;
                        ENDIF
                    ENDIF
                ELSE
                    TPWrite "Put the plate for the square on the RIGHT";
                    goback4:
                    TPReadFK answer_plate, "Have you placed the plate?", "Yes",stEmpty,stEmpty, stEmpty, stEmpty;
                    IF answer_plate = 1 THEN
                        IF sensor_sqaure = 2 THEN
                            print_sqaures_right;
                        ELSE
                            TPWrite "You put the wrong plate! Change it for the square on the RIGHT.";
                            TPReadNum parameter,"Type the new value of sensor (correct value is 2)";
                            sensor_sqaure:=parameter;
                            GOTO goback4;
                        ENDIF
                    ENDIF
                ENDIF
            ENDFOR
        ELSE
            FOR i FROM 1 TO number_of_squares DO
                IF i MOD 2=0 THEN
                    TPWrite "Put the plate for the square on the RIGHT";
                    goback5:
                    TPReadFK answer_plate, "Have you placed the plate?", "Yes",stEmpty,stEmpty, stEmpty, stEmpty;
                    IF answer_plate = 1 THEN
                        IF sensor_sqaure = 2 THEN
                            print_sqaures_right;
                        ELSE
                            TPWrite "You put the wrong plate! Change it for the square on the RIGHT.";
                            TPReadNum parameter,"Type the new value of sensor (correct value is 2)";
                            sensor_sqaure:=parameter;
                            GOTO goback5;
                        ENDIF
                    ENDIF
                ELSE
                     TPWrite "Put the plate for the square on the LEFT";
                     goback6:
                    TPReadFK answer_plate, "Have you placed the plate?", "Yes",stEmpty,stEmpty, stEmpty, stEmpty;
                    IF answer_plate = 1 THEN
                        IF sensor_sqaure = 2 THEN
                            print_squares_left; 
                        ELSE
                            TPWrite "You put the wrong plate! Change it for the square on the LEFT.";
                            TPReadNum parameter,"Type the new value of sensor (correct value is 2)";
                            sensor_sqaure:=parameter;
                            GOTO goback6;
                        ENDIF
                    ENDIF
                ENDIF
            ENDFOR
        ENDIF        
        ENDIF
    ENDPROC
    
    PROC go_home()
        MOVEJ home,v400,fine,tool0;
    ENDPROC
    
    PROC interruption()
        !Declaring stop button
        CONNECT stop_error WITH stop_working;
        ISignalDI Stop0, 1, stop_error;
    ENDPROC
    
    TRAP stop_working
        StopMove;
        WaitDI Stop0, 0; 
        StartMove;
    ENDTRAP
           
ENDMODULE