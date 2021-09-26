--***********************************************************************************************************--
--						USED LIBRAIRIES						     --
--***********************************************************************************************************--
USE WORK.mem_types.ALL;
--**********************************************************************************************************--
--						ENTITY DECLARATION					    --
--**********************************************************************************************************--
ENTITY inter_19 IS PORT(
	A: IN T(34 DOWNTO 0);
	C: IN control;
	N_Minusones: OUT T(18 DOWNTO 0);
	index_N: OUT index(18 DOWNTO 0);
	Minus_ones: OUT T(15 DOWNTO 0));
END inter_19;
--***********************************************************************************************************--
--						ARCHITECTURE DESCRIPTION				     --
--***********************************************************************************************************--
ARCHITECTURE RTL OF inter_19 IS
BEGIN
	PROCESS(A,C)
	VARIABLE j: integer;
	VARIABLE k: integer;
	BEGIN
		j:=18;
		k:=15;
		FOR i IN 34 DOWNTO 0 LOOP
			IF C(i) >= 0 THEN
					N_Minusones(j)<= A(i);
					index_N(j)<=i;
					j:=j-1;
			ELSIF C(i)=-1 THEN
				Minus_ones(k)<= A(i);
				k:=k-1;
			END IF;
		END LOOP;
	END PROCESS;
END RTL;