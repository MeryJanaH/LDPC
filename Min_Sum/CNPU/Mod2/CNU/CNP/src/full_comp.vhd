--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : CNP - Full Comparateur
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

ENTITY full_comp IS PORT(    
	I1	 : IN   sfixed(4 downto -7);
	I2	 : IN   sfixed(4 downto -7);
    B  	 : OUT  sfixed(4 downto -7);
    L    : OUT  STD_LOGIC;
    S    : OUT  sfixed(4 downto -7));
   
END full_comp;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF full_comp IS
	
BEGIN 
PROCESS(I1, I2)
BEGIN
	IF I1 > I2 THEN
		B <= I1;
		S <= I2;
		L <= '1';
	ELSE
		B <= I2;
		S <= I1;
		L <= '0';	
	END IF;
END PROCESS;
END RTL;
