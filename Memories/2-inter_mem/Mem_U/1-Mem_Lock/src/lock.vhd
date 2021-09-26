--**********************************************************--
-- ENSA FES --
-- Fili�re : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : Mem Loc
--*************************************************************--
--File : SRC
--*************************************************************--
--                             Used Libraries
--*************************************************************--
	
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	
	LIBRARY WORK;
	USE WORK.mem_types.ALL;
	
--****************************************************--
--					ENTITY DECLARATION
--****************************************************--

ENTITY lock IS PORT(
	clk         : IN   STD_LOGIC;
	reset       : IN   STD_LOGIC;
	countLayer : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
	enable     : OUT STD_LOGIC_VECTOR(12 DOWNTO 0));
END lock;

-- **********************************************************************
-- *                        RTL Description                             *
-- **********************************************************************

ARCHITECTURE RTL OF lock IS 

	SIGNAL c0 : STD_LOGIC;
    SIGNAL c1 : STD_LOGIC;
    SIGNAL c2 : STD_LOGIC;
    SIGNAL c3 : STD_LOGIC;
    SIGNAL countLayer_edge_bit : STD_LOGIC;
	SIGNAL countLayer_r0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	--SIGNAL countLayer_r1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL countLayer_edge : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN                 

 	c0 <= NOT(countLayer(0));
	c1 <= NOT(countLayer(1));
	c2 <= NOT(countLayer(2));
	c3 <= NOT(countLayer(3));
	
enable(0)  <= (c0 AND c1 AND c2 AND c3 and countLayer_edge_bit);
enable(1)  <= (countLayer(0) AND c1 AND c2 AND c3 and countLayer_edge_bit);
enable(2)  <= (c0 AND countLayer(1) AND c2 AND c3 and countLayer_edge_bit);
enable(3)  <= (countLayer(0) AND countLayer(1) AND c2 AND c3 and countLayer_edge_bit);
enable(4)  <= (c0 AND c1 AND countLayer(2) AND c3 and countLayer_edge_bit);
enable(5)  <= (countLayer(0) AND c1 AND countLayer(2) AND c3 and countLayer_edge_bit);
enable(6)  <= (c0 AND countLayer(1) AND countLayer(2) AND c3 and countLayer_edge_bit);
enable(7)  <= (countLayer(0) AND countLayer(1) AND countLayer(2) AND c3 and countLayer_edge_bit);
enable(8)  <= (c0 AND c1 AND c2 AND countLayer(3) and countLayer_edge_bit);
enable(9)  <= (countLayer(0) AND c1 AND c2 AND countLayer(3) and countLayer_edge_bit);
enable(10) <= (c0 AND countLayer(1) AND c2 AND countLayer(3) and countLayer_edge_bit);
enable(11) <= (countLayer(0) AND countLayer(1) AND c2 AND countLayer(3) and countLayer_edge_bit);
enable(12) <= (c0 AND c1 AND countLayer(2) AND countLayer(3) and countLayer_edge_bit);

process (clk, reset)
begin
	if reset = '0' then
		countLayer_r0<="0000";
		--countLayer_r1<="0000";
	elsif falling_edge(clk) then
		countLayer_r0<=countLayer;
		--countLayer_r1<=countLayer_r0;
	end if;
end process;
countLayer_edge<= countLayer and not countLayer_r0;
countLayer_edge_bit <= countLayer_edge(0) or  countLayer_edge(1) or  countLayer_edge(2) or countLayer_edge(3);

END RTL;
