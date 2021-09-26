
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

	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.numeric_std.ALL;
	use IEEE.std_logic_unsigned.all;
	
--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY Add13 IS
	PORT(
	    enter1  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
	    enter2  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
	    enter3  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
	    enter4  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
	    enter5  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
	    enter6  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
	    enter7  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
	    enter8  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
	    enter9  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
	    enter10  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
	    enter11  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
	    enter12  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
	    enter13  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
	    sortie  	 : OUT  STD_LOGIC_VECTOR(15 DOWNTO 0));
END Add13;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF Add13 IS

BEGIN 

	sortie <=  STD_LOGIC_VECTOR(SIGNED(enter1) + SIGNED(enter2) + SIGNED(enter3) + SIGNED(enter4) + SIGNED(enter5) + SIGNED(enter6) + SIGNED(enter7) +
			SIGNED(enter8) + SIGNED(enter9) + SIGNED(enter10) + SIGNED(enter11) + SIGNED(enter12) + SIGNED(enter13));
	
END RTL;


