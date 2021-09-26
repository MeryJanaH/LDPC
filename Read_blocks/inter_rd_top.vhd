--***********************************************************************************************************--
--						USED LIBRAIRIES						     --
--***********************************************************************************************************--
USE WORK.mem_types.ALL;
--**********************************************************************************************************--
--						ENTITY DECLARATION					    --
--**********************************************************************************************************--
ENTITY inter_rd_top IS PORT(
	LV: IN layer_val;
	LC: IN layer_ctrl;
	COM: IN INTEGER;
	S19: OUT T(18 DOWNTO 0);
	R19: OUT T(15 DOWNTO 0);
	I19: OUT index(18 DOWNTO 0);
	R10: OUT T(24 DOWNTO 0);
	I10: OUT index(9 DOWNTO 0);
	R9: OUT T(25 DOWNTO 0);
	I9: OUT index(8 DOWNTO 0);
	R8: OUT T(26 DOWNTO 0);
	I8: OUT index(7 DOWNTO 0);
	R7: OUT T(27 DOWNTO 0);
	I7: OUT index(6 DOWNTO 0);
	R3: OUT T(31 DOWNTO 0);
	I3:  OUT index(2 DOWNTO 0));
END inter_rd_top;
--***********************************************************************************************************--
--						ARCHITECTURE DESCRIPTION				     --
--***********************************************************************************************************--
ARCHITECTURE RTL OF inter_rd_top IS
COMPONENT inter_19
PORT(
	A: IN T(34 DOWNTO 0);
	C: IN control;
	N_Minusones: OUT T(18 DOWNTO 0);
	index_N: OUT index(18 DOWNTO 0);
	Minus_ones: OUT T(15 DOWNTO 0));
END COMPONENT;
COMPONENT inter_10
PORT(
	A: IN T(34 DOWNTO 0);
	C: IN control;
	N_Minusones: OUT T(18 DOWNTO 0);
	index_N: OUT index(9 DOWNTO 0);
	Minus_ones: OUT T(24 DOWNTO 0)
);
END COMPONENT;
COMPONENT inter_9
PORT(
	A: IN T(34 DOWNTO 0);
	C: IN control;
	N_Minusones: OUT T(18 DOWNTO 0);
	index_N: OUT index(8 DOWNTO 0);
	Minus_ones: OUT T(25 DOWNTO 0));
END COMPONENT;
COMPONENT inter_8
PORT(
	A: IN T(34 DOWNTO 0);
	C: IN control;
	N_Minusones: OUT T(18 DOWNTO 0);
	index_N: OUT index(7 DOWNTO 0);
	Minus_ones: OUT T(26 DOWNTO 0));
END COMPONENT;
COMPONENT inter_7
PORT(
	A: IN T(34 DOWNTO 0);
	C: IN control;
	N_Minusones: OUT T(18 DOWNTO 0);
	index_N: OUT index(6 DOWNTO 0);
	Minus_ones: OUT T(27 DOWNTO 0));
END COMPONENT;
COMPONENT inter_3
PORT(
	A: IN T(34 DOWNTO 0);
	C: IN control;
	N_Minusones: OUT T(18 DOWNTO 0);
	index_N: OUT index(2 DOWNTO 0);
	Minus_ones: OUT T(31 DOWNTO 0));
