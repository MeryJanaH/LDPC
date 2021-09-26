
--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : Addition
--*************************************************************--
--File : src
--***********************************************************
--                             Used Libraries
--***********************************************************--
	LIBRARY ieee_proposed;
	USE ieee_proposed.fixed_pkg.all;
	
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.numeric_std.ALL;
	use IEEE.std_logic_unsigned.all;
	
	LIBRARY WORK;
	USE WORK.mem_types.ALL;
	
--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY mul IS
	PORT(
	    minim    : IN  sfixed(4 downto -7);
	    bit_s    : IN  STD_LOGIC;
	    res_mul  : OUT sfixed(4 downto -7));
END mul;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF mul IS

BEGIN 

	res_mul <= resize((minim AND bit_s),4,-7);
	
END RTL;


