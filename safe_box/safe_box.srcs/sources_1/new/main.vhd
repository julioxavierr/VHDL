-- main


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
Port (  
        MODE :          			in STD_LOGIC;
        DIGIT_CLOCK :         		in STD_LOGIC;
        SHIFT_SELECT :  			in STD_LOGIC;
        DIGIT :         			in STD_LOGIC;

        D0_DIGIT :            		out STD_LOGIC;
        D1_DIGIT :            		out STD_LOGIC;
        D2_DIGIT :            		out STD_LOGIC;
        D3_DIGIT :            		out STD_LOGIC;
        D4_DIGIT :            		out STD_LOGIC;
        D5_DIGIT :            		out STD_LOGIC;
        D6_DIGIT :            		out STD_LOGIC;
        D7_DIGIT :            		out STD_LOGIC;
        D8_DIGIT :            		out STD_LOGIC;
        D9_DIGIT :            		out STD_LOGIC;

        D0_CONFIG :            		in STD_LOGIC;
        D1_CONFIG :            		in STD_LOGIC;
        D2_CONFIG :            		in STD_LOGIC;
        D3_CONFIG :            		in STD_LOGIC;
        D4_CONFIG :            		in STD_LOGIC;
        D5_CONFIG :            		in STD_LOGIC;
        D6_CONFIG :            		in STD_LOGIC;
        D7_CONFIG :            		in STD_LOGIC;
        D8_CONFIG :            		in STD_LOGIC;
        D9_CONFIG :            		in STD_LOGIC;

        SAVE_PASSWORD_CLOCK :		in STD_LOGIC;
        CONFIRM_PASSWORD_CLOCK :	in STD_LOGIC;

        OPEN_SAFE_BOX :				out STD_LOGIC;
        ERROR_COUNT_D0 :			out STD_LOGIC;
        ERROR_COUNT_D1 :			out STD_LOGIC);
end main;

architecture Behavioral of main is

component password_config is
Port (  D0 :            				in STD_LOGIC;
        D1 :            				in STD_LOGIC;
        D2 :            				in STD_LOGIC;
        D3 :            				in STD_LOGIC;
        D4 :            				in STD_LOGIC;
        D5 :            				in STD_LOGIC;
        D6 :            				in STD_LOGIC;
        D7 :            				in STD_LOGIC;
        D8 :            				in STD_LOGIC;
        D9 :            				in STD_LOGIC;
        MODE :          				in STD_LOGIC;
        SAVE_PASSWORD_CLOCK :         	in STD_LOGIC;
        U6_Q0 :							out STD_LOGIC;
        U6_Q1 :							out STD_LOGIC;
        U6_Q2 :							out STD_LOGIC;
        U6_Q3 :							out STD_LOGIC;
        U6_Q4 :							out STD_LOGIC;
        U6_Q5 :							out STD_LOGIC;
        U29_Q0 :						out STD_LOGIC;
        U29_Q1 :						out STD_LOGIC;
        U29_Q2 :						out STD_LOGIC;
        U29_Q3 :						out STD_LOGIC;
        U29_Q4 :						out STD_LOGIC;
        U29_Q5 :						out STD_LOGIC);
end component;

component shift_register is
Port (  
        MODE :          in STD_LOGIC;
        CLOCK :         in STD_LOGIC;
        SHIFT_SELECT :  in STD_LOGIC;
        DIGIT :         in STD_LOGIC;
        D0 :            out STD_LOGIC;
        D1 :            out STD_LOGIC;
        D2 :            out STD_LOGIC;
        D3 :            out STD_LOGIC;
        D4 :            out STD_LOGIC;
        D5 :            out STD_LOGIC;
        D6 :            out STD_LOGIC;
        D7 :            out STD_LOGIC;
        D8 :            out STD_LOGIC;
        D9 :            out STD_LOGIC);
end component;

component dff is
port(   data_in:    in std_logic;
    clock:      in std_logic;
    data_out:   out std_logic
);
end component;

component JK_FF is
port (	clock:		in std_logic;
	J, K:		in std_logic;
	reset:		in std_logic;
	Q, Qbar:	out std_logic
);
end component;

signal alto : STD_LOGIC := '1';
signal gnd 	: STD_LOGIC := '0';

