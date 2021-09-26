--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : cnp TOP
--*************************************************************--
--File : Test bench
--*************************************************************--
--                             Used Libraries
--*************************************************************--

	LIBRARY ieee_proposed;
	USE ieee_proposed.fixed_pkg.all;
	
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	use IEEE.std_logic_unsigned.all;
	use ieee.numeric_std.all;
	
	LIBRARY WORK;
	USE WORK.mem_types.ALL;
	
--****************************************************--
--					ENTITY DECLARATION
--****************************************************--

--* 1 ==> -1 ; 0 ==> 1*--

ENTITY signe IS PORT(
	Arrey_in  	   : IN  T_arry;
	sign_prod 	   : OUT STD_LOGIC;
	original_signs : OUT STD_LOGIC_VECTOR(18 DOWNTO 0));
END signe;

-- **********************************************************************
-- *                        RTL Description                             *
-- **********************************************************************
ARCHITECTURE RTL OF signe IS 

BEGIN	
PROCESS(Arrey_in)

	VARIABLE count : STD_LOGIC := '0';
	
BEGIN
	count := '0';

    L : FOR i IN 0 TO 18 LOOP   	
		original_signs(i) <= Arrey_in(i)(4);
		count := (count XOR Arrey_in(i)(4));
    END LOOP;  
	sign_prod <= count;
END PROCESS;
END RTL;