END COMPONENT;
SIGNAL sig12,sig11,sig10,sig9,sig8,sig7,sig6,sig5,sig4,sig3,sig2,sig1,sig0,elsig19: T(18 DOWNTO 0);
SIGNAL ind12,ind11,ind10,ind9,elsind19: index(18 DOWNTO 0);
SIGNAL val12,val11,val10,val9,elsval19: T(15 DOWNTO 0);
SIGNAL ind8,elsind3: index(2 DOWNTO 0);
SIGNAL val8,elsval3: T(31 DOWNTO 0);
SIGNAL ind1,ind7,elsind8 : index(7 DOWNTO 0);
SIGNAL val1,val7,elsval8 : T(26 DOWNTO 0);
SIGNAL ind6,ind3,elsind9 : index(8 DOWNTO 0);
SIGNAL val6,val3,elsval9 : T(25 DOWNTO 0);
SIGNAL ind5,ind2,ind0,elsind7: index(6 DOWNTO 0);
SIGNAL val5,val2,val0,elsval7 : T(27 DOWNTO 0);
SIGNAL ind4,elsind10: index (9 DOWNTO 0);
SIGNAL val4,elsval10: T(24 DOWNTO 0);
BEGIN
		

		inst1_1: inter_19
		PORT MAP(
			A => LV(12),
			C => LC(12),
			N_Minusones => sig12,
			index_N => ind12,
			Minus_ones => val12);	

		inst1_2: inter_19
		PORT MAP(
			A => LV(11),
			C => LC(11),
			N_Minusones => sig11,
			index_N => ind11,
			Minus_ones => val11);	

		inst1_3: inter_19 
		PORT MAP(
			A => LV(10),
			C => LC(10),
			N_Minusones => sig10,
			index_N => ind10,
			Minus_ones => val10);

		inst1_4: inter_19 
		PORT MAP(
			A => LV(9),
			C => LC(9),
			N_Minusones => sig9,
			index_N => ind9,
			Minus_ones => val9);

		inst2: inter_3 
		PORT MAP(
			A => LV(8),
			C => LC(8),
			N_Minusones => sig8,
			index_N => ind8,
			Minus_ones => val8);
	
		inst3_1: inter_8 
		PORT MAP(
			A => LV(7),
			C => LC(7),
			N_Minusones => sig7,
			index_N => ind7,
			Minus_ones => val7);

		inst3_2: inter_8 
		PORT MAP(
			A => LV(1),
			C => LC(1),
			N_Minusones => sig1,
			index_N => ind1,
			Minus_ones => val1);

		inst4_1: inter_9 
		PORT MAP(
			A => LV(6),
			C => LC(6),
			N_Minusones => sig6,
			index_N => ind6,
			Minus_ones => val6);
		
		inst4_2: inter_9 
		PORT MAP(
			A => LV(3),
			C => LC(3),
			N_Minusones => sig3,
			index_N => ind3,
			Minus_ones => val3);

		inst5_1: inter_7 
		PORT MAP(
			A => LV(5),
			C => LC(5),
			N_Minusones => sig5,
			index_N => ind5,
			Minus_ones => val5);

		inst5_2: inter_7 
		PORT MAP(
			A => LV(2),
			C => LC(2),
			N_Minusones => sig2,
			index_N => ind2,
			Minus_ones => val2);

		inst5_3: inter_7 
		PORT MAP(
			A => LV(0),
			C => LC(0),
			N_Minusones => sig0,
			index_N => ind0,
			Minus_ones => val0);


		inst6: inter_10 
		PORT MAP(
			A => LV(4),
			C => LC(4),
			N_Minusones => sig4,
			index_N => ind4,
			Minus_ones => val4);

	
		WITH COM SELECT
		S19 <= sig12 WHEN 12,
		       sig11 WHEN 11,
		       sig10 WHEN 10,
		       sig9 WHEN 9,
		       sig8 WHEN 8,
  		       sig7 WHEN 7,
		       sig6 WHEN 6,
		       sig5 WHEN 5,
		       sig4 WHEN 4,
		       sig3 WHEN 3,
		       sig2 WHEN 2,
		       sig1 WHEN 1,
		       sig0 WHEN 0,
		       elsig19 WHEN OTHERS;

		WITH COM SELECT
		I19 <= ind12 WHEN 12,
		       ind11 WHEN 11,
		       ind10 WHEN 10,
		       ind9 WHEN 9,
		       elsind19 WHEN OTHERS;

		WITH COM SELECT
		R19 <= val12 WHEN 12,
		       val11 WHEN 11,
		       val10 WHEN 10,
		       val9 WHEN 9,
		       elsval19 WHEN OTHERS;

		WITH COM SELECT
		I9  <= ind6 WHEN 6,
		       ind3 WHEN 3,
		       elsind9 WHEN OTHERS;

		WITH COM SELECT
		R9  <= val6 WHEN 6,
		       val3 WHEN 3,
		       elsval9 WHEN OTHERS;	
	
		WITH COM SELECT
		I8  <= ind7 WHEN 7,
		       ind1 WHEN 1,
		       elsind8 WHEN OTHERS;	
	
		WITH COM SELECT
		R8  <= val7 WHEN 7,
		       val1 WHEN 1,
		       elsval8 WHEN OTHERS;

		WITH COM SELECT
		I7  <= ind5 WHEN 5,
		       ind2 WHEN 2,
		       ind0 WHEN 0,
		       elsind7 WHEN OTHERS;
		WITH COM SELECT
		R7  <= val5 WHEN 5,
		       val2 WHEN 2,
		       val0 WHEN 0,
		       elsval7 WHEN OTHERS;

		I3  <= ind8 WHEN COM = 8 ELSE elsind3;
		R3  <= val8 WHEN COM = 8 ELSE elsval3;

		I10 <= ind4 WHEN COM= 4 ELSE elsind10;
		R10 <= val4 WHEN COM= 4 ELSE elsval10;
			
		
END RTL;