
--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : switch et Mux
--*************************************************************--
--File : src
--***********************************************************
--                             Used Libraries
--***********************************************************--

	library ieee_proposed;
	use ieee_proposed.fixed_pkg.all;
	
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.numeric_std.ALL;
	use IEEE.std_logic_unsigned.all;
	
	LIBRARY WORK;
	USE WORK.mem_types.ALL;	

--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY mod1 IS
	PORT(
    switch_in     : IN  T(15 DOWNTO 0);
    countLayer    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    mod1_out      : OUT T(15 DOWNTO 0));
END mod1;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--

ARCHITECTURE RTL OF mod1 IS

SIGNAL vector_outf : STD_LOGIC_VECTOR(15 downto 0);

	COMPONENT switch_layer IS
		PORT(
	    vn_out    		 : IN  T(15 DOWNTO 0);
	    mux_out          : IN  STD_LOGIC_VECTOR(15 downto 0);
	    slayer           : OUT T(15 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT Mux6v1 IS
		PORT(
	    countLayer    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
	    vector_outf   : OUT STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;

BEGIN

s : switch_layer PORT MAP(
		 vn_out  => switch_in,
		 mux_out => vector_outf,
		 slayer  => mod1_out);
	
m : Mux6v1 PORT MAP(
		 countLayer  => countLayer,
		 vector_outf => vector_outf);
		 
END RTL;