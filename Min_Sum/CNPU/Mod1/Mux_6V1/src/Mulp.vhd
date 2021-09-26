
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

--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY Mulp IS
	PORT(
	    bit1  	     : IN  STD_LOGIC;
	    bit2  	     : IN  STD_LOGIC;
	    bit3  	     : IN  STD_LOGIC;
	    bit4     	 : IN  STD_LOGIC;
	    vector_in    : IN  STD_LOGIC_VECTOR(15 downto 0);
	    vector_out   : OUT STD_LOGIC_VECTOR(15 downto 0));
END Mulp;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF Mulp IS
	
BEGIN 
	PROCESS(bit1,bit2,bit3,bit4)
	BEGIN
		IF bit1='0' OR bit2='0' OR bit3='0' OR bit4='0' THEN
			vector_out <= (OTHERS => '0');
		ELSE
			vector_out <= vector_in;
		END IF;
	END PROCESS;
END RTL;


