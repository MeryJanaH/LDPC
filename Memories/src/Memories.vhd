--**********************************************************--
-- ENSA FES --
-- Fili�re : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : Memories
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

ENTITY memories IS PORT(  
    C_to_V  	 : IN   T(18 DOWNTO 0);
    Count_layer  : IN   STD_LOGIC_VECTOR(3 DOWNTO 0);
    Mem_in       : IN   T(34 DOWNTO 0);
    Mem_adr      : IN   STD_LOGIC;
    CLK          : IN   STD_LOGIC;
    reset        : IN   STD_LOGIC;
    Receiv_LLR   : IN   T(34 DOWNTO 0);
    C_to_V_out   : OUT  T(18 DOWNTO 0);
    Receiv_LLR2  : OUT  T(34 DOWNTO 0));
END memories;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF memories IS
		
COMPONENT Top_intern_mem IS GENERIC (nb : integer RANGE 0 TO 34);
	PORT(
    countLayer      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    cnpu_out  	    : IN  T(18 DOWNTO 0);
    clk  	        : IN  STD_LOGIC;
    reset           : IN  STD_LOGIC;
    intern_mem_out  : OUT T(18 DOWNTO 0));
END COMPONENT;

COMPONENT Code_gen IS 
	PORT(
    countLayer      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    mem_in  	 : IN  T(34 DOWNTO 0);
    MemAdr   	 : IN  STD_LOGIC;
    recv_LLR     : IN  T(34 DOWNTO 0);
    clk          : IN  STD_LOGIC;
	reset        : IN  STD_LOGIC;
	recv_LLR2    : OUT T(34 DOWNTO 0));  
END COMPONENT;
	
BEGIN 

mem1 : Top_intern_mem GENERIC MAP(nb => 18) PORT MAP(
         countLayer     => Count_layer,
         cnpu_out       => C_to_V,
         clk            => clk,
         reset          => reset,
         intern_mem_out => C_to_V_out);
         
mem2 : Code_gen PORT MAP(
         countLayer     => Count_layer,
         mem_in    => Mem_in,
         MemAdr    => Mem_adr,
         recv_LLR  => Receiv_LLR,
         recv_LLR2 => Receiv_LLR2,
         clk       => clk,
         reset     => reset);
                 
END RTL;
