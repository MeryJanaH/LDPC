--**********************************************************--
-- ENSA FES --
-- Fili�re : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : Switch Code Generator memory
--*************************************************************--
--*************************************************************--
--File : src
--*************************************************************--
--                             Used Libraries
--*************************************************************--

	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.numeric_std.ALL;
	use IEEE.std_logic_unsigned.all;

	LIBRARY WORK;
	USE WORK.mem_types.ALL;
	
--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY switch_mem IS PORT(  
    recv_LLR  	 : IN  T(34 DOWNTO 0);
    Code_gen   	 : IN  T(34 DOWNTO 0);
    MemAdr		 : IN  STD_LOGIC;
    switch_out   : OUT T(34 DOWNTO 0));      
END switch_mem;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF switch_mem IS
			
BEGIN 

PROCESS(MemAdr,Code_gen, recv_LLR)
BEGIN
	IF MemAdr = '1' THEN
		switch_out <= recv_LLR;
	ELSE
		switch_out <= Code_gen;
	END IF;
END PROCESS;
END RTL;
