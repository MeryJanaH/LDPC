--***********************************************************************************************************--
--						USED LIBRAIRIES						     --
--***********************************************************************************************************--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.mem_types.ALL;
--*****************************************************************************************************************--
--						ENTITY DECLARATION						   --
--*****************************************************************************************************************--
ENTITY bound IS PORT(
	mem_out : IN T(34 DOWNTO 0);
	cpt : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	LV_b : OUT layer_val;
	COM : OUT INTEGER
);
END bound;
--*****************************************************************************************************************--
--						ARCHITECTURE DESCRIPTION					   --
--*****************************************************************************************************************--
ARCHITECTURE RTL OF bound IS

BEGIN

	COM <= 12 - TO_INTEGER(unsigned(cpt));

	PROCESS(cpt, mem_out)
	VARIABLE sig :  INTEGER;
	BEGIN
		
		sig:= 12 - TO_INTEGER(unsigned(cpt));
		LV_b(sig)<= mem_out;

	END PROCESS;
END RTL;