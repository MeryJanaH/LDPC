
--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : mapping 
--*************************************************************--
--File : src
--***********************************************************
--                             Used Libraries
--***********************************************************--
	LIBRARY ieee_proposed;
	USE ieee_proposed.fixed_pkg.all;
	
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.numeric_std.ALL;
	use IEEE.std_logic_unsigned.all;
	
--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY mapp IS
	PORT(
	    enter  	 	 : IN   STD_LOGIC_VECTOR(4 DOWNTO 0);
	    sortie  	 : OUT  STD_LOGIC_VECTOR(18 DOWNTO 0));
END mapp;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF mapp IS

SIGNAL e1, e2, e3, e4, e5 : STD_LOGIC;
SIGNAL s1, s2, s3, s4, s5 : STD_LOGIC_VECTOR(18 DOWNTO 0);

BEGIN 

	e1 <= NOT(enter(0));
	e2 <= NOT(enter(1));
	e3 <= NOT(enter(2));
	e4 <= NOT(enter(3));
	e5 <= NOT(enter(4));
	
 M1: FOR i in 0 TO 15 GENERATE
	s1(i) <= e1;
	END GENERATE;

 M2: FOR i in 16 TO 18 GENERATE
	s1(i) <= enter(0);
	 END GENERATE;

 M3: FOR i in 0 TO 7 GENERATE
	s2(i) <= e2;
	END GENERATE;

 M4: FOR i in 16 TO 18 GENERATE
	s2(i) <= e2;
	END GENERATE;

 M5: FOR i in 8 TO 15 GENERATE
	s2(i) <= enter(1);
	END GENERATE;
	
 M6: FOR i in 0 TO 3 GENERATE
	s3(i) <= e3;
	END GENERATE;
	
 M7: FOR i in 8 TO 11 GENERATE
	s3(i) <= e3;
	END GENERATE;	
	
 M8: FOR i in 16 TO 18 GENERATE
	s3(i) <= e3;
	END GENERATE;

 M9: FOR i in 4 TO 7 GENERATE
	s3(i) <= enter(2);
	END GENERATE;
	
 M10: FOR i in 12 TO 15 GENERATE
	s3(i) <= enter(2);
	END GENERATE;
	
   s4(0)  <= e4;
   s4(1)  <= e4;
   s4(2)  <= enter(3);
   s4(3)  <= enter(3);
   s4(4)  <= e4;
   s4(5)  <= e4;
   s4(6)  <= enter(3);
   s4(7)  <= enter(3);
   s4(8)  <= e4;
   s4(9)  <= e4;
   s4(10) <= enter(3);
   s4(11) <= enter(3);
   s4(12) <= e4;
   s4(13) <= e4;
   s4(14) <= enter(3);
   s4(15) <= enter(3);
   s4(16) <= e4;
   s4(17) <= e4;   
   s4(18) <= enter(3);   
 
   s5(0)  <= e5;
   s5(1)  <= enter(4);
   s5(2)  <= e5;
   s5(3)  <= enter(4);
   s5(4)  <= e5;
   s5(5)  <= enter(4);
   s5(6)  <= e5;
   s5(7)  <= enter(4);
   s5(8)  <= e5;
   s5(9)  <= enter(4);
   s5(10) <= e5;
   s5(11) <= enter(4);
   s5(12) <= e5;
   s5(13) <= enter(4);
   s5(14) <= e5;
   s5(15) <= enter(4);
   s5(16) <= e5;
   s5(17) <= enter(4);   
   s5(18) <= e5;   
  
 M11: FOR i in 0 TO 18 GENERATE
	sortie(i) <= (s1(i) AND s2(i) AND s3(i) AND s4(i) AND s5(i));
	END GENERATE;   
 
END RTL;


