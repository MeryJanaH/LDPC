
--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : Multiplication
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

ENTITY Mulp_gen IS
	GENERIC (nb : integer RANGE 0 TO 18);
	PORT(
	    bit1  	     : IN  STD_LOGIC;
	    bit2  	     : IN  STD_LOGIC;
	    bit3  	     : IN  STD_LOGIC;
	    bit4     	 : IN  STD_LOGIC;
	    vector_in    : IN  T(nb DOWNTO 0);
	    vector_out   : OUT T(nb DOWNTO 0));
END Mulp_gen;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF Mulp_gen IS
	
BEGIN 
	PROCESS(vector_in)
	BEGIN
		IF bit1='0' OR bit2='0' OR bit3='0' OR bit4='0' THEN
			FOR i IN vector_in'range LOOP
			vector_out(i) <=  ("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000");
			END LOOP;
		ELSE
			FOR i IN vector_in'range LOOP
			vector_out(i) <= vector_in(i);
			END LOOP;
		END IF;
	END PROCESS;
END RTL;


