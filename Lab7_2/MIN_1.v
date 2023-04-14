/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// ------------------------ MIN_1 module --------------------------//
// ----------------- Feb. 2022 Willie authored --------------------//
/////////////////////////////////////////////////////////////////////

module MIN_1(clk,rst,d0,d1,d2,d3,d4,d5,d6,d7,w0,w1,w2,w3,w4,w5,w6,w7,d_min,d_min_index,w_min);

// ---------------------- input  ---------------------- //
	input clk;
	input rst;
	input [10:0] d0;
	input [10:0] d1;
	input [10:0] d2;
	input [10:0] d3;
	input [10:0] d4;
	input [10:0] d5;
	input [10:0] d6;
	input [10:0] d7;
	input [23:0] w0;
	input [23:0] w1;
	input [23:0] w2;
	input [23:0] w3;
	input [23:0] w4;
	input [23:0] w5;
	input [23:0] w6;
	input [23:0] w7;
	
// ---------------------- output  ---------------------- //
	output reg [10:0] d_min;
	output reg [2:0]  d_min_index;
	output reg [23:0] w_min;

// ---------------------- Write down Your design below  ---------------------- //
parameter [2:0] id_0=3'd0,id_1=3'd1,id_2=3'd2,id_3=3'd3,id_4=3'd4,id_5=3'd5,id_6=3'd6,id_7=3'd7;
reg [10:0] min1,min2,min3,min4,min11,min22,min33;
reg [2:0] id1,id2,id3,id4,id11,id22,id33;
    always@(*)begin
       if(d0<d1)begin
          min1=d0;
          id1=id_0;
       end
       else begin
          min1=d1;
          id1=id_1;     
       end
    end
    always@(*)begin
       if(d2<d3)begin
          min2=d2;
          id2=id_2;
       end
       else begin
          min2=d3;
          id2=id_3;

       end
    end
    always@(*)begin
       if(d4<d5)begin
          min3=d4;
          id3=id_4;
       end
       else begin
          min3=d5;
          id3=id_5;
       end
    end
    always@(*)begin
       if(d6<d7)begin
          min4=d6;
          id4=id_6;
       end
       else begin
          min4=d7;
          id4=id_7;
       end
    end
    always@(*)begin
       if(min1<min2)begin
          min11=min1;
          id11=id1;
       end
       else begin
          min11=min2;
          id11=id2;
       end
    end
    always@(*)begin
       if(min3<min4)begin
          min22=min3;
          id22=id3;
       end
       else begin
          min22=min4;
          id22=id4;
       end
    end
    always@(*)begin
       if(min11<min22)begin
          min33=min11;
          id33=id11;
       end
       else begin
          min33=min22;
          id33=id22;
       end
    end
   always@(*)begin
      
         d_min= min33;
    
    end
    always@(*)begin            
       d_min_index=id33;       
    end

    always@(*)begin
       case(d_min_index)
          3'd0:w_min=w0;
          3'd1:w_min=w1;
          3'd2:w_min=w2;
          3'd3:w_min=w3;
          3'd4:w_min=w4;
          3'd5:w_min=w5;
          3'd6:w_min=w6;
          3'd7:w_min=w7;       
       endcase
    end
endmodule


