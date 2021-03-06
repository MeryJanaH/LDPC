--***********************************************************************************************************--
--						USED LIBRAIRIES						     --
--***********************************************************************************************************--
USE WORK.mem_types.ALL;
--**********************************************************************************************************--
--						ENTITY DECLARATION					    --
--**********************************************************************************************************--
ENTITY top_wt IS
PORT( 
	COM : IN INTEGER;
	vector_in: IN T(18 DOWNTO 0);
	R19: IN T(15 DOWNTO 0);
	I19: IN index(18 DOWNTO 0);
	R10: IN T(24 DOWNTO 0);
	I10: IN index(9 DOWNTO 0);
	R9: IN T(25 DOWNTO 0);
	I9: IN index(8 DOWNTO 0);
	R8: IN T(26 DOWNTO 0);
	I8: IN index(7 DOWNTO 0);
	R7: IN T(27 DOWNTO 0);
	I7: IN index(6 DOWNTO 0);
	R3: IN T(31 DOWNTO 0);
	I3:  IN index(2 DOWNTO 0);
	used_layer : IN shift;
	vector_out : OUT T(34 DOWNTO 0)
);
END top_wt;
--***********************************************************************************************************--
--						ARCHITECTURE DESCRIPTION				     --
--***********************************************************************************************************--
ARCHITECTURE RTL OF top_wt IS

COMPONENT barrel_wt IS PORT(
	A: IN T(18 DOWNTO 0);
	C: IN shift;
	S: OUT T(18 DOWNTO 0));
END COMPONENT;

COMPONENT inter_wt_19 IS
PORT( 
	N: IN T(18 DOWNTO 0);
	R: IN T(15 DOWNTO 0);
	Ind: IN index(18 DOWNTO 0);
	S: OUT T(34 DOWNTO 0)
);
END COMPONENT;

COMPONENT inter_wt_3 IS
PORT( 
	N: IN T(18 DOWNTO 0);
	R: IN T(31 DOWNTO 0);
	Ind: IN index(2 DOWNTO 0);
	S: OUT T(34 DOWNTO 0)
);
END COMPONENT;

COMPONENT inter_wt_10 IS
PORT( 
	N: IN T(18 DOWNTO 0);
	R: IN T(24 DOWNTO 0);
	Ind: IN index(9 DOWNTO 0);
	S: OUT T(34 DOWNTO 0)
);
END COMPONENT;

COMPONENT inter_wt_7 IS
PORT( 
	N: IN T(18 DOWNTO 0);
	R: IN T(27 DOWNTO 0);
	Ind: IN index(6 DOWNTO 0);
	S: OUT T(34 DOWNTO 0)
);
END COMPONENT;

COMPONENT inter_wt_8 IS
PORT( 
	N: IN T(18 DOWNTO 0);
	R: IN T(26 DOWNTO 0);
	Ind: IN index(7 DOWNTO 0);
	S: OUT T(34 DOWNTO 0)
);
END COMPONENT;

COMPONENT inter_wt_9 IS
PORT( 
	N: IN T(18 DOWNTO 0);
	R: IN T(25 DOWNTO 0);
	Ind: IN index(8 DOWNTO 0);
	S: OUT T(34 DOWNTO 0)
);
END COMPONENT;
SIGNAL sig19, sig8, sig9,sig7,sig3 ,sig10 ,elsig:  T(34 DOWNTO 0);
SIGNAL Nsig: T(18 DOWNTO 0);
BEGIN
	U0: barrel_wt PORT MAP(
		A => vector_in,
		C => used_layer,
		S => Nsig);	

	U1: inter_wt_19 PORT MAP( 
		N => Nsig,
		R => R19,
		Ind => I19,
		S => sig19);

	U2: inter_wt_3 PORT MAP( 
		N => Nsig,
		R => R3,
		Ind => I3,
		S => sig3);

	U3: inter_wt_10 PORT MAP( 
		N => Nsig,
		R => R10,
		Ind => I10,
		S => sig10);

	U4: inter_wt_7 PORT MAP( 
		N => Nsig,
		R => R7,
		Ind => I7,
		S => sig7);

	U5: inter_wt_8 PORT MAP( 
		N => Nsig,
		R => R8,
		Ind => I8,
		S => sig8);

	U6: inter_wt_9 PORT MAP( 
		N => Nsig,
		R => R9,
		Ind => I9,
		S => sig9);

	WITH COM SELECT 
		vector_out  <= sig19 WHEN 12 ,
			       sig19 WHEN 11 ,
			       sig19 WHEN 10 ,
			       sig19 WHEN 9,
			       sig3 WHEN 8,
			       sig8 WHEN 7,
			       sig8 WHEN 1,
			       sig9 WHEN 6,
			       sig9 WHEN 3,
			       sig7 WHEN 5,
			       sig7 WHEN 2,
			       sig7 WHEN 0,
			       sig10 WHEN 4,
			       elsig WHEN OTHERS;
END RTL;	
		