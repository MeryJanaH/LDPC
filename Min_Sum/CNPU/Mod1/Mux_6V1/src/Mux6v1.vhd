
--**********************************************************--
-- ENSA FES --
-- Fili�re : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : Mux TOP
--*************************************************************--
--File : src
--***********************************************************
--                             Used Libraries
--***********************************************************--
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.numeric_std.ALL;
	use IEEE.std_logic_unsigned.all;

--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY Mux6v1 IS
	PORT(
	    countLayer    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
	    vector_outf   : OUT STD_LOGIC_VECTOR(15 downto 0));
END Mux6v1;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF Mux6v1 IS

	CONSTANT dc19 : STD_LOGIC_VECTOR(15 downto 0) := (OTHERS => '1');
	CONSTANT dc_3 : STD_LOGIC_VECTOR(15 downto 0) := (OTHERS => '0');
	CONSTANT dc8  : STD_LOGIC_VECTOR(15 downto 0) := "0000000000011111";
	CONSTANT dc9  : STD_LOGIC_VECTOR(15 downto 0) := "0000000000111111";
	CONSTANT dc7  : STD_LOGIC_VECTOR(15 downto 0) := "0000000000001111";
	CONSTANT dc10 : STD_LOGIC_VECTOR(15 downto 0) := "0000000001111111";
	
	SIGNAL enter1, enter2, enter3, enter4, enter5, enter6, enter7, enter8, enter9, enter10, enter11, enter12, enter13 : STD_LOGIC_VECTOR(15 downto 0);
	
	SIGNAL c0 : STD_LOGIC;
    SIGNAL c1 : STD_LOGIC;
    SIGNAL c2 : STD_LOGIC;
    SIGNAL c3 : STD_LOGIC;

	COMPONENT Mulp IS
		PORT(
	    bit1  	     : IN  STD_LOGIC;
	    bit2  	     : IN  STD_LOGIC;
	    bit3  	     : IN  STD_LOGIC;
	    bit4     	 : IN  STD_LOGIC;
	    vector_in    : IN  STD_LOGIC_VECTOR(15 downto 0);
	    vector_out   : OUT STD_LOGIC_VECTOR(15 downto 0));
	END COMPONENT;
	
	COMPONENT Add13 IS
		PORT(
		    enter1  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
		    enter2  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
		    enter3  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
		    enter4  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
		    enter5  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
		    enter6  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
		    enter7  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
		    enter8  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
		    enter9  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
		    enter10  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
		    enter11  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
		    enter12  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
		    enter13  	 : IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
		    sortie  	 : OUT  STD_LOGIC_VECTOR(15 DOWNTO 0));
	END COMPONENT;

BEGIN 

	c0 <= NOT(countLayer(0));
	c1 <= NOT(countLayer(1));
	c2 <= NOT(countLayer(2));
	c3 <= NOT(countLayer(3));
	
   M1 : Mulp PORT MAP(
         bit1        => c0,
         bit2        => c1,
         bit3        => c2,
         bit4        => c3,
         vector_in   => dc19,
         vector_out  => enter1);
   
   M2 : Mulp PORT MAP(
         bit1        => countLayer(0),
         bit2        => c1,
         bit3        => c2,
         bit4        => c3,
         vector_in   => dc19,
         vector_out  => enter2);
   
   M3 : Mulp PORT MAP(
         bit1        => c0,
         bit2        => countLayer(1),
         bit3        => c2,
         bit4        => c3,
         vector_in   => dc19,
         vector_out  => enter3);
   
   M4 : Mulp PORT MAP(
         bit1        => countLayer(0),
         bit2        => countLayer(1),
         bit3        => c2,
         bit4        => c3,
         vector_in   => dc19,
         vector_out  => enter4);
   
   M5 : Mulp PORT MAP(
         bit1        => c0,
         bit2        => c1,
         bit3        => countLayer(2),
         bit4        => c3,
         vector_in   => dc_3,
         vector_out  => enter5);
   
   M6 : Mulp PORT MAP(
         bit1        => countLayer(0),
         bit2        => c1,
         bit3        => countLayer(2),
         bit4        => c3,
         vector_in   => dc8,
         vector_out  => enter6);
   
   M7 : Mulp PORT MAP(
         bit1        => c0,
         bit2        => countLayer(1),
         bit3        => countLayer(2),
         bit4        => c3,
         vector_in   => dc9,
         vector_out  => enter7);
   
   M8 : Mulp PORT MAP(
         bit1        => countLayer(0),
         bit2        => countLayer(1),
         bit3        => countLayer(2),
         bit4        => c3,
         vector_in   => dc7,
         vector_out  => enter8);
   
   M9 : Mulp PORT MAP(
         bit1        => c0,
         bit2        => c1,
         bit3        => c2,
         bit4        => countLayer(3),
         vector_in   => dc10,
         vector_out  => enter9);
   
   M10 : Mulp PORT MAP(
         bit1        => countLayer(0),
         bit2        => c1,
         bit3        => c2,
         bit4        => countLayer(3),
         vector_in   => dc9,
         vector_out  => enter10);
   
   M11 : Mulp PORT MAP(
         bit1        => c0,
         bit2        => countLayer(1),
         bit3        => c2,
         bit4        => countLayer(3),
         vector_in   => dc7,
         vector_out  => enter11);
   
   M12 : Mulp PORT MAP(
         bit1        => countLayer(0),
         bit2        => countLayer(1),
         bit3        => c2,
         bit4        => countLayer(3),
         vector_in   => dc8,
         vector_out  => enter12);
   
   M13 : Mulp PORT MAP(
         bit1        => c0,
         bit2        => c1,
         bit3        => countLayer(2),
         bit4        => countLayer(3),
         vector_in   => dc7,
         vector_out  => enter13);
	
   A : Add13 PORT MAP(
     enter1   =>   enter1,
     enter2   =>   enter2,
     enter3   =>   enter3,
     enter4   =>   enter4,
     enter5   =>   enter5,
     enter6   =>   enter6,
     enter7   =>   enter7,
     enter8   =>   enter8,
     enter9   =>   enter9,
     enter10   =>   enter10,
     enter11  =>   enter11,
     enter12  =>   enter12,
     enter13  =>   enter13,
     sortie   =>   vector_outf);
   
END RTL;


