--***********************************************************************************************************--
--						USED LIBRAIRIES						     --
--***********************************************************************************************************--
USE WORK.mem_types.ALL;
--**********************************************************************************************************--
--						ENTITY DECLARATION					    --
--**********************************************************************************************************--
ENTITY barrel_wt IS PORT(
	A: IN T(18 DOWNTO 0);
	C: IN shift;
	S: OUT T(18 DOWNTO 0));
END barrel_wt;
--***********************************************************************************************************--
--						ARCHITECTURE DESCRIPTION				     --
--***********************************************************************************************************--
ARCHITECTURE RTL OF barrel_wt IS
BEGIN
	PROCESS(A,C)
	VARIABLE k : INTEGER;
	VARIABLE sig: T1;
	BEGIN
		FOR i IN 18 DOWNTO 0 LOOP
			FOR j IN 7 DOWNTO 0 LOOP
				sig(j):=A(i)(j);
			END LOOP;
			k:=8-C(i);
			IF C(i)>0 THEN
				FOR j IN 7 DOWNTO 1 LOOP
					IF k>0 THEN
						sig:= sig(0) & sig(7 DOWNTO 1);
						k:=k-1;
					ELSE EXIT;
					END IF;
				END LOOP;
				S(i)<=sig;
			ELSE S(i)<=A(i);
			END IF;
		END LOOP;
	END PROCESS;
END RTL ;