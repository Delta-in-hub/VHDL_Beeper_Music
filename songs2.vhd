LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY songs2 IS
	PORT (
		clk, speed, change : IN STD_LOGIC;
		beep : OUT STD_LOGIC
	);
END ENTITY songs2;

ARCHITECTURE main OF songs2 IS

	CONSTANT L0 : INTEGER := 0;
	CONSTANT M0 : INTEGER := 0;
	CONSTANT H0 : INTEGER := 0;
	CONSTANT L1 : INTEGER := 95566;
	CONSTANT L2 : INTEGER := 85121;
	CONSTANT L3 : INTEGER := 75850;
	CONSTANT L4 : INTEGER := 71592;
	CONSTANT L5 : INTEGER := 63776;
	CONSTANT L6 : INTEGER := 56818;
	CONSTANT L7 : INTEGER := 50618;
	CONSTANT M1 : INTEGER := 47774;
	CONSTANT M2 : INTEGER := 42568;
	CONSTANT M3 : INTEGER := 37919;
	CONSTANT M4 : INTEGER := 35791;
	CONSTANT M5 : INTEGER := 31888;
	CONSTANT M6 : INTEGER := 28409;
	CONSTANT M7 : INTEGER := 25309;
	CONSTANT H1 : INTEGER := 23889;
	CONSTANT H2 : INTEGER := 21282;
	CONSTANT H3 : INTEGER := 18961;
	CONSTANT H4 : INTEGER := 17897;
	CONSTANT H5 : INTEGER := 15944;
	CONSTANT H6 : INTEGER := 14205;
	CONSTANT H7 : INTEGER := 12655;

	SIGNAL beep1 : STD_LOGIC := '0';
	SIGNAL TIME : INTEGER := 12500000; --250ms  6250000 125ms 9375000 
	SIGNAL LASTSTATE : INTEGER := 63;
	SIGNAL which : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
	SIGNAL state : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL count_end : STD_LOGIC_VECTOR(16 DOWNTO 0);
	SIGNAL count : STD_LOGIC_VECTOR(16 DOWNTO 0);
	SIGNAL count1 : STD_LOGIC_VECTOR(24 DOWNTO 0);
	SIGNAL clear : STD_LOGIC := '0';

