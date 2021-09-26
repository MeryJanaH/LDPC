
--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : Part 2
--*************************************************************--
--File : src
--***********************************************************
--                             Used Libraries
--***********************************************************--

	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.numeric_std.ALL;
	use IEEE.std_logic_unsigned.all;

	LIBRARY WORK;
	USE WORK.mem_types.ALL;

--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY mod2 IS
	PORT(
    mod2_in     : IN  T(18 DOWNTO 0);
    mod2_out    : OUT T(18 DOWNTO 0));
END mod2;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF mod2 IS

	COMPONENT CNU IS
		PORT(
		Arrey_in  	   : IN   T_arry;
		Arrey_out  	   : OUT  T_arry);
	END COMPONENT;
	
BEGIN

bn : FOR i IN 0 TO 7 GENERATE
	cn : CNU PORT MAP(
		 Arrey_in(0)   => mod2_in(0)(i),
		 Arrey_in(1)   => mod2_in(1)(i),
		 Arrey_in(2)   => mod2_in(2)(i),
		 Arrey_in(3)   => mod2_in(3)(i),
		 Arrey_in(4)   => mod2_in(4)(i),
		 Arrey_in(5)   => mod2_in(5)(i),
		 Arrey_in(6)   => mod2_in(6)(i),
		 Arrey_in(7)   => mod2_in(7)(i),
		 Arrey_in(8)   => mod2_in(8)(i),
		 Arrey_in(9)   => mod2_in(9)(i),
		 Arrey_in(10)  => mod2_in(10)(i),
		 Arrey_in(11)  => mod2_in(11)(i),
		 Arrey_in(12)  => mod2_in(12)(i),
		 Arrey_in(13)  => mod2_in(13)(i),
		 Arrey_in(14)  => mod2_in(14)(i),
		 Arrey_in(15)  => mod2_in(15)(i),
		 Arrey_in(16)  => mod2_in(16)(i),
		 Arrey_in(17)  => mod2_in(17)(i),
		 Arrey_in(18)  => mod2_in(18)(i),
		 Arrey_out(0)  => mod2_out(0)(i),
		 Arrey_out(1)  => mod2_out(1)(i),
		 Arrey_out(2)  => mod2_out(2)(i),
		 Arrey_out(3)  => mod2_out(3)(i),
		 Arrey_out(4)  => mod2_out(4)(i),
		 Arrey_out(5)  => mod2_out(5)(i),
		 Arrey_out(6)  => mod2_out(6)(i),
		 Arrey_out(7)  => mod2_out(7)(i),
		 Arrey_out(8)  => mod2_out(8)(i),
		 Arrey_out(9)  => mod2_out(9)(i),
		 Arrey_out(10) => mod2_out(10)(i),
		 Arrey_out(11) => mod2_out(11)(i),
		 Arrey_out(12) => mod2_out(12)(i),
		 Arrey_out(13) => mod2_out(13)(i),
		 Arrey_out(14) => mod2_out(14)(i),
		 Arrey_out(15) => mod2_out(15)(i),
		 Arrey_out(16) => mod2_out(16)(i),
		 Arrey_out(17) => mod2_out(17)(i),
		 Arrey_out(18) => mod2_out(18)(i));
END GENERATE;
		 
END RTL;