module ALUtest();

reg [7:0] TA, TB;
reg [2:0] opc;
reg Tci;
wire TCo, TCF, TZF; 
wire [7:0] Tfin;
initial begin
    opc = 3'b000; //adding
    Tci=1'b0;
    TA= 8'b0;
    TB= 8'b0;
#10 opc = 3'b000; //adding
    Tci=1'b0;
    TA= 8'b1111_0110;
    TB= 8'b1001_0101;
/* Tfin = 8'b1000_1011;
    Tcarout= 1'b1;
    TCF=1'b1;
    TZF=1'b0; */
#10 opc = 3'b001; //subtracting
    Tci=1'b1;
    TA= 8'b1111_0110;
    TB= 8'b1001_0101;
/* Tfin = 8'b0110_0001;
    Tcarout= 1'b0;
    TCF=1'b1;
    TZF=1'b0; */
#10 opc = 3'b010; //anding
    Tci=1'b0;
    TA= 8'b1111_0110;
    TB= 8'b1001_0101;
/* Tfin = 8'b1001_0100;
    Tcarout= 1'b0;
    TCF=1'b1;
    TZF=1'b0; */
#10 opc = 3'b011; //oring
    Tci=1'b0;
    TA= 8'b1111_0110;
    TB= 8'b1001_0101;
/* Tfin = 8'b1111_0111;
    Tcarout= 1'b0;
    TCF=1'b1;
    TZF=1'b0; */
#10 opc = 3'b100; //xoring
    Tci=1'b0;
    TA= 8'b1111_0110;
    TB= 8'b1001_0101;
/* Tfin = 8'b0110_0011;
    Tcarout= 1'b0;
    TCF=1'b1;
    TZF=1'b0; */
#10 opc = 3'b101; //check a>b
    Tci=1'b0;
    TA= 8'b1111_0110;
    TB= 8'b1001_0101;
/* Tfin = 8'b1;
    Tcarout= 1'b0;
    TCF=1'b0;
    TZF=1'b0; */
#10 opc = 3'b110; //shif a << 1
    Tci=1'b0;
    TA= 8'b1111_0110;
    TB= 8'b1001_0101;
/* Tfin = 8'b1110_1010;
    Tcarout= 1'b0;
    TCF=1'b0;
    TZF=1'b0; */
#10 opc = 3'b111; //shif b << 1
    Tci=1'b0;
    TA= 8'b1111_0110;
    TB= 8'b1001_0101;
/* Tfin = 8'b0010_1010;
    Tcarout= 1'b0;
    TCF=1'b0;
    TZF=1'b0; */
end
ALU try (
    .fin(Tfin),
    .A(TA),
    .B(TB),
    .opcode(opc),
    .ci(Tci),
    .CF(TCF),
    .ZF(TZF),
    .Co(TCo)
);
initial begin
    $display("		","Time: OPC: Cin: A: 		B: 	  Fin: 	Co:  CF:  ZF:");
    $monitor($time,,opc,,,,Tci,,,,TA,,,,TB,,,,Tfin,,,,TCo,,,,TCF,,,,TZF);
end
endmodule