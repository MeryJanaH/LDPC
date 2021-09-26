--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : concatenation
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

ENTITY concat IS GENERIC (nb : integer RANGE 0 TO 18);
PORT(
	mux       : IN  T(nb DOWNTO 0);
	mux_out   : OUT T(18 DOWNTO 0));
END concat;

-- **********************************************************************
-- *                        RTL Description                             *
-- **********************************************************************

ARCHITECTURE RTL OF concat IS 

CONSTANT size : INTEGER := mux'length;
    
BEGIN                      
	mux_out(size-1 DOWNTO 0) <= mux;
          
m : FOR i IN size TO 18 GENERATE
	mux_out(i) <= ("000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000","000000000000");
END GENERATE;
	
	
END RTL;