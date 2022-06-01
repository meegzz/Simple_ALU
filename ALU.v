module ALU(
    input [7:0] A, B,
    input [2:0] opcode,
    input ci,
    output reg [7:0] fin,
    output reg CF, ZF, Co
);
wire [7:0] resw;
wire carryout;
reg cir;
reg [7:0] Ar, Br;
FAS8bits gate (.x(A), .yo(B), .cin(ci), .res(resw), .co(carryout));
always @(A or B or opcode or ci) begin
  Ar= A;
  Br= B;
  cir =ci;
       case (opcode)
         3'b000 : begin // the addition from the full add'/sub 
           cir=1'b0;
           fin = resw;
           Co=carryout;
         end
         3'b001 : begin // the subtraction from the full add'/sub 
           cir=1'b1;
           fin = resw ;
           Co= carryout;
         end
         3'b010 : begin
           fin = A & B; // a and b
         end
         3'b011 : begin
           fin = A | B; // a or b
         end
         3'b100 : begin
           fin= A ^ B; // a xor b 
         end
         3'b101 : begin
           if (A > B) begin // checks if a greater than b or not
            CF =1;
           end
           else begin
		      	CF =0;
           end
         end
         3'b110 : begin // shifting a to the left by 1 
           Ar = A << 1;
           fin = Ar;
         end
         3'b111 : begin // shifting a to the left by 1 
           Br = B << 1;
           fin = Br ;
         end
          default: begin // the default is to have the output zeros
            fin = 8'b0;
            Co = 1'b0;
          end 
      endcase
       if (fin == 8'b0 & Co==0) begin // checks if the output zeros or not
               ZF = 1;
           end
           else begin
				        ZF = 0;
           end
        if (A > B) begin
            CF =1;
        end
        else begin
			      CF =0;
        end
end
endmodule