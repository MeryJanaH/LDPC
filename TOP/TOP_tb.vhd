LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.NUMERIC_STD.ALL;


	LIBRARY WORK;
	USE WORK.mem_types.ALL;
	
	LIBRARY ieee_proposed;
	USE ieee_proposed.fixed_pkg.all;
	
ENTITY TOP_tb IS 
END TOP_tb;

ARCHITECTURE RTL OF TOP_tb IS 
	
SIGNAL in1 : T(34 DOWNTO 0) := ((to_sfixed(1.3283,4,-7), to_sfixed(2.1198,4,-7), to_sfixed(-0.3793,4,-7), to_sfixed(1.5264,4,-7),to_sfixed(1.1946,4,-7), to_sfixed(0.2015,4,-7), to_sfixed(0.7352,4,-7), to_sfixed(1.2092,4,-7)),
		(to_sfixed(3.1850,4,-7), to_sfixed(2.6910,4,-7), to_sfixed(0.1758,4,-7), to_sfixed(2.8531,4,-7), to_sfixed(1.4429,4,-7), to_sfixed(0.9615,4,-7), to_sfixed(1.4364,4,-7), to_sfixed(0.8748,4,-7)),
		(to_sfixed(0.9242,4,-7), to_sfixed(1.9096,4,-7), to_sfixed(1.8604,4,-7), to_sfixed(1.8653,4,-7), to_sfixed(1.4100,4,-7), to_sfixed(0.2627,4,-7), to_sfixed(1.4379,4,-7), to_sfixed(1.9954,4,-7)),
		(to_sfixed(1.2985,4,-7), to_sfixed(1.6318,4,-7), to_sfixed(1.4438,4,-7), to_sfixed(0.8147,4,-7), to_sfixed(1.1794,4,-7), to_sfixed(0.5193,4,-7), to_sfixed(1.5425,4,-7), to_sfixed(0.2996,4,-7)),
		(to_sfixed(0.3473,4,-7), to_sfixed(0.5057,4,-7), to_sfixed(-0.7978,4,-7),to_sfixed(1.8783,4,-7), to_sfixed(1.1986,4,-7), to_sfixed(0.5390,4,-7), to_sfixed(1.8367,4,-7), to_sfixed(-0.0451,4,-7)),
		(to_sfixed(0.9376,4,-7), to_sfixed(0.8526,4,-7), to_sfixed(1.1949,4,-7), to_sfixed(1.1910,4,-7), to_sfixed(0.4719,4,-7), to_sfixed(0.9817,4,-7), to_sfixed(0.8993,4,-7), to_sfixed(1.3833,4,-7)),
		(to_sfixed(1.6676,4,-7), to_sfixed(1.6773,4,-7), to_sfixed(0.4726,4,-7), to_sfixed(1.0472,4,-7), to_sfixed(0.2587,4,-7), to_sfixed(0.3201,4,-7), to_sfixed(0.9958,4,-7), to_sfixed(1.9358,4,-7)),
		(to_sfixed(0.5300,4,-7), to_sfixed(1.2268,4,-7), to_sfixed(0.8623,4,-7), to_sfixed(1.6823,4,-7), to_sfixed(0.3350,4,-7), to_sfixed(1.0199,4,-7), to_sfixed(1.3374,4,-7), to_sfixed(1.6720,4,-7)),
		(to_sfixed(1.9429,4,-7), to_sfixed(1.0525,4,-7), to_sfixed(0.0892,4,-7), to_sfixed(0.5467,4,-7), to_sfixed(0.3518,4,-7), to_sfixed(2.4352,4,-7), to_sfixed(0.6241,4,-7), to_sfixed(1.4568,4,-7)),
		(to_sfixed(0.8825,4,-7), to_sfixed(1.5426,4,-7), to_sfixed(0.5330,4,-7), to_sfixed(0.1438,4,-7), to_sfixed(0.1315,4,-7), to_sfixed(1.2981,4,-7), to_sfixed(0.8917,4,-7), to_sfixed(0.8803,4,-7)),
		(to_sfixed(1.8666,4,-7), to_sfixed(1.1780,4,-7), to_sfixed(1.1208,4,-7), to_sfixed(1.9695,4,-7), to_sfixed(0.5088,4,-7), to_sfixed(1.4254,4,-7), to_sfixed(1.5099,4,-7), to_sfixed(0.8512,4,-7)),
		(to_sfixed(1.1317,4,-7), to_sfixed(0.2881,4,-7), to_sfixed(0.2991,4,-7), to_sfixed(1.0640,4,-7), to_sfixed(1.4410,4,-7), to_sfixed(2.5787,4,-7), to_sfixed(0.5928,4,-7), to_sfixed(1.1144,4,-7)),
		(to_sfixed(0.9496,4,-7), to_sfixed(-0.1803,4,-7),to_sfixed(0.7320,4,-7), to_sfixed(-0.0958,4,-7),to_sfixed(1.5131,4,-7), to_sfixed(0.4578,4,-7), to_sfixed(1.0611,4,-7), to_sfixed(0.6675,4,-7)),
		(to_sfixed(1.1853,4,-7), to_sfixed(0.6334,4,-7), to_sfixed(1.2992,4,-7), to_sfixed(1.4515,4,-7), to_sfixed(2.0453,4,-7), to_sfixed(0.8815,4,-7), to_sfixed(-0.3057,4,-7),to_sfixed(0.4873,4,-7)),
		(to_sfixed(1.8271,4,-7), to_sfixed(0.3453,4,-7), to_sfixed(1.5868,4,-7), to_sfixed(1.0757,4,-7), to_sfixed(1.8773,4,-7), to_sfixed(-0.1973,4,-7), to_sfixed(0.8793,4,-7),to_sfixed(0.2625,4,-7)),
		(to_sfixed(2.7756,4,-7), to_sfixed(1.5039,4,-7), to_sfixed(1.8420,4,-7), to_sfixed(0.3539,4,-7), to_sfixed(0.7139,4,-7), to_sfixed(0.8336,4,-7), to_sfixed(1.6707,4,-7), to_sfixed(0.8303,4,-7)),
		(to_sfixed(1.4284,4,-7), to_sfixed(-0.2528,4,-7),to_sfixed(0.7839,4,-7), to_sfixed(0.4971,4,-7), to_sfixed(0.0370,4,-7), to_sfixed(1.3102,4,-7), to_sfixed(1.1722,4,-7), to_sfixed(1.0204,4,-7)),
		(to_sfixed(0.1856,4,-7), to_sfixed(1.6885,4,-7), to_sfixed(1.2138,4,-7), to_sfixed(0.8174,4,-7), to_sfixed(1.0140,4,-7), to_sfixed(0.8400,4,-7), to_sfixed(-0.0687,4,-7),to_sfixed(0.8256,4,-7)),
		(to_sfixed(0.4924,4,-7), to_sfixed(0.4021,4,-7), to_sfixed(0.2939,4,-7), to_sfixed(0.6742,4,-7), to_sfixed(-0.2228,4,-7),to_sfixed(1.5888,4,-7), to_sfixed(1.3176,4,-7), to_sfixed(0.9878,4,-7)),
		(to_sfixed(0.9788,4,-7), to_sfixed(0.5126,4,-7), to_sfixed(1.6220,4,-7), to_sfixed(0.9187,4,-7), to_sfixed(0.5637,4,-7), to_sfixed(1.8252,4,-7), to_sfixed(0.8628,4,-7), to_sfixed(0.6403,4,-7)),
		(to_sfixed(0.8206,4,-7), to_sfixed(0.4823,4,-7), to_sfixed(0.3160,4,-7), to_sfixed(2.5424,4,-7), to_sfixed(2.0109,4,-7), to_sfixed(1.1878,4,-7), to_sfixed(0.2324,4,-7), to_sfixed(0.4715,4,-7)),
		(to_sfixed(0.8922,4,-7), to_sfixed(1.4832,4,-7), to_sfixed(0.1867,4,-7), to_sfixed(-0.4226,4,-7),to_sfixed(0.1152,4,-7), to_sfixed(1.2036,4,-7), to_sfixed(1.2390,4,-7), to_sfixed(1.2758,4,-7)),
		(to_sfixed(0.9204,4,-7), to_sfixed(1.1122,4,-7), to_sfixed(0.7093,4,-7), to_sfixed(1.5264,4,-7), to_sfixed(0.1685,4,-7), to_sfixed(1.2778,4,-7), to_sfixed(0.4818,4,-7), to_sfixed(0.7955,4,-7)),
		(to_sfixed(1.3375,4,-7), to_sfixed(1.6345,4,-7), to_sfixed(0.3176,4,-7), to_sfixed(1.7698,4,-7), to_sfixed(1.4031,4,-7), to_sfixed(0.9586,4,-7), to_sfixed(0.8808,4,-7), to_sfixed(0.8671,4,-7)),
		(to_sfixed(0.8149,4,-7), to_sfixed(1.0141,4,-7), to_sfixed(1.0313,4,-7), to_sfixed(1.5044,4,-7), to_sfixed(1.9324,4,-7), to_sfixed(1.2851,4,-7), to_sfixed(0.8719,4,-7), to_sfixed(1.3817,4,-7)),
		(to_sfixed(1.1119,4,-7), to_sfixed(0.3712,4,-7), to_sfixed(1.5796,4,-7), to_sfixed(1.1875,4,-7), to_sfixed(1.0825,4,-7), to_sfixed(1.3146,4,-7), to_sfixed(1.1596,4,-7), to_sfixed(0.4251,4,-7)),
		(to_sfixed(0.1856,4,-7), to_sfixed(1.6885,4,-7), to_sfixed(1.2138,4,-7), to_sfixed(0.8174,4,-7), to_sfixed(1.0140,4,-7), to_sfixed(0.8400,4,-7), to_sfixed(-0.0687,4,-7),to_sfixed(0.8256,4,-7)),
		(to_sfixed(0.4924,4,-7), to_sfixed(0.4021,4,-7), to_sfixed(0.2939,4,-7), to_sfixed(0.6742,4,-7), to_sfixed(-0.2228,4,-7),to_sfixed(1.5888,4,-7), to_sfixed(1.3176,4,-7), to_sfixed(0.9878,4,-7)),
		(to_sfixed(0.9788,4,-7), to_sfixed(0.5126,4,-7), to_sfixed(1.6220,4,-7), to_sfixed(0.9187,4,-7), to_sfixed(0.5637,4,-7), to_sfixed(1.8252,4,-7), to_sfixed(0.8628,4,-7), to_sfixed(0.6403,4,-7)),
		(to_sfixed(0.8206,4,-7), to_sfixed(0.4823,4,-7), to_sfixed(0.3160,4,-7), to_sfixed(2.5424,4,-7), to_sfixed(2.0109,4,-7), to_sfixed(1.1878,4,-7), to_sfixed(0.2324,4,-7), to_sfixed(0.4715,4,-7)),
		(to_sfixed(0.8922,4,-7), to_sfixed(1.4832,4,-7), to_sfixed(0.1867,4,-7), to_sfixed(-0.4226,4,-7),to_sfixed(0.1152,4,-7), to_sfixed(1.2036,4,-7), to_sfixed(1.2390,4,-7), to_sfixed(1.2758,4,-7)),
		(to_sfixed(0.9204,4,-7), to_sfixed(1.1122,4,-7), to_sfixed(0.7093,4,-7), to_sfixed(1.5264,4,-7), to_sfixed(0.1685,4,-7), to_sfixed(1.2778,4,-7), to_sfixed(0.4818,4,-7), to_sfixed(0.7955,4,-7)),
		(to_sfixed(1.3375,4,-7), to_sfixed(1.6345,4,-7), to_sfixed(0.3176,4,-7), to_sfixed(1.7698,4,-7), to_sfixed(1.4031,4,-7), to_sfixed(0.9586,4,-7), to_sfixed(0.8808,4,-7), to_sfixed(0.8671,4,-7)),
		(to_sfixed(0.8149,4,-7), to_sfixed(1.0141,4,-7), to_sfixed(1.0313,4,-7), to_sfixed(1.5044,4,-7), to_sfixed(1.9324,4,-7), to_sfixed(1.2851,4,-7), to_sfixed(0.8719,4,-7), to_sfixed(1.3817,4,-7)),
		(to_sfixed(1.1119,4,-7), to_sfixed(0.3712,4,-7), to_sfixed(1.5796,4,-7), to_sfixed(1.1875,4,-7), to_sfixed(1.0825,4,-7), to_sfixed(1.3146,4,-7), to_sfixed(1.1596,4,-7), to_sfixed(0.4251,4,-7)));	

