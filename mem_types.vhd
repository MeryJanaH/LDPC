LIBRARY ieee_proposed;
USE ieee_proposed.fixed_pkg.all;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

PACKAGE mem_types is
    TYPE T1 IS ARRAY (7 downto 0) of sfixed(4 downto -7);
    TYPE T IS ARRAY (NATURAL RANGE <>) of T1;

    TYPE T2 IS ARRAY (7 downto 0) of sfixed(3 downto -7);
    TYPE Tb IS ARRAY (NATURAL RANGE <>) of T2;


    TYPE index IS ARRAY (NATURAL RANGE <>) OF INTEGER; 
    TYPE control IS ARRAY (34 DOWNTO 0) OF INTEGER;
    TYPE shift IS ARRAY (18 DOWNTO 0) OF INTEGER;
    TYPE layer_ctrl IS ARRAY (12 DOWNTO 0) OF control;
    TYPE layer_val IS ARRAY (12 DOWNTO 0) OF T(34 DOWNTO 0);

    
    TYPE T_arry  IS ARRAY (18 downto 0) of sfixed(4 downto -7);
    TYPE N_arry  IS ARRAY (18 downto 0) OF T_arry;
    TYPE S_arry  IS ARRAY (32 downto 0) of sfixed(4 downto -7);
    TYPE B_arry  IS ARRAY (17 downto 0) of sfixed(4 downto -7);
    TYPE L_arry  IS ARRAY (17 downto 0) of STD_LOGIC;
    TYPE SW_arry  IS ARRAY (11 downto 0) of STD_LOGIC;
END mem_types;