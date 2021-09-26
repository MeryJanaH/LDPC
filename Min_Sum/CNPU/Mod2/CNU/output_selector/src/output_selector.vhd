--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : output selector 
--*************************************************************--
--File : src
--*************************************************************--
--                             Used Libraries
--*************************************************************--

	LIBRARY ieee_proposed;
	USE ieee_proposed.fixed_pkg.all;
	
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.numeric_std.ALL;
	use IEEE.std_logic_unsigned.all;
	
	LIBRARY WORK;
	USE WORK.mem_types.ALL;
	
--****************************************************--
--					ENTITY DECLARATION
--****************************************************--

ENTITY selector IS PORT(
    enter  	 	 : IN   STD_LOGIC_VECTOR(4 DOWNTO 0);
    min1 		 : IN   sfixed(4 DOWNTO -7);
	min2 		 : IN   sfixed(4 DOWNTO -7);
	Arrey_out  	 : OUT  T_arry);
END selector;

-- **********************************************************************
-- *                        RTL Description                             *
-- **********************************************************************
ARCHITECTURE RTL OF selector IS 

SIGNAL s_temp_in   :  N_arry;
SIGNAL s_temp      :  STD_LOGIC_VECTOR(18 DOWNTO 0);

SIGNAL enters, temp : STD_LOGIC_VECTOR(4 DOWNTO 0);

	COMPONENT Add19 IS
		PORT(
	    enter    : IN   T_arry;
	    sortie   : OUT  sfixed(4 downto -7));
	END COMPONENT;
	
	COMPONENT mul IS
		PORT(
	    minim    : IN  sfixed(4 downto -7);
	    bit_s    : IN  STD_LOGIC;
	    res_mul  : OUT sfixed(4 downto -7));
	END COMPONENT;
	
	COMPONENT mapp IS
		PORT(
	    enter  	 	 : IN   STD_LOGIC_VECTOR(4 DOWNTO 0);
	    sortie  	 : OUT  STD_LOGIC_VECTOR(18 DOWNTO 0));
	END COMPONENT;
	
