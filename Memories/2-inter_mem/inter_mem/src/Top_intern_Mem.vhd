
--**********************************************************--
-- ENSA FES --
-- Fili�re : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : Intermediate memory
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

ENTITY Top_intern_mem IS GENERIC (nb : integer RANGE 0 TO 18);
	PORT(
	    countLayer      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
	    cnpu_out  	    : IN  T(18 DOWNTO 0);
	    clk  	        : IN  STD_LOGIC;
	    reset           : IN  STD_LOGIC;
	    intern_mem_out  : OUT T(18 DOWNTO 0));
END Top_intern_mem;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF Top_intern_mem IS
    
SIGNAL demux1, demux2, demux3, demux4, demux5, demux6, demux7, demux8, demux9, demux10, demux11, demux12, demux13 : T(nb DOWNTO 0);

SIGNAL mux1, mux2, mux3, mux4, mux5, mux6, mux7, mux8, mux9, mux10, mux11, mux12, mux13 : T(nb DOWNTO 0);
SIGNAL mux_cn1, mux_cn2, mux_cn3, mux_cn4, mux_cn5, mux_cn6, mux_cn7, mux_cn8, mux_cn9  : T(18 DOWNTO 0);

SIGNAL enable : STD_LOGIC_VECTOR(12 DOWNTO 0);

	COMPONENT mem_demux_1v6 PORT(
	    countLayer      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
	    cnpu_out  	    : IN  T(18 DOWNTO 0);
	    mem_demux_out1  : OUT T(18 DOWNTO 0);
	    mem_demux_out2  : OUT T(18 DOWNTO 0);
	    mem_demux_out3  : OUT T(18 DOWNTO 0);
	    mem_demux_out4  : OUT T(18 DOWNTO 0);
	    mem_demux_out5  : OUT T(2 DOWNTO 0);
	    mem_demux_out6  : OUT T(7 DOWNTO 0);
	    mem_demux_out7  : OUT T(8 DOWNTO 0);
	    mem_demux_out8  : OUT T(6 DOWNTO 0);
	    mem_demux_out9  : OUT T(9 DOWNTO 0);
	    mem_demux_out10 : OUT T(8 DOWNTO 0);
	    mem_demux_out11 : OUT T(6 DOWNTO 0);
	    mem_demux_out12 : OUT T(7 DOWNTO 0);
	    mem_demux_out13 : OUT T(6 DOWNTO 0));
	END COMPONENT;

	COMPONENT lock PORT(
		clk         : IN   STD_LOGIC;
		reset       : IN   STD_LOGIC;
		countLayer : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		enable     : OUT STD_LOGIC_VECTOR(12 DOWNTO 0));
	END COMPONENT;
		
	COMPONENT mem_mux_6v1
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
	END COMPONENT;
	
	COMPONENT Mem_U 
		GENERIC (nb : integer RANGE 0 TO 18);
		PORT(
		Mem_U_in    : IN   T(nb DOWNTO 0);
		Mem_U_Out  	: OUT  T(nb DOWNTO 0);
		clk         : IN   STD_LOGIC;
		reset       : IN   STD_LOGIC;
		enable      : IN   STD_LOGIC);
	END COMPONENT;

	COMPONENT concat 
		GENERIC (nb : integer RANGE 0 TO 18);
		PORT(
		mux       : IN  T(nb DOWNTO 0);
		mux_out   : OUT T(18 DOWNTO 0));
	END COMPONENT;
	
BEGIN
	
	
  ele1 : mem_demux_1v6 PORT MAP(
	    countLayer      =>  countLayer,
	    cnpu_out  	    =>  cnpu_out,
	    mem_demux_out1  =>  demux1,
	    mem_demux_out2  =>  demux2,
	    mem_demux_out3  =>  demux3,
	    mem_demux_out4  =>  demux4,
	    mem_demux_out5  =>  demux5(2 DOWNTO 0),
	    mem_demux_out6  =>  demux6(7 DOWNTO 0),
	    mem_demux_out7  =>  demux7(8 DOWNTO 0),
	    mem_demux_out8  =>  demux8(6 DOWNTO 0),
	    mem_demux_out9  =>  demux9(9 DOWNTO 0),
	    mem_demux_out10 =>  demux10(8 DOWNTO 0),
	    mem_demux_out11 =>  demux11(6 DOWNTO 0),
	    mem_demux_out12 =>  demux12(7 DOWNTO 0),
	    mem_demux_out13 =>  demux13(6 DOWNTO 0));
         
  ele2 : lock PORT MAP(
		 clk        =>  clk,
		 reset      =>  reset,
		countLayer =>  countLayer,
		enable     =>  enable);
         
ele3_1 : Mem_U GENERIC MAP(nb => 18) PORT MAP(
		 Mem_U_in   =>  demux1,
	  	 Mem_U_Out  =>  mux1,
		 clk        =>  clk,
		 reset      =>  reset,
		 enable     =>  enable(0));

ele3_2 : Mem_U GENERIC MAP(nb => 18) PORT MAP(
		 Mem_U_in   =>  demux2,
	  	 Mem_U_Out  =>  mux2,
		 clk        =>  clk,
		 reset      =>  reset,
		 enable     =>  enable(1));
		 
ele3_3 : Mem_U GENERIC MAP(nb => 18) PORT MAP(
		 Mem_U_in   =>  demux3,
	  	 Mem_U_Out  =>  mux3,
		 clk        =>  clk,
		 reset      =>  reset,
		 enable     =>  enable(2));
		 
ele3_4 : Mem_U GENERIC MAP(nb => 18) PORT MAP(
		 Mem_U_in   =>  demux4,
	  	 Mem_U_Out  =>  mux4,
		 clk        =>  clk,
		 reset      =>  reset,
		 enable     =>  enable(3));
		 
