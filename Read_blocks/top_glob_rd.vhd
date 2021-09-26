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
ENTITY top_glob_rd IS PORT(
	LC: IN layer_ctrl;
	mem_out : IN T(34 DOWNTO 0);
	cpt : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	vector_out: OUT T(18 DOWNTO 0);
	raw_data: OUT T(15 DOWNTO 0);
	ind : OUT index(18 DOWNTO 0);
	used_layer : OUT shift
);
END top_glob_rd;
--*****************************************************************************************************************--
--						ARCHITECTURE DESCRIPTION					   --
--*****************************************************************************************************************--
ARCHITECTURE RTL OF top_glob_rd IS

COMPONENT bound IS PORT(
	mem_out : IN T(34 DOWNTO 0);
	cpt : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	LV_b : OUT layer_val;
	COM : OUT INTEGER);
END COMPONENT;

COMPONENT top_rd IS PORT(
	LV: IN layer_val;
	LC: IN layer_ctrl;
	COM: IN INTEGER;
	vector_out: OUT T(18 DOWNTO 0);
	raw_data: OUT T(15 DOWNTO 0);
	ind : OUT index(18 DOWNTO 0);
	used_layer : OUT shift
);
END COMPONENT;
SIGNAL sig1: layer_val;
SIGNAL sig2 : INTEGER;
BEGIN
	inst1 : bound PORT MAP (
		mem_out => mem_out,
		cpt => cpt,
		LV_b => sig1,
		COM => sig2 );
	
	inst2 : top_rd PORT MAP(
		LV => sig1,
		LC => LC,
		COM => sig2,
		vector_out => vector_out,
		raw_data => raw_data,
		ind => ind,
		used_layer => used_layer);

END RTL;