BEGIN
	  
	  A : mapp PORT MAP(
	         enter(0)  => enter(4),
             enter(1)  => enter(3),
             enter(2)  => enter(2),
             enter(3)  => enter(1),
             enter(4)  => enter(0),
             sortie  => s_temp);
	
	Ad : FOR i IN 0 TO 18 GENERATE
	  Ad : Add19 PORT MAP(
	         enter  => s_temp_in(i),
             sortie => Arrey_out(i));
    END GENERATE;

    --*1*--
     M : FOR i IN 1 TO 18 GENERATE
	  B : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(0),
             res_mul => s_temp_in(i)(0));  
     END GENERATE;
     
     --*2*--
	  B2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(1),
             res_mul => s_temp_in(0)(1));
             
     M2 : FOR i IN 2 TO 18 GENERATE
	  B2_2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(1),
             res_mul => s_temp_in(i)(1));  
     END GENERATE;
     
     --*3*--    
     M3 : FOR i IN 0 TO 1 GENERATE
	  B3_1 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(2),
             res_mul => s_temp_in(i)(2));  
             
     END GENERATE;
     M3_2 : FOR i IN 3 TO 18 GENERATE
	  B3_2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(2),
             res_mul => s_temp_in(i)(2));  
     END GENERATE;
     
     --*4*--    
     M4 : FOR i IN 0 TO 2 GENERATE
	  B4_1 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(3),
             res_mul => s_temp_in(i)(3));  
             
     END GENERATE;
     M4_2 : FOR i IN 4 TO 18 GENERATE
	  B4_2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(3),
             res_mul => s_temp_in(i)(3));  
     END GENERATE;
     
     --*5*--    
     M5 : FOR i IN 0 TO 3 GENERATE
	  B5_1 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(4),
             res_mul => s_temp_in(i)(4));  
             
     END GENERATE;
     M5_2 : FOR i IN 5 TO 18 GENERATE
	  B5_2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(4),
             res_mul => s_temp_in(i)(4));  
     END GENERATE;
     
     --*6*--    
     M6 : FOR i IN 0 TO 4 GENERATE
	  B6_1 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(5),
             res_mul => s_temp_in(i)(5));  
             
     END GENERATE;
     M6_2 : FOR i IN 6 TO 18 GENERATE
	  B6_2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(5),
             res_mul => s_temp_in(i)(5));  
     END GENERATE;
     
     --*7*--    
     M7 : FOR i IN 0 TO 5 GENERATE
	  B7_1 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(6),
             res_mul => s_temp_in(i)(6));  
             
     END GENERATE;
     M7_2 : FOR i IN 7 TO 18 GENERATE
	  B7_2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(6),
             res_mul => s_temp_in(i)(6));  
     END GENERATE;
  
     
     --*8*--    
     M8 : FOR i IN 0 TO 6 GENERATE
	  B8_1 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(7),
             res_mul => s_temp_in(i)(7));  
             
     END GENERATE;
     M8_2 : FOR i IN 8 TO 18 GENERATE
	  B8_2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(7),
             res_mul => s_temp_in(i)(7));  
     END GENERATE;
     
     
     --*9*--    
     M9 : FOR i IN 0 TO 7 GENERATE
	  B9_1 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(8),
             res_mul => s_temp_in(i)(8));  
             
     END GENERATE;
     M9_2 : FOR i IN 9 TO 18 GENERATE
	  B9_2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(8),
             res_mul => s_temp_in(i)(8));  
     END GENERATE;
     
     
     --*10*--    
     M10 : FOR i IN 0 TO 8 GENERATE
	  B10_1 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(9),
             res_mul => s_temp_in(i)(9));  
             
     END GENERATE;
     M10_2 : FOR i IN 10 TO 18 GENERATE
	  B10_2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(9),
             res_mul => s_temp_in(i)(9));  
     END GENERATE;
     
     
     --*11*--    
     M11 : FOR i IN 0 TO 9 GENERATE
	  B11_1 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(10),
             res_mul => s_temp_in(i)(10));  
             
     END GENERATE;
     M11_2 : FOR i IN 11 TO 18 GENERATE
	  B11_2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(10),
             res_mul => s_temp_in(i)(10));  
     END GENERATE;
     
     
     --*12*--    
     M12 : FOR i IN 0 TO 10 GENERATE
	  B12_1 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(11),
             res_mul => s_temp_in(i)(11));  
             
     END GENERATE;
     M12_2 : FOR i IN 12 TO 18 GENERATE
	  B12_2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(11),
             res_mul => s_temp_in(i)(11));  
     END GENERATE;
     
     
     --*13*--    
     M13 : FOR i IN 0 TO 11 GENERATE
	  B13_1 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(12),
             res_mul => s_temp_in(i)(12));  
             
     END GENERATE;
     M13_2 : FOR i IN 13 TO 18 GENERATE
	  B13_2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(12),
             res_mul => s_temp_in(i)(12));  
     END GENERATE;
     
     
     --*14*--    
     M14 : FOR i IN 0 TO 12 GENERATE
	  B14_1 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(13),
             res_mul => s_temp_in(i)(13));  
             
     END GENERATE;
     M14_2 : FOR i IN 14 TO 18 GENERATE
	  B14_2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(13),
             res_mul => s_temp_in(i)(13));  
     END GENERATE;
     
     
     --*15*--    
     M15 : FOR i IN 0 TO 13 GENERATE
	  B15_1 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(14),
             res_mul => s_temp_in(i)(14));  
             
     END GENERATE;
     M15_2 : FOR i IN 15 TO 18 GENERATE
	  B15_2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(14),
             res_mul => s_temp_in(i)(14));  
     END GENERATE;
     
     
     --*16*--    
     M16 : FOR i IN 0 TO 14 GENERATE
	  B16_1 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(15),
             res_mul => s_temp_in(i)(15));  
             
     END GENERATE;
     M16_2 : FOR i IN 16 TO 18 GENERATE
	  B16_2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(15),
             res_mul => s_temp_in(i)(15));  
     END GENERATE;   
 
     --*17*--    
     M17 : FOR i IN 0 TO 15 GENERATE
	  B17_1 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(16),
             res_mul => s_temp_in(i)(16));  
             
     END GENERATE;
     M17_2 : FOR i IN 17 TO 18 GENERATE
	  B17_2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(16),
             res_mul => s_temp_in(i)(16));  
     END GENERATE;   
     
     --*18*--    
     M18 : FOR i IN 0 TO 16 GENERATE
	  B18_1 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(17),
             res_mul => s_temp_in(i)(17));            
     END GENERATE;

	  B18_2 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(17),
             res_mul => s_temp_in(18)(17));  
             
     --*19*--    
     M19 : FOR i IN 0 TO 17 GENERATE
	  B19_1 : mul PORT MAP(
	         minim   => min1,
             bit_s   => s_temp(18),
             res_mul => s_temp_in(i)(18));   
 	END GENERATE;
    --***********Min2************-
    B_m : FOR i IN 0 TO 18 GENERATE
	  B_m : mul PORT MAP(
         minim   => min2,
         bit_s   => s_temp(i),
         res_mul => s_temp_in(i)(i));
    END GENERATE;   
                       
END RTL;
