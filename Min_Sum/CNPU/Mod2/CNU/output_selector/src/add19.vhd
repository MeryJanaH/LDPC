
--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : Addition
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
	
	LIBRARY WORK;
	USE WORK.mem_types.ALL;
	
--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY Add19 IS
	PORT(
	    enter    : IN   T_arry;
	    sortie   : OUT  sfixed(4 downto -7));
END Add19;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF Add19 IS

BEGIN 

sortie <= resize((enter(0) + enter(1) + enter(2) + enter(3) + enter(4) + enter(5) + enter(6) + enter(7) + enter(8) + enter(9)
			+ enter(10) + enter(11) + enter(12) + enter(13) + enter(14) + enter(15) + enter(16) + enter(17) + enter(18)),4,-7);

END RTL;


