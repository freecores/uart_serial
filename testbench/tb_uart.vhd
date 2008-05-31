-------------------------------------------------------------------------------
-- Use of this source code through a simulator and/or a compiler tool
-- is illegal if not authorised through Author License agreement.
-------------------------------------------------------------------------------
-- top level   : tb_uart.vhd
-- File        : tb_uart.vhd
-- Author      : Xavier Martin
-- Email       :
-- Organization:
-- Created     : 2008, june 30th
-- Last update :
-- Simulators  : ModelSim Altera 6.0c
-- Synthesizers: Quartus II 5.0
-- Targets     :
-- Dependency  :
-------------------------------------------------------------------------------
-- Description : This entity is a testbench for generic UART block
--               baud : 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200
--                      230400, 460800, 921600
-------------------------------------------------------------------------------
-- Version     : 1.0
-- Date        :
-- Modifier    :
-- Modif.      :
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_uart is
end entity;


architecture behavior of tb_uart is

  signal reset          : std_logic;                     -- reset control signal      
  signal clk            : std_logic:='1';                -- 14.7456 Mhz Clock frequency
  signal rx_data_serial : std_logic;                     -- Received Serial data from RS232
  signal rx_data_out    : std_logic_vector(7 downto 0);  -- Received Data
  signal rx_data_en     : std_logic;                     -- Received data enable control signal
  signal tx_data_serial : std_logic;                     -- Transmited serial data to RS232
  signal tx_data_in     : std_logic_vector(7 downto 0);  -- Transmited data
  signal tx_data_en     : std_logic;                     -- Transmited data latch enable
  signal tx_ch_rdy      : std_logic;                     -- Transmition channel ready status signal
  signal tx_ch_rdy_i    : std_logic;
  signal baud_sel       : std_logic_vector(3 downto 0);  -- Baud value see Note  
  signal parity_en      : std_logic;                     -- Enable parity control signal active HIGH
  signal parity_type    : std_logic;                     -- 1:ODD parity / 0:EVEN parity
  signal fifo_usedw     : std_logic_vector(1 downto 0);
  signal rx_ovf_err     : std_logic;                     -- Received over frame error status signal
  signal rx_parity_err  : std_logic;                     -- Received parity error                 


begin
 
  -------------------------------------------------------------------------------
  uart_serial_inst:
  entity work.uart_serial
  -------------------------------------------------------------------------------
  port map(
    -- Global signal
    reset          => reset,          -- [in] reset control signal
    clk            => clk,            -- [in] 14.7456 Mhz Clock frequency
    -- Reception channel
    rx_data_serial => rx_data_serial, -- [in]  Received Serial data from RS232
    rx_data_out    => rx_data_out,    -- [out] Received Data
    rx_data_en     => rx_data_en,     -- [out] Received data enable control signal
    rx_ovf_err     => rx_ovf_err,     -- [out] Received over frame error status signal
    rx_parity_err  => rx_parity_err,  -- [out] Received parity error
    -- Transmition channel
    tx_data_serial => tx_data_serial, -- [out] Transmited Serial data to RS232
    tx_data_in     => tx_data_in,     -- [in]  Transmited data
    tx_data_en     => tx_data_en,     -- [in]  Transmited data latch enable
    tx_ch_rdy      => tx_ch_rdy,      -- [out] Transmition channel ready status signal
    -- Control command
    baud_sel       => baud_sel,       -- [in]  Baud value see Note  
    parity_en      => parity_en,      -- [in]  Enable parity control signal active HIGH
    parity_type    => parity_type);   -- [in]  1:ODD parity / 0:EVEN parity
 
  process(reset,clk)
  begin
    if reset = '1' then
      rx_data_serial <= '1';
    elsif rising_edge(clk) then
      rx_data_serial <= tx_data_serial;
    end if;
  end process;
 
  -------------------------------------------------------------------------------
  -- CONTROL COMMAND VALUE
  -------------------------------------------------------------------------------
  baud_sel    <= x"8";
  parity_en   <= '0';
  parity_type <= '0';
   
  -------------------------------------------------------------------------------
  -- GLOBAL SIGNALS PROCESS
  -------------------------------------------------------------------------------
  reset_proc:
  process
  begin
    reset <= '1';
    wait for 10 ns;
    reset <= '0';
    wait;
  end process;
 
  clk_proc:
  process
  begin
    clk <= not(clk);
    wait for 33.9 ns;
  end process;
 
  -------------------------------------------------------------------------------
  -- Data To transmit
  -------------------------------------------------------------------------------
  process(reset,clk)
  begin
    if reset = '1' then
      tx_data_in  <= (others => '0');
      tx_data_en  <= '0';
      tx_ch_rdy_i <= '0';
    elsif rising_edge(clk) then
      tx_ch_rdy_i <= tx_ch_rdy;
     
      if tx_ch_rdy = '1' and tx_ch_rdy_i = '0' then
        tx_data_en <= '1';
        tx_data_in <= tx_data_in + 1;
      else
        tx_data_en <= '0';
      end if;
    end if;
  end process;
   
end behavior;