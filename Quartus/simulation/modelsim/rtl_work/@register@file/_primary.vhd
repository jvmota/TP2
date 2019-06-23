library verilog;
use verilog.vl_types.all;
entity RegisterFile is
    port(
        RegEsc          : in     vl_logic_vector(1 downto 0);
        Fonte1          : in     vl_logic_vector(1 downto 0);
        Fonte2          : in     vl_logic_vector(1 downto 0);
        Esc             : in     vl_logic;
        Clk             : in     vl_logic;
        Dado            : in     vl_logic_vector(31 downto 0);
        Dado1           : out    vl_logic_vector(31 downto 0);
        Dado2           : out    vl_logic_vector(31 downto 0);
        RA              : out    vl_logic_vector(31 downto 0);
        RB              : out    vl_logic_vector(31 downto 0);
        RACC            : out    vl_logic_vector(31 downto 0)
    );
end RegisterFile;
