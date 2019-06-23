library verilog;
use verilog.vl_types.all;
entity Mem is
    port(
        ReadPC          : in     vl_logic_vector(31 downto 0);
        RWAddr          : in     vl_logic_vector(31 downto 0);
        Value           : in     vl_logic_vector(31 downto 0);
        OP2En           : in     vl_logic;
        OP2RW           : in     vl_logic;
        Clk             : in     vl_logic;
        Clear           : in     vl_logic;
        Instr           : out    vl_logic_vector(31 downto 0);
        Data            : out    vl_logic_vector(31 downto 0)
    );
end Mem;
