--**********************************************************--
-- ENSA FES --
-- Fili�re : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : cnp TOP
--*************************************************************--
--File : SRC
--*************************************************************--
--                             Used Libraries
--*************************************************************--

	LIBRARY ieee_proposed;
	USE ieee_proposed.fixed_pkg.all;
	
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	
	LIBRARY WORK;
	USE WORK.mem_types.ALL;
	
--****************************************************--
--					ENTITY DECLARATION
--****************************************************--

ENTITY TOP_cnp IS PORT(
	Arrey_in  	   : IN  T_arry;
	min1 		   : OUT sfixed(4 DOWNTO -7);
	min2 		   : OUT sfixed(4 DOWNTO -7);
	sign_prod 	   : OUT STD_LOGIC;
	index_min1 	   : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	original_signs : OUT STD_LOGIC_VECTOR(18 DOWNTO 0));
END TOP_cnp;

-- **********************************************************************
-- *                        RTL Description                             *
-- **********************************************************************

ARCHITECTURE RTL OF TOP_cnp IS 
	
COMPONENT cnp IS
	PORT(
	Arrey_in  	   : IN  T_arry;
	index_min1 	   : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	min1 		   : OUT sfixed(4 DOWNTO -7);
	min2 		   : OUT sfixed(4 DOWNTO -7));
END COMPONENT;

COMPONENT signe IS
	PORT(
	Arrey_in  	   : IN  T_arry;
	sign_prod 	   : OUT STD_LOGIC;
	original_signs : OUT STD_LOGIC_VECTOR(18 DOWNTO 0));
END COMPONENT;

BEGIN
		  
M1 : cnp PORT MAP(
        Arrey_in        =>  Arrey_in,
        index_min1      =>  index_min1,
        min1  			=>  min1,
        min2			=>  min2); 
                  
M2 : signe PORT MAP(
        Arrey_in        =>  Arrey_in,
        sign_prod       =>  sign_prod,
        original_signs  =>  original_signs);  
        
  	    
        
END RTL;
