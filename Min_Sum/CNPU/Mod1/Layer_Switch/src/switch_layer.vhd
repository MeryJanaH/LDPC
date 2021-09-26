--**********************************************************--
-- ENSA FES --
-- Fili�re : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : Switch Layer
--*************************************************************--
--*************************************************************--
--File : src
--*************************************************************--
--                             Used Libraries
--*************************************************************--

	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;

	library ieee_proposed;
	use ieee_proposed.fixed_pkg.all;

	LIBRARY WORK;
	USE WORK.mem_types.ALL;
	
--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY switch_layer IS PORT(
    vn_out    		 : IN  T(15 DOWNTO 0);
    mux_out          : IN  STD_LOGIC_VECTOR(15 downto 0);
    slayer           : OUT T(15 DOWNTO 0));  
END switch_layer;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF switch_layer IS

CONSTANT nb : sfixed := to_sfixed(15,4,-7);	
SIGNAL s_out : T(15 DOWNTO 0);
SIGNAL max_nb : T1 := (nb,nb,nb,nb,nb,nb,nb,nb);

BEGIN

GEN :
   FOR i IN 0 TO 15 GENERATE
		s_out(i) <= max_nb when mux_out(i) = '0'
		ELSE  vn_out(i);
	END GENERATE;

   slayer <= s_out;

END RTL;
