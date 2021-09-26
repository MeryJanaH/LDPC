--**********************************************************--
-- ENSA FES --
-- Fili�re : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : Mem U
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

ENTITY Mem_U IS GENERIC (nb : integer RANGE 0 TO 18);
	PORT(
	Mem_U_in    : IN   T(nb DOWNTO 0);
	Mem_U_Out  	: OUT  T(nb DOWNTO 0);
	clk         : IN   STD_LOGIC;
	reset       : IN   STD_LOGIC;
	enable      : IN   STD_LOGIC);
END Mem_U;

-- **********************************************************************
-- *                        RTL Description                             *
-- **********************************************************************

ARCHITECTURE RTL OF Mem_U IS 

SIGNAL Mem_U : T(nb DOWNTO 0);


BEGIN            
process (reset,enable)
	begin
		IF reset = '0' OR Mem_U_in(0)(0)(0)='X' THEN 
	FOR i IN Mem_U'range LOOP
		Mem_U(i) <= ("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000");
	END LOOP;
	ELSIF enable = '1' THEN 
		Mem_U <= Mem_U_in;
	END IF;
	end process;
       Mem_U_Out <= Mem_U;
END RTL;

