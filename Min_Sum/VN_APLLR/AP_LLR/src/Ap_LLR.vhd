--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : VN
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
	
--************************************************************--
--                            ENTITY Declaration
--************************************************************--

--***2 ligne et 3 colonnes***-- 

ENTITY LLR IS PORT(
    LLR_outf  	 : IN  T(18 DOWNTO 0);
    CNP_outf  	 : IN  T(18 DOWNTO 0);
    Add_sf    	 : OUT T(18 DOWNTO 0));
END LLR;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF LLR IS
	
		COMPONENT add_cf IS 
		PORT(
	    LLR_outf  	 : IN  T1;
	    CNP_outf  	 : IN  T1;
	    Add_sf		 : OUT T1);
		END COMPONENT;
		
BEGIN 

   GEN_LIGNE: 
   FOR i IN 0 TO 18 GENERATE
      a : add_cf port map(
             LLR_outf => LLR_outf(i),
             CNP_outf => CNP_outf(i),
             Add_sf   => Add_sf(i));
      
   END GENERATE GEN_LIGNE;
    
END RTL;
