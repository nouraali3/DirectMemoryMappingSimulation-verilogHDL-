
module TestingWholeProgram;

reg [21:0] A;//block address range 0:1M-1
reg cs,oe;
wire [7:0] DataMC;
wire hit;
wire [7:0] outData;
wire [19:0] wordaddress;

Cache x(A,cs,DataMC,outData,hit); //module Cache(add,cs,din1,dout,h);
Memory y(A,cs,oe,DataMC); //module Memory(A,CS,OE,DoutM);

initial
begin
$monitor("Byte Address=%d %b hit=%b Output=%d",A,A,hit,outData);
A=4; cs=0; oe=0; ////monitor h=0 dout xxxx 
#5
A=5; cs=0; oe=0; ////monitor h=1 dout 23 
#5
A=16388; cs=0; oe=0; //// monitor h=0 dout xxx
#5
A=16391; cs=0; oe=0;
#5
A=42; cs=0; oe=0;  ///monitor h=0 dout=xxx
#5
A=43; cs=0; oe=0;
end

endmodule
