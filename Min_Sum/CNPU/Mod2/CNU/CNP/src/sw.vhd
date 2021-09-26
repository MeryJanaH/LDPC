--**********************************************************--
-- ENSA FES --
-- Fili�re : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : CNP - SELECTOR
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

ENTITY sw IS PORT(
	L1	 : IN   STD_LOGIC;
	L2	 : IN   STD_LOGIC;
	L3	 : IN   STD_LOGIC;
    Ls   : OUT  STD_LOGIC);
END sw;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF sw IS
	
BEGIN 
PROCESS(L1, L2, L3)
BEGIN
	IF L2 = '0' THEN
		Ls <= L3;
	ELSE
		Ls <= L1;
	END IF;
END PROCESS;
END RTL;