BEGIN
	beep <= beep1;

	-- 控制速度
	PROCESS (speed)
	BEGIN
		IF rising_edge(speed) THEN
			CASE TIME IS
				WHEN 12500000 => TIME <= 9375000;
				WHEN 9375000 => TIME <= 6250000;
				WHEN 6250000 => TIME <= 12500000;
				WHEN OTHERS => TIME <= 12500000;
			END CASE;
		END IF;
	END PROCESS;
	--控制音调
	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF change = '0' THEN
				count <= (OTHERS => '0');
				beep1 <= '0';
			END IF;
			count <= count + '1';
			IF count = count_end THEN
				count <= (OTHERS => '0');
				beep1 <= NOT beep1;

			END IF;
		END IF;
	END PROCESS;

	--
	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF change = '0' THEN
				CASE which IS
					WHEN "00" =>
						which <= "01";
						LASTSTATE <= 73;
					WHEN "01" =>
						which <= "10";
						LASTSTATE <= 128;
					WHEN "10" =>
						which <= "00";
						LASTSTATE <= 63;
					WHEN OTHERS =>
						which <= "00";
						LASTSTATE <= 63;
				END CASE;

				count1 <= (OTHERS => '0');
				state <= (OTHERS => '0');
				count_end <= (OTHERS => '0');
			END IF;

			IF conv_integer(count1) < TIME THEN
				count1 <= count1 + '1';
			ELSE
				count1 <= (OTHERS => '0');
				CASE which IS
					WHEN "00" =>
						IF conv_integer(state) = LASTSTATE THEN
							state <= (OTHERS => '0');
						ELSE
							state <= state + '1';
						END IF;
						CASE conv_integer(state) IS
							WHEN 0 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 1 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 2 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 3 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 4 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 5 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 6 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 7 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 8 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 9 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 10 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 11 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 12 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 13 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 14 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 15 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 16 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 17 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 18 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 19 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 20 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 21 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 22 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 23 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 24 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 25 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 26 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 27 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 28 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 29 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 30 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 31 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 32 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 33 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 34 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 35 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 36 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 37 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 38 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 39 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 40 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 41 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 42 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 43 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 44 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 45 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 46 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 47 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 48 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 49 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 50 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 51 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 52 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 53 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 54 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 55 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 56 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 57 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 58 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 59 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 60 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 61 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 62 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 63 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN OTHERS => count_end <= count_end;
								-- 两只老虎
						END CASE;
					WHEN "01" =>
						IF conv_integer(state) = LASTSTATE THEN
							state <= (OTHERS => '0');
						ELSE
							state <= state + '1';
						END IF;
						CASE conv_integer(state) IS
							WHEN 0 => count_end <= conv_std_logic_vector(H3, 17);
							WHEN 1 => count_end <= conv_std_logic_vector(H2, 17);
							WHEN 2 => count_end <= conv_std_logic_vector(H3, 17);
							WHEN 3 => count_end <= conv_std_logic_vector(H2, 17);
							WHEN 4 => count_end <= conv_std_logic_vector(H3, 17);
							WHEN 5 => count_end <= conv_std_logic_vector(M7, 17);
							WHEN 6 => count_end <= conv_std_logic_vector(H2, 17);
							WHEN 7 => count_end <= conv_std_logic_vector(H1, 17);
							WHEN 8 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 9 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 10 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 11 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 12 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 13 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 14 => count_end <= conv_std_logic_vector(M7, 17);
							WHEN 15 => count_end <= conv_std_logic_vector(M7, 17);
							WHEN 16 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 17 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 18 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 19 => count_end <= conv_std_logic_vector(M7, 17);
							WHEN 20 => count_end <= conv_std_logic_vector(H1, 17);
							WHEN 21 => count_end <= conv_std_logic_vector(H1, 17);
							WHEN 22 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 23 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 24 => count_end <= conv_std_logic_vector(H3, 17);
							WHEN 25 => count_end <= conv_std_logic_vector(H2, 17);
							WHEN 26 => count_end <= conv_std_logic_vector(H3, 17);
							WHEN 27 => count_end <= conv_std_logic_vector(H2, 17);
							WHEN 28 => count_end <= conv_std_logic_vector(H3, 17);
							WHEN 29 => count_end <= conv_std_logic_vector(M7, 17);
							WHEN 30 => count_end <= conv_std_logic_vector(H2, 17);
							WHEN 31 => count_end <= conv_std_logic_vector(H1, 17);
							WHEN 32 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 33 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 34 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 35 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 36 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 37 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 38 => count_end <= conv_std_logic_vector(M7, 17);
							WHEN 39 => count_end <= conv_std_logic_vector(M7, 17);
							WHEN 40 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 41 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 42 => count_end <= conv_std_logic_vector(H1, 17);
							WHEN 43 => count_end <= conv_std_logic_vector(H7, 17);
							WHEN 44 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 45 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 46 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 47 => count_end <= conv_std_logic_vector(M7, 17);
							WHEN 48 => count_end <= conv_std_logic_vector(H1, 17);
							WHEN 49 => count_end <= conv_std_logic_vector(H2, 17);
							WHEN 50 => count_end <= conv_std_logic_vector(H3, 17);
							WHEN 51 => count_end <= conv_std_logic_vector(H3, 17);
							WHEN 52 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 53 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 54 => count_end <= conv_std_logic_vector(H4, 17);
							WHEN 55 => count_end <= conv_std_logic_vector(H3, 17);
							WHEN 56 => count_end <= conv_std_logic_vector(H2, 17);
							WHEN 57 => count_end <= conv_std_logic_vector(H2, 17);
							WHEN 58 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 59 => count_end <= conv_std_logic_vector(M4, 17);
							WHEN 60 => count_end <= conv_std_logic_vector(H3, 17);
							WHEN 61 => count_end <= conv_std_logic_vector(H2, 17);
							WHEN 62 => count_end <= conv_std_logic_vector(H1, 17);
							WHEN 63 => count_end <= conv_std_logic_vector(H1, 17);
							WHEN 64 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 65 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 66 => count_end <= conv_std_logic_vector(H2, 17);
							WHEN 67 => count_end <= conv_std_logic_vector(H1, 17);
							WHEN 68 => count_end <= conv_std_logic_vector(M7, 17);
							WHEN 69 => count_end <= conv_std_logic_vector(M7, 17);
							WHEN 70 => count_end <= conv_std_logic_vector(M7, 17);
							WHEN 71 => count_end <= conv_std_logic_vector(M7, 17);
							WHEN 72 => count_end <= conv_std_logic_vector(M7, 17);
							WHEN 73 => count_end <= conv_std_logic_vector(M7, 17);
							WHEN OTHERS => count_end <= count_end;
						END CASE;

						-- 致爱丽丝
					WHEN "10" =>
						IF conv_integer(state) = LASTSTATE THEN
							state <= (OTHERS => '0');
						ELSE
							state <= state + '1';
						END IF;
						CASE conv_integer(state) IS
							WHEN 0 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 1 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 2 => count_end <= conv_std_logic_vector(L6, 17);
							WHEN 3 => count_end <= conv_std_logic_vector(L6, 17);
							WHEN 4 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 5 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 6 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 7 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 8 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 9 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 10 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 11 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 12 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 13 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 14 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 15 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 16 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 17 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 18 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 19 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 20 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 21 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 22 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 23 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 24 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 25 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 26 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 27 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 28 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 29 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 30 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 31 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 32 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 33 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 34 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 35 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 36 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 37 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 38 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 39 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 40 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 41 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 42 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 43 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 44 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 45 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 46 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 47 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 48 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 49 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 50 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 51 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 52 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 53 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 54 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 55 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 56 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 57 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 58 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 59 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 60 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 61 => count_end <= conv_std_logic_vector(L6, 17);
							WHEN 62 => count_end <= conv_std_logic_vector(L6, 17);
							WHEN 63 => count_end <= conv_std_logic_vector(L6, 17);
							WHEN 64 => count_end <= conv_std_logic_vector(L6, 17);
							WHEN 65 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 66 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 67 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 68 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 69 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 70 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 71 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 72 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 73 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 74 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 75 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 76 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 77 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 78 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 79 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 80 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 81 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 82 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 83 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 84 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 85 => count_end <= conv_std_logic_vector(H1, 17);
							WHEN 86 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 87 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 88 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 89 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 90 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 91 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 92 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 93 => count_end <= conv_std_logic_vector(M6, 17);
							WHEN 94 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 95 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 96 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 97 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 98 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 99 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 100 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 101 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 102 => count_end <= conv_std_logic_vector(M0, 17);
							WHEN 103 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 104 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 105 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 106 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 107 => count_end <= conv_std_logic_vector(L6, 17);
							WHEN 108 => count_end <= conv_std_logic_vector(L6, 17);
							WHEN 109 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 110 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 111 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 112 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 113 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 114 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 115 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 116 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 117 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 118 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 119 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 120 => count_end <= conv_std_logic_vector(M5, 17);
							WHEN 121 => count_end <= conv_std_logic_vector(M2, 17);
							WHEN 122 => count_end <= conv_std_logic_vector(M3, 17);
							WHEN 123 => count_end <= conv_std_logic_vector(M1, 17);
							WHEN 124 => count_end <= conv_std_logic_vector(L5, 17);
							WHEN 125 => count_end <= conv_std_logic_vector(L6, 17);
							WHEN 126 => count_end <= conv_std_logic_vector(L6, 17);
							WHEN 127 => count_end <= conv_std_logic_vector(L6, 17);
							WHEN 128 => count_end <= conv_std_logic_vector(L6, 17);
							WHEN OTHERS => count_end <= count_end;
								-- 酒醉的蝴蝶
						END CASE;
					WHEN OTHERS => NULL;
				END CASE;

			END IF;
		END IF;
	END PROCESS;

END main;