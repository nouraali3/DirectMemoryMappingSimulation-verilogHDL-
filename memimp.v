
module Memory(A,CS,OE,DoutM);

input [21:0] A;  
input CS,OE; 
output wire [31:0] DoutM;
wire [19:0] WordAddress;
reg [31:0] Mem [0:1048575]; //(0:1M-1)
integer i;
integer number;

assign WordAddress=A[21:2];
assign DoutM=(CS==0 && OE==0)?Mem[WordAddress]:8'bxxxxxxxx;

initial
begin

number=0;
for(i=0;i<1048575;i=i+1)
begin
Mem[i]=number;
number=number+1;
end

end

endmodule
