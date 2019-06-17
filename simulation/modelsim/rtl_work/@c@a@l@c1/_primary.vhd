library verilog;
use verilog.vl_types.all;
entity CALC1 is
    port(
        Clk             : in     vl_logic;
        RegA            : out    vl_logic_vector(31 downto 0);
        RegB            : out    vl_logic_vector(31 downto 0);
        RAcc            : out    vl_logic_vector(31 downto 0);
        InstrAtual      : out    vl_logic_vector(31 downto 0);
        testedado       : out    vl_logic_vector(31 downto 0);
        teste           : out    vl_logic;
        teste1          : out    vl_logic;
        teste2          : out    vl_logic
    );
end CALC1;
