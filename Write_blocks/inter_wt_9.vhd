--***********************************************************************************************************--
--						USED LIBRAIRIES						     --
--***********************************************************************************************************--
USE WORK.mem_types.ALL;
--**********************************************************************************************************--
--						ENTITY DECLARATION					    --
--**********************************************************************************************************--
ENTITY inter_wt_9 IS
PORT( 
	N: IN T(18 DOWNTO 0);
	R: IN T(25 DOWNTO 0);
	Ind: IN index(8 DOWNTO 0);
	S: OUT T(34 DOWNTO 0)
);
END inter_wt_9;
--***********************************************************************************************************--
--						ARCHITECTURE DESCRIPTION				     --
--***********************************************************************************************************--
ARCHITECTURE RTL OF inter_wt_9 IS
BEGIN
	PROCESS(N,R)
	VARIABLE j : INTEGER;
	VARIABLE k : INTEGER;
	VARIABLE p : INTEGER;
	BEGIN
		j:=18;
		k:=25;
		p:=8;
		FOR i IN 34 DOWNTO 0 LOOP
			IF  p>=0 and Ind(p)=i THEN
				S(i)<= N(j);
				j:=j-1;
				p:=p-1;
			ELSIF  k>=0 THEN
				S(i)<= R(k) ;
				k:=k-1;
			END IF;
		END LOOP;
	END PROCESS;
END RTL;