library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        input1          : in     vl_logic_vector(31 downto 0);
        input2          : in     vl_logic_vector(31 downto 0);
        op              : in     vl_logic_vector(3 downto 0);
        output1         : out    vl_logic_vector(31 downto 0)
    );
end ALU;
