--***********************************************************************************************************--
--						USED LIBRAIRIES						     --
--***********************************************************************************************************--
LIBRARY ieee_proposed;
USE ieee_proposed.fixed_pkg.all;
USE WORK.mem_types.ALL;
--**********************************************************************************************************--
--						ENTITY DECLARATION					    --
--**********************************************************************************************************--

ENTITY inter_7 IS PORT(
	A: IN T(34 DOWNTO 0);
	C: IN control;
	N_Minusones: OUT T(18 DOWNTO 0);
	index_N: OUT index(6 DOWNTO 0);
	Minus_ones: OUT T(27 DOWNTO 0));
END inter_7;
--***********************************************************************************************************--
--						ARCHITECTURE DESCRIPTION				     --
--***********************************************************************************************************--
ARCHITECTURE RTL OF inter_7 IS

SIGNAL zeros : T1; 
BEGIN
	PROCESS(A,C)
	VARIABLE j: integer;
	VARIABLE k: integer;
	VARIABLE p: integer;
	BEGIN
		j:=18;
		k:=27;
		p:=6;
		zeros <=(to_sfixed(0,4,-7), to_sfixed(0,4,-7), to_sfixed(0,4,-7), to_sfixed(0,4,-7),to_sfixed(0,4,-7), to_sfixed(0,4,-7), to_sfixed(0,4,-7), to_sfixed(0,4,-7));
		FOR i IN 34 DOWNTO 0 LOOP
			IF C(i) >= 0 THEN
					N_Minusones(j)<= A(i);
					index_N(p)<=i;
					p:=p-1;
					j:=j-1;
			ELSIF C(i)=-1 THEN
				Minus_ones(k)<= A(i);
				k:=k-1;
			END IF;
		END LOOP;
		N_Minusones(j DOWNTO 0)<= (OTHERS=>zeros);
	END PROCESS;
END RTL;