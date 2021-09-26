
--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : Produit du bloc final
--*************************************************************--
--File : src
--***********************************************************
--                             Used Libraries
--***********************************************************--

	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.numeric_std.ALL;
	use IEEE.std_logic_unsigned.all;

	library ieee_proposed;
	use ieee_proposed.fixed_pkg.all;
	
	LIBRARY WORK;
	USE WORK.mem_types.ALL;

--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY prod_final IS
	PORT(
	    Arr        :  IN  T_arry;
	    Orig_sign  :  IN  STD_LOGIC_VECTOR(18 DOWNTO 0);
	    sign_prod  :  IN  STD_LOGIC;	
	    Arr_out    :  OUT T_arry);
END prod_final;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF prod_final IS
	
BEGIN 
PROCESS(Arr)
BEGIN
M : FOR i IN 0 TO 18 LOOP
	IF sign_prod = '0' THEN
		IF Orig_sign(i) = '1' THEN
		Arr_out(i) <= resize((Arr(i) * to_sfixed(-1,4,-7)),4,-7);
		ELSE
		Arr_out(i) <= Arr(i);
		END IF;
	ELSE 
		IF Orig_sign(i) = '1' THEN
		Arr_out(i) <= Arr(i);
		ELSE
		Arr_out(i) <= resize((Arr(i) * to_sfixed(-1,4,-7)),4,-7);
		END IF;	
	END IF;
END LOOP;
END PROCESS;
END RTL;