-- digitos da senha configurada
signal u6_q0, u6_q1, u6_q2, u6_q3, u6_q4, u6_q5, u29_q0, u29_q1, u29_q2, u29_q3, u29_q4, u29_q5 : STD_LOGIC;

-- digitos da senha digitada
signal t_d0, t_d1, t_d2, t_d3, t_d4, t_d5, t_d6, t_d7, t_d8, t_d9 : STD_LOGIC;

signal d0_comp, d1_comp, d2_comp, d3_comp, d4_comp, d5_comp, d6_comp, d7_comp, d8_comp, d9_comp : STD_LOGIC;
signal comparison : STD_LOGIC;
signal q_dff_counter : STD_LOGIC;
signal nand_u19, and_u19 : STD_LOGIC;
signal clk_jkff_u12, reset_jkff_u12, q_jkff_u12, q_n_jkff_u12 : STD_LOGIC;
signal q_jkff_u16, q_n_jkff_u16 : STD_LOGIC;
begin

PASS_CONFIG: password_config port map (D0=>D0_CONFIG, D1=>D1_CONFIG, D2=>D2_CONFIG, D3=>D3_CONFIG, D4=>D4_CONFIG, D5=>D5_CONFIG, D6=>D6_CONFIG, D7=>D7_CONFIG, D8=>D8_CONFIG, D9=>D9_CONFIG, MODE=>MODE, SAVE_PASSWORD_CLOCK=>SAVE_PASSWORD_CLOCK, U6_Q0=>u6_q0, U6_Q1=>u6_q1, U6_Q2=>u6_q2, U6_Q3=>u6_q3, U6_Q4=>u6_q4, U6_Q5=>u6_q5, U29_Q0=>u29_q0, U29_Q1=>u29_q1, U29_Q2=>u29_q2, U29_Q3=>u29_q3, U29_Q4=>u29_q4, U29_Q5=>u29_q5);

PASS_SHIFT: shift_register port map (MODE=>MODE, CLOCK=>DIGIT_CLOCK, SHIFT_SELECT=>SHIFT_SELECT, DIGIT=>DIGIT, D0=>t_d0, D1=>t_d1, D2=>t_d2, D3=>t_d3, D4=>t_d4, D5=>t_d5, D6=>t_d6, D7=>t_d7, D8=>t_d8, D9=>t_d9);

d0_comp <= u6_q0 XNOR t_d0;
d1_comp <= u6_q1 XNOR t_d1;
d2_comp <= u6_q2 XNOR t_d2;
d3_comp <= u6_q3 XNOR t_d3;
d4_comp <= u6_q4 XNOR t_d4;
d5_comp <= u6_q5 XNOR t_d5;
d6_comp <= u29_q0 XNOR t_d6;
d7_comp <= u29_q1 XNOR t_d7;
d8_comp <= u29_q2 XNOR t_d8;
d9_comp <= u29_q3 XNOR t_d9;

-- SE O PASSWORD ESTIVER CORRETO RETORNA 1, SE NÃO, RETORNA 0
comparison <= d0_comp AND d1_comp AND d2_comp AND d3_comp AND d4_comp AND d5_comp AND d6_comp AND d7_comp AND d8_comp AND d9_comp;

DFF_COUNTER: dff port map (data_in=>comparison, clock=>CONFIRM_PASSWORD_CLOCK, data_out=>q_dff_counter);

OPEN_SAFE_BOX <= (nand_u19 AND comparison) OR (NOT(MODE));

clk_jkff_u12 <= (NOT(comparison)) AND CONFIRM_PASSWORD_CLOCK AND nand_u19;
reset_jkff_u12 <= (nand_u19 AND comparison) OR (NOT(MODE)); -- igual ao open_safe_box (apenas out)
JKFF_U12: JK_FF port map (clock=>clk_jkff_u12, J=>alto, K=>alto, reset=>reset_jkff_u12, Q=>q_jkff_u12, Qbar=>q_n_jkff_u12);

ERROR_COUNT_D0 <= q_jkff_u12;

JKFF_U16: JK_FF port map (clock=>clk_jkff_u12, J=>q_jkff_u12, K=>q_jkff_u12, reset=>reset_jkff_u12, Q=>q_jkff_u16, Qbar=>q_n_jkff_u16);

ERROR_COUNT_D1 <= q_jkff_u16;

and_u19 <= q_jkff_u16 AND q_jkff_u12;
nand_u19 <= NOT(and_u19);

end Behavioral;
