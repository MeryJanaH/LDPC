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
ENTITY top_rd IS PORT(
	LC: IN layer_ctrl;
	mem_out : IN T(34 DOWNTO 0);
	cpt : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	vector_out: OUT T(18 DOWNTO 0);
	R19: OUT T(15 DOWNTO 0);
	I19: OUT index(18 DOWNTO 0);
	R10: OUT T(24 DOWNTO 0);
	I10: OUT index(9 DOWNTO 0);
	R9: OUT T(25 DOWNTO 0);
	I9: OUT index(8 DOWNTO 0);
	R8: OUT T(26 DOWNTO 0);
	I8: OUT index(7 DOWNTO 0);
	R7: OUT T(27 DOWNTO 0);
	I7: OUT index(6 DOWNTO 0);
	R3: OUT T(31 DOWNTO 0);
	I3:  OUT index(2 DOWNTO 0);
	COM : OUT INTEGER;
	used_layer : OUT shift
);
END top_rd;
--*****************************************************************************************************************--
--						ARCHITECTURE DESCRIPTION					   --
--*****************************************************************************************************************--
ARCHITECTURE RTL OF top_rd IS

COMPONENT bound IS PORT(
	mem_out : IN T(34 DOWNTO 0);
	cpt : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	LV_b : OUT layer_val;
	COM : OUT INTEGER);
END COMPONENT;

COMPONENT inter_rd_top IS PORT(
	LV: IN layer_val;
	LC: IN layer_ctrl;
	COM: IN INTEGER;
	S19: OUT T(18 DOWNTO 0);
	R19: OUT T(15 DOWNTO 0);
	I19: OUT index(18 DOWNTO 0);
	R10: OUT T(24 DOWNTO 0);
	I10: OUT index(9 DOWNTO 0);
	R9: OUT T(25 DOWNTO 0);
	I9: OUT index(8 DOWNTO 0);
	R8: OUT T(26 DOWNTO 0);
	I8: OUT index(7 DOWNTO 0);
	R7: OUT T(27 DOWNTO 0);
	I7: OUT index(6 DOWNTO 0);
	R3: OUT T(31 DOWNTO 0);
	I3:  OUT index(2 DOWNTO 0));
END COMPONENT;
COMPONENT barrel_shifter_rd PORT(
	vector_in: IN T(18 DOWNTO 0);
	shifter_vector: IN shift;
	vector_out: OUT T(18 DOWNTO 0));
END COMPONENT;
COMPONENT control_filter_19 IS PORT(
	C: IN control;
	S: OUT shift);
END COMPONENT;
SIGNAL swire19 : T(18 DOWNTO 0);
SIGNAL cwire : shift;
SIGNAL lcwire,owire : control;
SIGNAL sig1: layer_val;
SIGNAL sig2 : INTEGER;
BEGIN
	U0 : bound PORT MAP (
		mem_out => mem_out,
		cpt => cpt,
		LV_b => sig1,
		COM => sig2 );
	
	U1: inter_rd_top PORT MAP(
		LV => sig1,
		LC => LC,
		COM => sig2,
		S19 => swire19,
		R19 => R19,
		I19 => I19,
		R10 => R10,
		I10 => I10,
		R9 => R9,
		I9 => I9,
		R8 => R8,
		I8 => I8,
		R7 => R7,
		I7 => I7,
		R3 => R3,
		I3 => I3);
	U2: control_filter_19 PORT MAP(
		C => lcwire,
		S => cwire);
	U3: barrel_shifter_rd PORT MAP(
		vector_in => swire19,
		shifter_vector => cwire,
		vector_out => vector_out);
	used_layer <= cwire;
	COM <= sig2;
	WITH sig2 SELECT
		lcwire  <= LC(12) WHEN 12,
		       	  LC(11) WHEN 11,
			  LC(10) WHEN 10,
			  LC(9) WHEN 9,
			  LC(8) WHEN 8,
			  LC(7) WHEN 7,
			  LC(6) WHEN 6,
			  LC(5) WHEN 5,
			  LC(4) WHEN 4,
			  LC(3) WHEN 3,
			  LC(2) WHEN 2,
			  LC(1) WHEN 1,
			  LC(0) WHEN 0,		
		       	  owire WHEN OTHERS;
	
END RTL;

