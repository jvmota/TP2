library verilog;
use verilog.vl_types.all;
entity Controle is
    port(
        OpCode          : in     vl_logic_vector(2 downto 0);
        MemtoReg        : out    vl_logic;
        MemEn           : out    vl_logic;
        MemOp           : out    vl_logic;
        FonteEscrita    : out    vl_logic;
        RegEsc          : out    vl_logic;
        Stop            : out    vl_logic;
        Clear           : out    vl_logic;
        ALUCode         : out    vl_logic_vector(3 downto 0)
    );
end Controle;