ele3_5 : Mem_U GENERIC MAP(nb => 2) PORT MAP(
		 Mem_U_in   =>  demux5(2 DOWNTO 0),
	  	 Mem_U_Out  =>  mux5(2 DOWNTO 0),
		 clk        =>  clk,
		 reset      =>  reset,
		 enable     =>  enable(4));

cn1 : concat GENERIC MAP(nb => 2) PORT MAP(
		 mux      =>  mux5(2 DOWNTO 0),
	  	 mux_out  =>  mux_cn1);
		 	 
ele3_6 : Mem_U GENERIC MAP(nb => 7) PORT MAP(
		 Mem_U_in   =>  demux6(7 DOWNTO 0),
	  	 Mem_U_Out  =>  mux6(7 DOWNTO 0),
		 clk        =>  clk,
		 reset      =>  reset,
		 enable     =>  enable(5));
	
cn2 : concat GENERIC MAP(nb => 7) PORT MAP(
		 mux      =>  mux6(7 DOWNTO 0),
	  	 mux_out  =>  mux_cn2);
	  	 	 
ele3_7 : Mem_U GENERIC MAP(nb => 8) PORT MAP(
		 Mem_U_in   =>  demux7(8 DOWNTO 0),
	  	 Mem_U_Out  =>  mux7(8 DOWNTO 0),
		 clk        =>  clk,
		 reset      =>  reset,
		 enable     =>  enable(6));

cn3 : concat GENERIC MAP(nb => 8) PORT MAP(
		 mux      =>  mux7(8 DOWNTO 0),
	  	 mux_out  =>  mux_cn3);
	  	 
ele3_8 : Mem_U GENERIC MAP(nb => 6) PORT MAP(
		 Mem_U_in   =>  demux8(6 DOWNTO 0),
	  	 Mem_U_Out  =>  mux8(6 DOWNTO 0),
		 clk        =>  clk,
		 reset      =>  reset,
		 enable     =>  enable(7));

cn4 : concat GENERIC MAP(nb => 6) PORT MAP(
		 mux      =>  mux8(6 DOWNTO 0),
	  	 mux_out  =>  mux_cn4);
	  	 		 		 
ele3_9 : Mem_U GENERIC MAP(nb => 9) PORT MAP(
		 Mem_U_in   =>  demux9(9 DOWNTO 0),
	  	 Mem_U_Out  =>  mux9(9 DOWNTO 0),
		 clk        =>  clk,
		 reset      =>  reset,
		 enable     =>  enable(8));		 

cn5 : concat GENERIC MAP(nb => 9) PORT MAP(
		 mux      =>  mux9(9 DOWNTO 0),
	  	 mux_out  =>  mux_cn5);
	  	 		
ele3_10 : Mem_U GENERIC MAP(nb => 8) PORT MAP(
		 Mem_U_in   =>  demux10(8 DOWNTO 0),
	  	 Mem_U_Out  =>  mux10(8 DOWNTO 0),
		 clk        =>  clk,
		 reset      =>  reset,
		 enable     =>  enable(9));

cn6 : concat GENERIC MAP(nb => 8) PORT MAP(
		 mux      =>  mux10(8 DOWNTO 0),
	  	 mux_out  =>  mux_cn6);
	  	 		  
ele3_11 : Mem_U GENERIC MAP(nb => 6) PORT MAP(
		 Mem_U_in   =>  demux11(6 DOWNTO 0),
	  	 Mem_U_Out  =>  mux11(6 DOWNTO 0),
		 clk        =>  clk,
		 reset      =>  reset,
		 enable     =>  enable(10));
	
cn7 : concat GENERIC MAP(nb => 6) PORT MAP(
		 mux      =>  mux11(6 DOWNTO 0),
	  	 mux_out  =>  mux_cn7);
	  	 	 		 
ele3_12 : Mem_U GENERIC MAP(nb => 7) PORT MAP(
		 Mem_U_in   =>  demux12(7 DOWNTO 0),
	  	 Mem_U_Out  =>  mux12(7 DOWNTO 0),
		 clk        =>  clk,
		 reset      =>  reset,
		 enable     =>  enable(11));

cn8 : concat GENERIC MAP(nb => 7) PORT MAP(
		 mux      =>  mux12(7 DOWNTO 0),
	  	 mux_out  =>  mux_cn8);
	  	 
ele3_13 : Mem_U GENERIC MAP(nb => 6) PORT MAP(
		 Mem_U_in   =>  demux13(6 DOWNTO 0),
	  	 Mem_U_Out  =>  mux13(6 DOWNTO 0),
		 clk        =>  clk,
		 reset      =>  reset,
		 enable     =>  enable(12));
		 
cn9 : concat GENERIC MAP(nb => 6) PORT MAP(
		 mux      =>  mux13(6 DOWNTO 0),
	  	 mux_out  =>  mux_cn9);

ele4 : mem_mux_6v1 PORT MAP(
	    countLayer   =>  countLayer,
	    mem_mux_in1  =>  mux1,
	    mem_mux_in2  =>  mux2,
	    mem_mux_in3  =>  mux3,
	    mem_mux_in4  =>  mux4,
	    mem_mux_in5  =>  mux_cn1,
	    mem_mux_in6  =>  mux_cn2,
	    mem_mux_in7  =>  mux_cn3,
	    mem_mux_in8  =>  mux_cn4,
	    mem_mux_in9  =>  mux_cn5,
	    mem_mux_in10 =>  mux_cn6,
	    mem_mux_in11 =>  mux_cn7,
	    mem_mux_in12 =>  mux_cn8,
	    mem_mux_in13 =>  mux_cn9,
	    mux_out  	 =>  intern_mem_out);
END RTL;


