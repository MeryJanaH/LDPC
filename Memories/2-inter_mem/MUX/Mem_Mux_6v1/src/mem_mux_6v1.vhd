
--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : Intermidiate Memory MUX 6 vers 1
--*************************************************************--
--File : src
--***********************************************************
--                             Used Libraries
--***********************************************************--

	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.numeric_std.ALL;
	use IEEE.std_logic_unsigned.all;

	LIBRARY WORK;
	USE WORK.mem_types.ALL;
	
--************************************************************--
--                            ENTITY Declaration
--************************************************************--

ENTITY mem_mux_6v1 IS
	PORT(
	    countLayer   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
	    mem_mux_in1  : IN  T(18 DOWNTO 0);
	    mem_mux_in2  : IN  T(18 DOWNTO 0);
	    mem_mux_in3  : IN  T(18 DOWNTO 0);
	    mem_mux_in4  : IN  T(18 DOWNTO 0);
	    mem_mux_in5  : IN  T(18 DOWNTO 0);
	    mem_mux_in6  : IN  T(18 DOWNTO 0);
	    mem_mux_in7  : IN  T(18 DOWNTO 0);
	    mem_mux_in8  : IN  T(18 DOWNTO 0);
	    mem_mux_in9  : IN  T(18 DOWNTO 0);
	    mem_mux_in10 : IN  T(18 DOWNTO 0);
	    mem_mux_in11 : IN  T(18 DOWNTO 0);
	    mem_mux_in12 : IN  T(18 DOWNTO 0);
	    mem_mux_in13 : IN  T(18 DOWNTO 0);
	    mux_out  	 : OUT T(18 DOWNTO 0));
END mem_mux_6v1;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF mem_mux_6v1 IS

SIGNAL enter1, enter2, enter3, enter4, enter5, enter6, enter7, enter8, enter9, enter10, enter11, enter12, enter13 : T(18 DOWNTO 0);

	SIGNAL c0 : STD_LOGIC;
    SIGNAL c1 : STD_LOGIC;
    SIGNAL c2 : STD_LOGIC;
    SIGNAL c3 : STD_LOGIC;
    
	COMPONENT Mulp_gen 
		GENERIC (nb : integer RANGE 0 TO 18);
		PORT(
		    bit1  	     : IN  STD_LOGIC;
		    bit2  	     : IN  STD_LOGIC;
		    bit3  	     : IN  STD_LOGIC;
		    bit4     	 : IN  STD_LOGIC;
		    vector_in    : IN  T(nb DOWNTO 0);
		    vector_out   : OUT T(nb DOWNTO 0));
	END COMPONENT;
	
	COMPONENT Add13_mem IS
		PORT(
		countLayer   : IN   STD_LOGIC_VECTOR(3 DOWNTO 0);
	    enter1  	 : IN   T(18 DOWNTO 0);
	    enter2  	 : IN   T(18 DOWNTO 0);
	    enter3  	 : IN   T(18 DOWNTO 0);
	    enter4  	 : IN   T(18 DOWNTO 0);
	    enter5  	 : IN   T(18 DOWNTO 0);
	    enter6  	 : IN   T(18 DOWNTO 0);
	    enter7  	 : IN   T(18 DOWNTO 0);
	    enter8  	 : IN   T(18 DOWNTO 0);
	    enter9  	 : IN   T(18 DOWNTO 0);
	    enter10  	 : IN   T(18 DOWNTO 0);
	    enter11  	 : IN   T(18 DOWNTO 0);
	    enter12  	 : IN   T(18 DOWNTO 0);
	    enter13  	 : IN   T(18 DOWNTO 0);
	    sortie  	 : OUT  T(18 DOWNTO 0));
	END COMPONENT;
    

