--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : VN
--*************************************************************--
--*************************************************************--
--File : src
--*************************************************************--
--                             Used Libraries
--*************************************************************--
	
	library ieee_proposed;
	use ieee_proposed.fixed_pkg.all;
	
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	
	LIBRARY WORK;
	USE WORK.mem_types.ALL;
	
--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY VN IS PORT(
    R_LLR_outf   : IN  T(18 downto 0);
    C_toV_outf   : IN  Tb(18 downto 0);
    Subsf      	 : OUT T(18 downto 0));  
END VN;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF VN IS
	
		COMPONENT sub_cf IS
		PORT(
		R1_LLRf  	 : IN  T1;
	    C1_toVf  	 : IN  T2;
	    Sub_sf		 : OUT T1);
		END COMPONENT;
		
BEGIN 

   GEN_LIGNE: 
   FOR i IN 0 TO 18 GENERATE
      v : sub_cf port map(
             C1_toVf => C_toV_outf(i),
             R1_LLRf => R_LLR_outf(i),
             Sub_sf  => Subsf(i));
      
   END GENERATE GEN_LIGNE;
    
END RTL;
