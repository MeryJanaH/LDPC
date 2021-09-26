--**********************************************************--
-- ENSA FES --
-- Filière : GSEII2
--**********************************************************--
--Title : Min-Sum Algorithme
--Block : cnp 
--*************************************************************--
--File : src
--*************************************************************--
--                             Used Libraries
--*************************************************************--

	LIBRARY ieee_proposed;
	USE ieee_proposed.fixed_pkg.all;
	
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.numeric_std.ALL;
	use IEEE.std_logic_unsigned.all;
	
	LIBRARY WORK;
	USE WORK.mem_types.ALL;
	
--****************************************************--
--					ENTITY DECLARATION
--****************************************************--

--* -1 ==> 0 ; 1 ==> 1*--

ENTITY cnp IS PORT(
	Arrey_in  	   : IN  T_arry;
	index_min1 	   : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	min1 		   : OUT sfixed(4 DOWNTO -7);
	min2 		   : OUT sfixed(4 DOWNTO -7));
END cnp;

-- **********************************************************************
-- *                        RTL Description                             *
-- **********************************************************************
ARCHITECTURE RTL OF cnp IS 

	SIGNAL s_temp  : S_arry;
	SIGNAL b_temp  : B_arry;
	SIGNAL l_temp  : L_arry;
	SIGNAL sw_temp : SW_arry;
	SIGNAL T_arr : T_arry;
	
	COMPONENT sw IS
		PORT(
		L1	 : IN   STD_LOGIC;
		L2	 : IN   STD_LOGIC;
		L3	 : IN   STD_LOGIC;
	    Ls   : OUT  STD_LOGIC);
	END COMPONENT;

	COMPONENT semi_comp IS
		PORT(
		I1	 : IN   sfixed(4 downto -7);
		I2	 : IN   sfixed(4 downto -7);
	    S    : OUT  sfixed(4 downto -7));
	END COMPONENT;
		
	COMPONENT full_comp IS
		PORT(
		I1	 : IN   sfixed(4 downto -7);
		I2	 : IN   sfixed(4 downto -7);
	    B  	 : OUT  sfixed(4 downto -7);
	    L    : OUT  STD_LOGIC;
	    S    : OUT  sfixed(4 downto -7));
	END COMPONENT;
	
	BEGIN
	
	C:FOR i IN 0 TO 18 GENERATE
	T_arr(i) <= resize(abs(Arrey_in(i)),4,-7);
	END GENERATE;
	--*c1
	fc1 : FOR i IN 0 to 8 GENERATE
	  f1 : full_comp PORT MAP(
	         I1 => T_arr(i*2),
             I2 => T_arr((i*2)+1),
             B  => b_temp(i),
             L  => l_temp(i),
             S  => s_temp(i));
	END GENERATE;	
	 
	--*c2
	fc2 : FOR i IN 0 to 3 GENERATE
	  f2 : full_comp PORT MAP(
	         I1 => s_temp(i*2),
             I2 => s_temp((i*2)+1),
             B  => b_temp(i+9),
             L  => l_temp(i+9),
             S  => s_temp(i+9));
	END GENERATE;	                       
   
	fc3 : FOR i IN 0 to 3 GENERATE
	  f3 : semi_comp PORT MAP(
			I1	=> b_temp(i*2),
			I2	=> b_temp((i*2)+1),
		    S   => s_temp(i+13));
	END GENERATE;	
	
	sw1 : FOR i IN 0 to 3 GENERATE
	   s1 : sw PORT MAP(
			L1	=>  l_temp((i*2)+1),
			L2	=>	l_temp(i+9),
			L3	=>	l_temp(i*2),
			Ls  =>  sw_temp(i));	    
	END GENERATE;
	
	--*c3
	fc4 : FOR i IN 0 to 1 GENERATE
	  f4 : full_comp PORT MAP(
	         I1 => s_temp((i*2)+9),
             I2 => s_temp((i*2)+10),
             B  => b_temp(i+13),
             L  => l_temp(i+13),
             S  => s_temp(i+17));
	END GENERATE;
	
	fc5 : FOR i IN 0 to 1 GENERATE
	  f5 : semi_comp PORT MAP(
			I1	=> s_temp((i*2)+13),
			I2	=> s_temp((i*2)+14),
		    S   => s_temp(i+19));
	END GENERATE;	
	
	fc6 : FOR i IN 0 to 1 GENERATE
	  f6 : semi_comp PORT MAP(
			I1	=> b_temp((i*2)+9),
			I2	=> b_temp((i*2)+10),
		    S   => s_temp(i+21));
	END GENERATE;	
	
	s2 : sw PORT MAP(
			L1	=>  l_temp(10),
			L2	=>	l_temp(13),
			L3	=>	l_temp(9),
		    Ls  =>  sw_temp(4));

	s3 : sw PORT MAP(
			L1	=>  sw_temp(1),
			L2	=>	l_temp(13),
			L3	=>	sw_temp(0),
		    Ls  =>  sw_temp(5));

	s4 : sw PORT MAP(
			L1	=>  sw_temp(3),
			L2	=>	l_temp(14),
			L3	=>	sw_temp(2),
		    Ls  =>  sw_temp(6));		    		    	    	  

	s5 : sw PORT MAP(
			L1	=>  l_temp(12),
			L2	=>	l_temp(14),
			L3	=>	l_temp(11),
		    Ls  =>  sw_temp(7));
	
	--*c4
	  f7 : full_comp PORT MAP(
	         I1 => s_temp(17),
	         I2 => s_temp(18),
	         B  => b_temp(15),
	         L  => l_temp(15),
	         S  => s_temp(23));
	  
  	  f8 : semi_comp PORT MAP(
			I1	=> s_temp(19),
			I2	=> s_temp(20),
		    S   => s_temp(24));

  	  f9 : semi_comp PORT MAP(
			I1	=> s_temp(21),
			I2	=> s_temp(22),
		    S   => s_temp(25));

  	 f10 : semi_comp PORT MAP(
			I1	=> b_temp(13),
			I2	=> b_temp(14),
		    S   => s_temp(26));

	 --*c5
  	 f11 : semi_comp PORT MAP(
			I1	=> s_temp(24),
			I2	=> s_temp(25),
		    S   => s_temp(27));
		    
	--*c6
	 f12 : full_comp PORT MAP(
	         I1 => s_temp(8),
	         I2 => T_arr(18),
	         B  => b_temp(16),
	         L  => l_temp(16),
	         S  => s_temp(28));
	             		       
	s6 : sw PORT MAP(
			L1	=>  sw_temp(6),
			L2	=>	l_temp(15),
			L3	=>	sw_temp(5),
		    Ls  =>  sw_temp(8));

    s7 : sw PORT MAP(
			L1	=>  l_temp(14),
			L2	=>	l_temp(15),
			L3	=>	l_temp(13),
		    Ls  =>  sw_temp(9));
		    
    s8 : sw PORT MAP(
			L1	=>  sw_temp(7),
			L2	=>	l_temp(15),
			L3	=>	sw_temp(4),
		    Ls  =>  sw_temp(10));
		    		    	
    s9 : sw PORT MAP(
			L1	=>  '0',
			L2	=>	l_temp(16),
			L3	=>	l_temp(8),
		    Ls  =>  sw_temp(11));
		    
	 f13 : full_comp PORT MAP(
	    I1 => s_temp(23),
	    I2 => s_temp(28),
	    B  => b_temp(17),
	    L  => l_temp(17),
	    S  => min1);	
		        
  	 f14 : semi_comp PORT MAP(
			I1	=> b_temp(8),
			I2	=> b_temp(17),
		    S   => s_temp(29));
		    
  	 f15 : semi_comp PORT MAP(
			I1	=> b_temp(15),
			I2	=> b_temp(16),
		    S   => s_temp(30));	

  	 f16 : semi_comp PORT MAP(
			I1	=> s_temp(26),
			I2	=> s_temp(30),
		    S   => s_temp(31));	

	 f17 : semi_comp PORT MAP(
			I1	=> s_temp(27),
			I2	=> s_temp(31),
		    S   => s_temp(32));			 		    		    		    

  	 f18 : semi_comp PORT MAP(
			I1	=> s_temp(32),
			I2	=> s_temp(29),
		    S   => min2);	
		        
	--****index min1******-	   
   index_min1(4) <=  l_temp(17);
       
   s10 : sw PORT MAP(
			L1	=>  '0',
			L2	=>	l_temp(17),
			L3	=>	l_temp(15),
		    Ls  =>  index_min1(3));
		    
   s11 : sw PORT MAP(
			L1	=>  '0',
			L2	=>	l_temp(17),
			L3	=>	sw_temp(9),
		    Ls  =>  index_min1(2));
		    
   s12 : sw PORT MAP(
			L1	=>  l_temp(16),
			L2	=>	l_temp(17),
			L3	=>	sw_temp(10),
		    Ls  =>  index_min1(1));
		    
   s13 : sw PORT MAP(
			L1	=>  sw_temp(11),
			L2	=>	l_temp(17),
			L3	=>	sw_temp(8),
		    Ls  =>  index_min1(0));	
--******************************************--    	    		             
	    
END RTL;