BEGIN 

	c0 <= NOT(countLayer(0));
	c1 <= NOT(countLayer(1));
	c2 <= NOT(countLayer(2));
	c3 <= NOT(countLayer(3));
	
   M1 : Mulp_gen GENERIC MAP(nb => 18) PORT MAP(
         bit1        => c0,
         bit2        => c1,
         bit3        => c2,
         bit4        => c3,
         vector_in(18 DOWNTO 0)   => mem_mux_in1(18 DOWNTO 0),
         vector_out(18 DOWNTO 0)  => enter1(18 DOWNTO 0));
   
   M2 : Mulp_gen GENERIC MAP(nb => 18) PORT MAP(
         bit1        => countLayer(0),
         bit2        => c1,
         bit3        => c2,
         bit4        => c3,
         vector_in(18 DOWNTO 0)   => mem_mux_in2(18 DOWNTO 0),
         vector_out(18 DOWNTO 0)  => enter2(18 DOWNTO 0));
   
   M3 : Mulp_gen GENERIC MAP(nb => 18) PORT MAP(
         bit1        => c0,
         bit2        => countLayer(1),
         bit3        => c2,
         bit4        => c3,
         vector_in(18 DOWNTO 0)   => mem_mux_in3(18 DOWNTO 0),
         vector_out(18 DOWNTO 0)  => enter3(18 DOWNTO 0));
   
   M4 : Mulp_gen GENERIC MAP(nb => 18) PORT MAP(
         bit1        => countLayer(0),
         bit2        => countLayer(1),
         bit3        => c2,
         bit4        => c3,
         vector_in(18 DOWNTO 0)   => mem_mux_in4(18 DOWNTO 0),
         vector_out(18 DOWNTO 0)  => enter4(18 DOWNTO 0));
   
   M5 : Mulp_gen GENERIC MAP(nb => 18) PORT MAP(
         bit1        => c0,
         bit2        => c1,
         bit3        => countLayer(2),
         bit4        => c3,
         vector_in(18 DOWNTO 0)   => mem_mux_in5(18 DOWNTO 0),
         vector_out(18 DOWNTO 0)  => enter5(18 DOWNTO 0));
   
   M6 : Mulp_gen GENERIC MAP(nb => 18) PORT MAP(
         bit1        => countLayer(0),
         bit2        => c1,
         bit3        => countLayer(2),
         bit4        => c3,
         vector_in(18 DOWNTO 0)   => mem_mux_in6(18 DOWNTO 0),
         vector_out(18 DOWNTO 0)  => enter6(18 DOWNTO 0));
   
   M7 : Mulp_gen GENERIC MAP(nb => 18) PORT MAP(
         bit1        => c0,
         bit2        => countLayer(1),
         bit3        => countLayer(2),
         bit4        => c3,
         vector_in(18 DOWNTO 0)   => mem_mux_in7(18 DOWNTO 0),
         vector_out(18 DOWNTO 0)  => enter7(18 DOWNTO 0));
   
   M8 : Mulp_gen GENERIC MAP(nb => 18) PORT MAP(
         bit1        => countLayer(0),
         bit2        => countLayer(1),
         bit3        => countLayer(2),
         bit4        => c3,
         vector_in(18 DOWNTO 0)   => mem_mux_in8(18 DOWNTO 0),
         vector_out(18 DOWNTO 0)  => enter8(18 DOWNTO 0));
   
   M9 : Mulp_gen GENERIC MAP(nb => 18) PORT MAP(
         bit1        => c0,
         bit2        => c1,
         bit3        => c2,
         bit4        => countLayer(3),
         vector_in(18 DOWNTO 0)   => mem_mux_in9(18 DOWNTO 0),
         vector_out(18 DOWNTO 0)  => enter9(18 DOWNTO 0));
   
   M10 : Mulp_gen GENERIC MAP(nb => 18) PORT MAP(
         bit1        => countLayer(0),
         bit2        => c1,
         bit3        => c2,
         bit4        => countLayer(3),
         vector_in(18 DOWNTO 0)   => mem_mux_in10(18 DOWNTO 0),
         vector_out(18 DOWNTO 0)  => enter10(18 DOWNTO 0));
   
   M11 : Mulp_gen GENERIC MAP(nb => 18) PORT MAP(
         bit1        => c0,
         bit2        => countLayer(1),
         bit3        => c2,
         bit4        => countLayer(3),
         vector_in(18 DOWNTO 0)   => mem_mux_in11(18 DOWNTO 0),
         vector_out(18 DOWNTO 0)  => enter11(18 DOWNTO 0));
   
   M12 : Mulp_gen GENERIC MAP(nb => 18) PORT MAP(
         bit1        => countLayer(0),
         bit2        => countLayer(1),
         bit3        => c2,
         bit4        => countLayer(3),
         vector_in(18 DOWNTO 0)   => mem_mux_in12(18 DOWNTO 0),
         vector_out(18 DOWNTO 0)  => enter12(18 DOWNTO 0));
   
   M13 : Mulp_gen GENERIC MAP(nb => 18) PORT MAP(
         bit1        => c0,
         bit2        => c1,
         bit3        => countLayer(2),
         bit4        => countLayer(3),
         vector_in(18 DOWNTO 0)   => mem_mux_in13(18 DOWNTO 0),
         vector_out(18 DOWNTO 0)  => enter13(18 DOWNTO 0));
	
   A : Add13_mem PORT MAP(
         countLayer => countLayer,
	     enter1     =>   enter1,
	     enter2     =>   enter2,
	     enter3     =>   enter3,
	     enter4     =>   enter4,
	     enter5     =>   enter5,
	     enter6     =>   enter6,
	     enter7     =>   enter7,
	     enter8     =>   enter8,
	     enter9     =>   enter9,
	     enter10    =>   enter10,
	     enter11    =>   enter11,
	     enter12    =>   enter12,
	     enter13    =>   enter13,
	     sortie     =>   mux_out);
     
END RTL;


