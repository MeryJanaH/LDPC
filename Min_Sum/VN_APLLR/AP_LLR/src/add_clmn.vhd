--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : additionneur de deux colonnes
--*************************************************************--
--File : src
--*************************************************************--
--File : src
--*************************************************************--
--                             Used Libraries
--*************************************************************--

	LIBRARY WORK;
	USE WORK.mem_types.ALL;

	LIBRARY ieee_proposed;
	USE ieee_proposed.fixed_pkg.all;

	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.numeric_std.ALL;
	use IEEE.std_logic_unsigned.all;



--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY add_cf IS
	PORT(
	    LLR_outf  	 : IN  T1;
	    CNP_outf  	 : IN  T1;
	    Add_sf		 : OUT T1);
END add_cf;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF add_cf IS

COMPONENT add_c IS
	PORT(
	    LLR_out  	 : IN  sfixed(4 downto -7);
	    CNP_out  	 : IN  sfixed(4 downto -7);
	    Add_s		 : OUT sfixed(4 downto -7));
END COMPONENT;

BEGIN 

	L : FOR i IN LLR_outf'range GENERATE
    a : add_c PORT MAP(
             LLR_out => LLR_outf(i),
             CNP_out => CNP_outf(i),
             Add_s   => Add_sf(i));
	END GENERATE;

END RTL;