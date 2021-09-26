--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : CNU TOP
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



ENTITY CNU IS PORT(
	Arrey_in  	   : IN   T_arry;
	Arrey_out  	   : OUT  T_arry);
END CNU;

-- **********************************************************************
-- *                        RTL Description                             *
-- **********************************************************************

ARCHITECTURE RTL OF CNU IS 
	
SIGNAL m1 , m2     : sfixed(4 DOWNTO -7);
SIGNAL sign_p  	   : STD_LOGIC;
SIGNAL enter_index : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL orig_signs  : STD_LOGIC_VECTOR(18 DOWNTO 0);	
SIGNAL Arr_out2    : T_arry;	

COMPONENT TOP_cnp IS
	PORT(
	Arrey_in  	   : IN  T_arry;
	min1 		   : OUT sfixed(4 DOWNTO -7);
	min2 		   : OUT sfixed(4 DOWNTO -7);
	sign_prod 	   : OUT STD_LOGIC;
	index_min1 	   : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	original_signs : OUT STD_LOGIC_VECTOR(18 DOWNTO 0));
END COMPONENT;

COMPONENT selector IS
	PORT(
    enter  	 	 : IN   STD_LOGIC_VECTOR(4 DOWNTO 0);
    min1 		 : IN   sfixed(4 DOWNTO -7);
	min2 		 : IN   sfixed(4 DOWNTO -7);
	Arrey_out  	 : OUT  T_arry);
END COMPONENT;

COMPONENT prod_final IS
	PORT(
    Arr        :  IN  T_arry;
    Orig_sign  :  IN  STD_LOGIC_VECTOR(18 DOWNTO 0);	
    sign_prod  :  IN  STD_LOGIC;
    Arr_out    :  OUT T_arry);
END COMPONENT;

BEGIN
		  
C1 : TOP_cnp PORT MAP(
        Arrey_in        =>  Arrey_in,
        min1  			=>  m1,
        min2			=>  m2,
        sign_prod       =>  sign_p,
        index_min1      =>  enter_index,
        original_signs  =>  orig_signs); 
                  
C2 : selector PORT MAP(
        enter     =>  enter_index,
        min1      =>  m1,
        min2	  =>  m2,
        Arrey_out =>  Arr_out2);  
        
C3 : prod_final PORT MAP(
        Arr        =>  Arr_out2,
        sign_prod  =>  sign_p,
        Orig_sign  =>  orig_signs,
        Arr_out	   =>  Arrey_out);   
            
END RTL;
