
--**********************************************************--
-- ENSA FES --
-- Fili�re : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : Intermidiate Memory Demux 1 vers 6
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

ENTITY mem_demux_1v6 IS
	PORT(
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
END mem_demux_1v6;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF mem_demux_1v6 IS

	SIGNAL c0 : STD_LOGIC;
    SIGNAL c1 : STD_LOGIC;
    SIGNAL c2 : STD_LOGIC;
    SIGNAL c3 : STD_LOGIC;
    --SIGNAL cnpu_out2 : T(18 DOWNTO 0);
    
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
         vector_in   => cnpu_out,
         vector_out  => mem_demux_out1);
 
   M2 : Mulp_gen GENERIC MAP(nb => 18) PORT MAP(
         bit1        => countLayer(0),
         bit2        => c1,
         bit3        => c2,
         bit4        => c3,
         vector_in   => cnpu_out,
         vector_out  => mem_demux_out2);
         
   M3 : Mulp_gen GENERIC MAP(nb => 18) PORT MAP(
         bit1        => c0,
         bit2        => countLayer(1),
         bit3        => c2,
         bit4        => c3,
         vector_in   => cnpu_out,
         vector_out  => mem_demux_out3);
         
   M4 : Mulp_gen GENERIC MAP(nb => 18) PORT MAP(
         bit1        => countLayer(0),
         bit2        => countLayer(1),
         bit3        => c2,
         bit4        => c3,
         vector_in   => cnpu_out,
         vector_out  => mem_demux_out4);
         
   M5 : Mulp_gen GENERIC MAP(nb => 2) PORT MAP(
         bit1        => c0,
         bit2        => c1,
         bit3        => countLayer(2),
         bit4        => c3,
         vector_in   => cnpu_out(2 DOWNTO 0),
         vector_out  => mem_demux_out5);
    
   M6 : Mulp_gen GENERIC MAP(nb => 7) PORT MAP(
         bit1        => countLayer(0),
         bit2        => c1,
         bit3        => countLayer(2),
         bit4        => c3,
         vector_in   => cnpu_out(7 DOWNTO 0),
         vector_out  => mem_demux_out6);
         
   M7 : Mulp_gen GENERIC MAP(nb => 8) PORT MAP(
         bit1        => c0,
         bit2        => countLayer(1),
         bit3        => countLayer(2),
         bit4        => c3,
         vector_in   => cnpu_out(8 DOWNTO 0),
         vector_out  => mem_demux_out7);
         
   M8 : Mulp_gen GENERIC MAP(nb => 6) PORT MAP(
         bit1        => countLayer(0),
         bit2        => countLayer(1),
         bit3        => countLayer(2),
         bit4        => c3,
         vector_in   => cnpu_out(6 DOWNTO 0),
         vector_out  => mem_demux_out8);
 
   M9 : Mulp_gen GENERIC MAP(nb => 9) PORT MAP(
         bit1        => c0,
         bit2        => c1,
         bit3        => c2,
         bit4        => countLayer(3),
         vector_in   => cnpu_out(9 DOWNTO 0),
         vector_out  => mem_demux_out9);
         
   M10 : Mulp_gen GENERIC MAP(nb => 8) PORT MAP(
         bit1        => countLayer(0),
         bit2        => c1,
         bit3        => c2,
         bit4        => countLayer(3),
         vector_in   => cnpu_out(8 DOWNTO 0),
         vector_out  => mem_demux_out10);
         
   M11 : Mulp_gen GENERIC MAP(nb => 6) PORT MAP(
         bit1        => c0,
         bit2        => countLayer(1),
         bit3        => c2,
         bit4        => countLayer(3),
         vector_in   => cnpu_out(6 DOWNTO 0),
         vector_out  => mem_demux_out11);
         
   M12 : Mulp_gen GENERIC MAP(nb => 7) PORT MAP(
         bit1        => countLayer(0),
         bit2        => countLayer(1),
         bit3        => c2,
         bit4        => countLayer(3),
         vector_in   => cnpu_out(7 DOWNTO 0),
         vector_out  => mem_demux_out12);
    
   M13 : Mulp_gen GENERIC MAP(nb => 6) PORT MAP(
         bit1        => c0,
         bit2        => c1,
         bit3        => countLayer(2),
         bit4        => countLayer(3),
         vector_in   => cnpu_out(6 DOWNTO 0),
         vector_out  => mem_demux_out13);

END RTL;


