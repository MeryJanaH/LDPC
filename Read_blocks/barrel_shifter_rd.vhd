--*****************************************************************************************************************--
--						USED LIBRAIRIES							   --
--*****************************************************************************************************************--
USE WORK.mem_types.ALL;
--*****************************************************************************************************************--
--						ENTITY DECLARATION						   --
--*****************************************************************************************************************--
ENTITY barrel_shifter_rd IS PORT(
	vector_in: IN T(18 DOWNTO 0);
	shifter_vector: IN shift;
	vector_out: OUT T(18 DOWNTO 0));
END barrel_shifter_rd;
--*****************************************************************************************************************--
--						ARCHITECTURE DESCRIPTION					   --
--*****************************************************************************************************************--
ARCHITECTURE RTL OF barrel_shifter_rd IS
BEGIN
	PROCESS(vector_in,shifter_vector)
	VARIABLE k : INTEGER;
	VARIABLE sig: T1;
	BEGIN
		FOR i IN 18 DOWNTO 0 LOOP
			FOR j IN 7 DOWNTO 0 LOOP
				sig(j):=vector_in(i)(j);
			END LOOP;
			k:=shifter_vector(i);
			IF shifter_vector(i)>0 THEN
				FOR j IN 7 DOWNTO 1 LOOP
					IF k>0 THEN
						sig:= sig(0) & sig(7 DOWNTO 1);
						k:=k-1;
					ELSE EXIT;
					END IF;
				END LOOP;
				vector_out(i)<=sig;
			ELSE vector_out(i)<=vector_in(i);
			END IF;
		END LOOP;
	END PROCESS;
END RTL ;