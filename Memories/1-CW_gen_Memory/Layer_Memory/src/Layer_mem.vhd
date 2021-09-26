--**********************************************************--
-- ENSA FES --
-- Fili�re : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : Layer 
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

ENTITY Layer_mem IS PORT(  
    countLayer      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    mem_in  	: IN   T(34 DOWNTO 0);
    mem_out   	: OUT  T(34 DOWNTO 0);
	MemAdr		: IN   STD_LOGIC;
    clk         : IN   STD_LOGIC;
	reset       : IN   STD_LOGIC);
END Layer_mem;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
ARCHITECTURE RTL OF Layer_mem IS
	
SIGNAL m_out : 	T(34 DOWNTO 0);
--SIGNAL m_in : 	T(34 DOWNTO 0);
BEGIN 

	-- PROCESS(clk, reset)
	-- BEGIN
	-- IF reset = '0' THEN 
	-- FOR i IN m_out'range LOOP
	-- 	m_out(i) <= ("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000");
	-- END LOOP;
	-- ELSIF RISING_EDGE(clk) THEN 

	-- 		m_out <= mem_in; 
	-- END IF;
	-- END PROCESS;
       mem_out <= m_out;
 

	PROCESS(reset,countLayer)
	BEGIN
		IF reset = '0' THEN 
	FOR i IN m_out'range LOOP
		m_out(i) <= ("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000");
	END LOOP;
	else
		m_out<=mem_in;
	end if;
	END PROCESS;

END RTL;
