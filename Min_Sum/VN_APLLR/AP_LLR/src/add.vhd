
--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : additionneur de deux nombres
--*************************************************************--
--File : src
--*************************************************************--
--                             Used Libraries
--*************************************************************--

	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.numeric_std.ALL;
	use IEEE.std_logic_unsigned.all;

	library ieee_proposed;
	use ieee_proposed.fixed_pkg.all;

--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY add_c IS
	PORT(
	    LLR_out  	 : IN  sfixed(4 downto -7);
	    CNP_out  	 : IN  sfixed(4 downto -7);
	    Add_s		 : OUT sfixed(4 downto -7));
END add_c;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF add_c IS
	
BEGIN 

	Add_s <= resize((LLR_out + CNP_out),4,-7);

END RTL;


