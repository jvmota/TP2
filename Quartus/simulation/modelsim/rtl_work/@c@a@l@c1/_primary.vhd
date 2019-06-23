library verilog;
use verilog.vl_types.all;
entity CALC1 is
    port(
        Clk             : in     vl_logic;
        RegA            : out    vl_logic_vector(31 downto 0);
        RegB            : out    vl_logic_vector(31 downto 0);
        RAcc            : out    vl_logic_vector(31 downto 0);
        InstrAtual      : out    vl_logic_vector(31 downto 0)
    );
end CALC1;
