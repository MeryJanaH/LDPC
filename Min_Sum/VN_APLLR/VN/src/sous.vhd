
--**********************************************************--
-- ENSA FES --
-- Fili�re : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : Soustracteur de deux nombres
--*************************************************************--
--*************************************************************--
--File : src
--*************************************************************--
--                             Used Libraries
--*************************************************************--

	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.numeric_std.ALL;
	use IEEE.std_logic_unsigned.all;

	LIBRARY ieee_proposed;
	USE     ieee_proposed.fixed_pkg.all;

--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY sub_c IS
	PORT(
		R1_LLR_out  	 : IN  sfixed(4 downto -7);
	    C1_toV_out  	 : IN  sfixed(3 downto -7);   
	    Sub_s_out		 : OUT sfixed(4 downto -7));
END sub_c;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF sub_c IS
	
BEGIN 

	Sub_s_out <= (resize(R1_LLR_out,3,-7) - C1_toV_out);

END RTL;