SIGNAL LC : layer_ctrl := ((2, 5, 2, 7, -1, 4, 2, -1, -1, 3, 5, 6, 7, 1, -1, 3, 7, -1, 6, 3, 7, 7, 1, 0 ,-1 , -1, -1 , -1, -1, -1, -1, -1, -1, -1, -1),
			   (2, -1, 7, 5, 4, 7, -1, 6, 0, 5, -1, 4, 6, -1, 5, 4, 6, 3, -1, 7, -1, 4, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
			   (2, 7, 1, -1, 7, 5, 5, 5, 1, 7, 7, -1, -1, 6, 1, 1, -1, 5, 5, 3, 5, -1, -1, -1, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1),
                           (1, 1, -1, 4, 4, -1, 6, 3, 3, -1, 0, 6, 6, 3, 3, -1, 0, 4, 4, -1, 0, 4, 1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1),
			   (5, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1),
                           (5, 4, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, 7, -1, -1, -1, 4, -1, -1, -1, -1, 3, 3, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1),
			   (7, -1, -1, -1, -1, -1, 6, -1, -1, -1, 4, 3, -1, 4, -1, -1, -1, 3, 5, -1, 3, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1),
		           (4, 4, -1, -1, 7, -1, -1, 7, 7, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1),
			   (0, 4, -1, 7, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, 6, -1, -1, 4, -1, 5, 1, -1, 2, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1),
                           (7, 6, -1, -1, -1, -1, -1, -1, -1, -1, 5, 5, -1, 6, -1, -1, -1, 6, 5, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1),
			   (-1, 2, 5, -1, 7, -1, -1, 0, 1, -1, -1, -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1),
			   (5, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, 6, -1, -1, -1, -1, 6, 4, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1),
			   (0, 2, -1, -1, -1, -1, -1, -1, -1, -1, 5, 0, -1, 2, -1, -1, -1, -1, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0));
			   
		SIGNAL MemAdr, clk, rst : STD_LOGIC;
		SIGNAL count_layer, cpt : STD_LOGIC_VECTOR(3 DOWNTO 0);
		SIGNAL in2  : T(34 DOWNTO 0);
		SIGNAL out2 : T(34 DOWNTO 0);
		SIGNAL lyr  : layer_ctrl;
		
COMPONENT TOP IS
	PORT(
	LC			: IN layer_ctrl;
	receive_llr : IN T(34 DOWNTO 0);
	vector_out  : OUT T(34 DOWNTO 0);
	clk 		: IN STD_LOGIC;
	rst 		: IN STD_LOGIC;
	count_layer : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	mem_adr 	: IN STD_LOGIC);
END COMPONENT;
	
BEGIN 

tb : TOP PORT MAP(
         LC          => lyr,
         receive_llr => in2,
         vector_out  => out2,
         clk         => clk,
         rst         => rst,
	 count_layer => count_layer,
         mem_adr     => MemAdr );
         
      
PROCESS
BEGIN
clk <= '0';
WAIT FOR 100 NS;
clk <= '1';
WAIT FOR 100 NS;
END PROCESS;

PROCESS
BEGIN
rst <= '0';
WAIT FOR 10 NS;
rst <= '1';
WAIT FOR 500 MS;
END PROCESS;

PROCESS
BEGIN

lyr    <= LC;

WAIT FOR 1 MS;

END PROCESS;
                        
PROCESS
BEGIN

MemAdr <= '1';
in2    <= in1;
cpt <="0000";
WAIT FOR 200 NS;


MemAdr <= '0';
FOR i IN 11 DOWNTO 0 LOOP
	cpt <= std_logic_vector (unsigned(cpt) + 1);
	WAIT FOR 200 NS;
END LOOP;
cpt<= "0000";
WAIT FOR 50 NS;
FOR i IN 11 DOWNTO 0 LOOP
	cpt <= std_logic_vector (unsigned(cpt) + 1);
	WAIT FOR 200 NS;
END LOOP;
cpt<= "0000";
WAIT FOR 50 NS;
FOR i IN 11 DOWNTO 0 LOOP
	cpt <= std_logic_vector (unsigned(cpt) + 1);
	WAIT FOR 200 NS;
END LOOP;
WAIT FOR 1 MS;
END PROCESS;
count_layer<=cpt;
         
END RTL;