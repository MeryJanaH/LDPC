--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : soucstraction entre columns
--*************************************************************--
--*************************************************************--
--File : src
--*************************************************************--
--                             Used Libraries
--*************************************************************--

	LIBRARY WORK;
	USE WORK.mem_types.ALL;

	LIBRARY ieee_proposed;
	USE ieee_proposed.fixed_pkg.ALL;

	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.numeric_std.ALL;
	use IEEE.std_logic_unsigned.all;
	
--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY sub_cf IS
	PORT(
		R1_LLRf  	 : IN  T1;
	    C1_toVf  	 : IN  T2;
	    Sub_sf		 : OUT T1);
END sub_cf;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF sub_cf IS

	COMPONENT sub_c IS
		PORT(
	    R1_LLR_out  	 : IN  sfixed(4 downto -7);
	    C1_toV_out  	 : IN  sfixed(3 downto -7);
	    Sub_s_out		 : OUT sfixed(4 downto -7));
	END COMPONENT;

BEGIN 
     
    L : FOR i IN C1_toVf'range GENERATE
    a : sub_c PORT MAP(
             C1_toV_out => C1_toVf(i),
             R1_LLR_out => R1_LLRf(i),
             Sub_s_out  => Sub_sf(i));
	END GENERATE;
     
END RTL;


