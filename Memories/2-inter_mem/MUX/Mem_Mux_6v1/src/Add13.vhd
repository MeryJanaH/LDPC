
--**********************************************************--
-- ENSA FES --
-- Fili�re : GSEII2
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
	
	LIBRARY WORK;
	USE WORK.mem_types.ALL;
	
--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY Add13_mem IS 
	PORT(
	    countLayer   : IN   STD_LOGIC_VECTOR(3 DOWNTO 0);
	    enter1  	 : IN   T(18 DOWNTO 0);
	    enter2  	 : IN   T(18 DOWNTO 0);
	    enter3  	 : IN   T(18 DOWNTO 0);
	    enter4  	 : IN   T(18 DOWNTO 0);
	    enter5  	 : IN   T(18 DOWNTO 0);
	    enter6  	 : IN   T(18 DOWNTO 0);
	    enter7  	 : IN   T(18 DOWNTO 0);
	    enter8  	 : IN   T(18 DOWNTO 0);
	    enter9  	 : IN   T(18 DOWNTO 0);
	    enter10  	 : IN   T(18 DOWNTO 0);
	    enter11  	 : IN   T(18 DOWNTO 0);
	    enter12  	 : IN   T(18 DOWNTO 0);
	    enter13  	 : IN   T(18 DOWNTO 0);
	    sortie  	 : OUT  T(18 DOWNTO 0));
END Add13_mem;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF Add13_mem IS

SIGNAL temp : T(18 DOWNTO 0) := (("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),
						("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),
						("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),
						("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),
						("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"),("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000"));
BEGIN 
	PROCESS(enter1, enter2, enter3, enter4, enter5, enter6, enter7, enter8, enter9, enter10, enter11, enter12, enter13)
	BEGIN
		IF countLayer = "0000" THEN
		sortie <= enter1;
		ELSIF countLayer = "0001" THEN 
		sortie <= enter2;
		ELSIF countLayer = "0010" THEN 
		sortie <= enter3;
		ELSIF countLayer = "0011" THEN 
		sortie <= enter4;
		ELSIF countLayer = "0100" THEN 
		sortie <= enter5;
		ELSIF countLayer = "0101" THEN 
		sortie <= enter6;
		ELSIF countLayer = "0110" THEN 
		sortie <= enter7;
		ELSIF countLayer = "0111" THEN 
		sortie <= enter8;
		ELSIF countLayer = "1000" THEN 
		sortie <= enter9;
		ELSIF countLayer = "1001" THEN 
		sortie <= enter10;
		ELSIF countLayer = "1010" THEN 
		sortie <= enter11;
		ELSIF countLayer = "1011" THEN 
		sortie <= enter12;
		ELSIF countLayer = "1100" THEN 
		sortie <= enter13;
		ELSE
		sortie <= temp;
		END IF;
	END PROCESS;
END RTL;

