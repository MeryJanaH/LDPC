--********************--
-- ENSA FES --
-- Filière : GSEII2
--********************--
--Title : Min-Sum Algorithm
--Block : TOP rassemblage
--*********************--
--File : SRC
--*********************--
--                             Used Libraries
--*********************--
	
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.NUMERIC_STD.ALL;

	LIBRARY WORK;
	USE WORK.mem_types.ALL;
		
--******************--
--					ENTITY DECLARATION
--******************--
ENTITY TOP IS PORT(	
	LC			: IN  layer_ctrl;
	receive_llr : IN  T(34 DOWNTO 0);
	vector_out  : OUT T(34 DOWNTO 0);
	clk 		: IN STD_LOGIC;
	rst 		: IN STD_LOGIC;
	count_layer : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	mem_adr 	: IN STD_LOGIC);
END TOP;

-- ********
-- *                        RTL Description                             *
-- ********

ARCHITECTURE RTL OF TOP IS 
	
SIGNAL sig2      : Tb(18 downto 0);
SIGNAL sig1, dsig1,vect2, sig3, sig4, usig5, sig5 : T(18 downto 0);
SIGNAL shift_wire  : shift;
SIGNAL sig6, sigf  : T(34 DOWNTO 0);
SIGNAL COM: INTEGER;
SIGNAL	R19: T(15 DOWNTO 0);
SIGNAL	I19: index(18 DOWNTO 0);
SIGNAL	R10: T(24 DOWNTO 0);
SIGNAL	I10: index(9 DOWNTO 0);
SIGNAL	R9: T(25 DOWNTO 0);
SIGNAL	I9: index(8 DOWNTO 0);
SIGNAL	R8: T(26 DOWNTO 0);
SIGNAL	I8: index(7 DOWNTO 0);
SIGNAL	R7: T(27 DOWNTO 0);
SIGNAL	I7: index(6 DOWNTO 0);
SIGNAL	R3: T(31 DOWNTO 0);
SIGNAL	I3: index(2 DOWNTO 0);

COMPONENT top_rd IS PORT(
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
END COMPONENT;

COMPONENT CNPU IS
	PORT(
	count_layer	   : IN   STD_LOGIC_VECTOR(3 DOWNTO 0);
	vnpu_out  	   : IN   T(18 DOWNTO 0);
	cnpu_out  	   : OUT  T(18 DOWNTO 0));
END COMPONENT;

COMPONENT LLR IS
	PORT(
    LLR_outf  	 : IN  T(18 DOWNTO 0);
    CNP_outf  	 : IN  T(18 DOWNTO 0);
    Add_sf    	 : OUT T(18 DOWNTO 0));
END COMPONENT;

COMPONENT VN IS
	PORT(
    R_LLR_outf   : IN  T(18 downto 0);
    C_toV_outf   : IN  Tb(18 downto 0);
    Subsf      	 : OUT T(18 downto 0));  
END COMPONENT;

COMPONENT memories IS
	PORT(
    C_to_V  	 : IN   T(18 DOWNTO 0);
    Count_layer  : IN   STD_LOGIC_VECTOR(3 DOWNTO 0);
    Mem_in       : IN   T(34 DOWNTO 0);
    Mem_adr      : IN   STD_LOGIC;
    CLK          : IN   STD_LOGIC;
    reset        : IN   STD_LOGIC;
    Receiv_LLR   : IN   T(34 DOWNTO 0);
    C_to_V_out   : OUT  T(18 DOWNTO 0);
    Receiv_LLR2  : OUT  T(34 DOWNTO 0));
END COMPONENT;

COMPONENT conv_T2Tb IS PORT(
	R: IN T(18 DOWNTO 0);
	S : OUT Tb(18 DOWNTO 0)
);
END COMPONENT;

COMPONENT up_down IS PORT(
	A: IN T(18 DOWNTO 0);
	S: OUT T(18 DOWNTO 0));
END COMPONENT;

COMPONENT down_up IS PORT(
	A: IN T(18 DOWNTO 0);
	S: OUT T(18 DOWNTO 0));
END COMPONENT;

COMPONENT top_wt IS
PORT( 
	COM : IN INTEGER;
	vector_in: IN T(18 DOWNTO 0);
	R19: IN T(15 DOWNTO 0);
	I19: IN index(18 DOWNTO 0);
	R10: IN T(24 DOWNTO 0);
	I10: IN index(9 DOWNTO 0);
	R9: IN T(25 DOWNTO 0);
	I9: IN index(8 DOWNTO 0);
	R8: IN T(26 DOWNTO 0);
	I8: IN index(7 DOWNTO 0);
	R7: IN T(27 DOWNTO 0);
	I7: IN index(6 DOWNTO 0);
	R3: IN T(31 DOWNTO 0);
	I3:  IN index(2 DOWNTO 0);
	used_layer : IN shift;
	vector_out : OUT T(34 DOWNTO 0)
);
END COMPONENT;
BEGIN 

tp0: top_rd PORT MAP(
	LC => LC,
	mem_out => sig6,
	cpt => count_layer,
	vector_out => sig1,
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
	I3 => I3,
	COM => COM,
	used_layer => shift_wire
);   

tp1 : up_down PORT MAP(
	A => sig1,
	S => dsig1);

tp2 : CNPU PORT MAP(
	count_layer	 => count_layer,
	vnpu_out  	 => sig3,
	cnpu_out  	 => sig4);

tp3 : LLR PORT MAP(
    LLR_outf  	 => sig3,
    CNP_outf  	 => sig4,
    Add_sf    	 => sig5);

tp4 : VN PORT MAP(
    R_LLR_outf   => dsig1,
    C_toV_outf   => sig2,
    Subsf      	 => sig3);

tp5 : memories PORT MAP(
    C_to_V  	 => sig4,
    Count_layer  => count_layer,
    Mem_in       => sigf,
    Mem_adr      => mem_adr,
    CLK          => clk,
    reset        => rst,
    Receiv_LLR   => receive_llr,
    C_to_V_out   => vect2,
    Receiv_LLR2  => sig6 );


tp6: conv_T2Tb PORT MAP(
	R => vect2,
	S => sig2);

tp7: down_up PORT MAP(
	A => sig5,
	S => usig5);

tp8: top_wt PORT MAP( 
	COM => COM,
	vector_in => usig5,
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
	I3 => I3,
	used_layer => shift_wire,
	vector_out => sigf
);

vector_out <= sigf;

END RTL;