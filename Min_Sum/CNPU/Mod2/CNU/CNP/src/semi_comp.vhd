--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : CNP - Semi Comparateur
--*************************************************************--
--*************************************************************--
--File : src
--*************************************************************--
--                             Used Libraries
--*************************************************************--

	LIBRARY ieee_proposed;
	USE ieee_proposed.fixed_pkg.all;

	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	
--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY semi_comp IS PORT(    
	I1	 : IN   sfixed(4 downto -7);
	I2	 : IN   sfixed(4 downto -7);
    S    : OUT  sfixed(4 downto -7));
END semi_comp;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF semi_comp IS
	
BEGIN 
PROCESS(I1, I2)
BEGIN
	IF I1 > I2 THEN
		S <= I2;
	ELSE
		S <= I1;
	END IF;
END PROCESS;
END RTL;
