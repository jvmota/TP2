library verilog;
use verilog.vl_types.all;
entity signExtend is
    port(
        entrada         : in     vl_logic_vector(24 downto 0);
        saida           : out    vl_logic_vector(31 downto 0)
    );
end signExtend;
