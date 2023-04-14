/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// ------------------------ VEP module --------------------------//
// ----------------- Feb. 2022 Willie authored --------------------//
/////////////////////////////////////////////////////////////////////

module VEP(clk, rst, W_update, D_update, neighbor_sel, pixel,
				d0, d1, d2, d3, d4, d5, d6, d7, w0, w1, w2, w3, w4, w5, w6, w7);

// ---------------------- input  ---------------------- //
	input clk; 
	input rst; 
	input W_update;
	input D_update;
	input [15:0] neighbor_sel; 
	input [23:0] pixel; 
	
// ---------------------- output  ---------------------- //
	output reg [10:0] d0;
	output reg [10:0] d1;
	output reg [10:0] d2;
	output reg [10:0] d3;
	output reg [10:0] d4;
	output reg [10:0] d5;
	output reg [10:0] d6;
	output reg [10:0] d7;
	output reg [23:0] w0;
	output reg [23:0] w1;
	output reg [23:0] w2;
	output reg [23:0] w3;
	output reg [23:0] w4;
	output reg [23:0] w5;
	output reg [23:0] w6;
	output reg [23:0] w7;
	
// ---------------------- Write down Your design below  ---------------------- //
reg [23:0]RAM_IF_Q_LATCH;
reg [10:0] C_store[7:0];
reg [7:0] R1[7:0];
reg [7:0] G1[7:0];
reg [7:0] B1[7:0];

always@(posedge clk or posedge rst)begin
   if(rst)begin
      RAM_IF_Q_LATCH<=24'd0;
   end
   else begin
     if(D_update)begin
          RAM_IF_Q_LATCH<=pixel;
     end 
     else begin
      
     end
  end 
end

always@(*)begin
      R1[0] = (w0[23:16]>RAM_IF_Q_LATCH[23:16])?(w0[23:16]-RAM_IF_Q_LATCH[23:16]):(RAM_IF_Q_LATCH[23:16]-w0[23:16]);
      R1[1] = (w1[23:16]>RAM_IF_Q_LATCH[23:16])?(w1[23:16]-RAM_IF_Q_LATCH[23:16]):(RAM_IF_Q_LATCH[23:16]-w1[23:16]);
      R1[2] = (w2[23:16]>RAM_IF_Q_LATCH[23:16])?(w2[23:16]-RAM_IF_Q_LATCH[23:16]):(RAM_IF_Q_LATCH[23:16]-w2[23:16]);
      R1[3] = (w3[23:16]>RAM_IF_Q_LATCH[23:16])?(w3[23:16]-RAM_IF_Q_LATCH[23:16]):(RAM_IF_Q_LATCH[23:16]-w3[23:16]);
      R1[4] = (w4[23:16]>RAM_IF_Q_LATCH[23:16])?(w4[23:16]-RAM_IF_Q_LATCH[23:16]):(RAM_IF_Q_LATCH[23:16]-w4[23:16]);
      R1[5] = (w5[23:16]>RAM_IF_Q_LATCH[23:16])?(w5[23:16]-RAM_IF_Q_LATCH[23:16]):(RAM_IF_Q_LATCH[23:16]-w5[23:16]);
      R1[6] = (w6[23:16]>RAM_IF_Q_LATCH[23:16])?(w6[23:16]-RAM_IF_Q_LATCH[23:16]):(RAM_IF_Q_LATCH[23:16]-w6[23:16]);
      R1[7] = (w7[23:16]>RAM_IF_Q_LATCH[23:16])?(w7[23:16]-RAM_IF_Q_LATCH[23:16]):(RAM_IF_Q_LATCH[23:16]-w7[23:16]);
end
always@(*)begin
      G1[0] = (w0[15:8]>RAM_IF_Q_LATCH[15:8])?(w0[15:8]-RAM_IF_Q_LATCH[15:8]):(RAM_IF_Q_LATCH[15:8]-w0[15:8]);      
      G1[1] = (w1[15:8]>RAM_IF_Q_LATCH[15:8])?(w1[15:8]-RAM_IF_Q_LATCH[15:8]):(RAM_IF_Q_LATCH[15:8]-w1[15:8]);
      G1[2] = (w2[15:8]>RAM_IF_Q_LATCH[15:8])?(w2[15:8]-RAM_IF_Q_LATCH[15:8]):(RAM_IF_Q_LATCH[15:8]-w2[15:8]);
      G1[3] = (w3[15:8]>RAM_IF_Q_LATCH[15:8])?(w3[15:8]-RAM_IF_Q_LATCH[15:8]):(RAM_IF_Q_LATCH[15:8]-w3[15:8]);
      G1[4] = (w4[15:8]>RAM_IF_Q_LATCH[15:8])?(w4[15:8]-RAM_IF_Q_LATCH[15:8]):(RAM_IF_Q_LATCH[15:8]-w4[15:8]);
      G1[5] = (w5[15:8]>RAM_IF_Q_LATCH[15:8])?(w5[15:8]-RAM_IF_Q_LATCH[15:8]):(RAM_IF_Q_LATCH[15:8]-w5[15:8]);
      G1[6] = (w6[15:8]>RAM_IF_Q_LATCH[15:8])?(w6[15:8]-RAM_IF_Q_LATCH[15:8]):(RAM_IF_Q_LATCH[15:8]-w6[15:8]);
      G1[7] = (w7[15:8]>RAM_IF_Q_LATCH[15:8])?(w7[15:8]-RAM_IF_Q_LATCH[15:8]):(RAM_IF_Q_LATCH[15:8]-w7[15:8]);
end
always@(*)begin
      B1[0] = (w0[7:0]>RAM_IF_Q_LATCH[7:0])?(w0[7:0]-RAM_IF_Q_LATCH[7:0]):(RAM_IF_Q_LATCH[7:0]-w0[7:0]);      
      B1[1] = (w1[7:0]>RAM_IF_Q_LATCH[7:0])?(w1[7:0]-RAM_IF_Q_LATCH[7:0]):(RAM_IF_Q_LATCH[7:0]-w1[7:0]);
      B1[2] = (w2[7:0]>RAM_IF_Q_LATCH[7:0])?(w2[7:0]-RAM_IF_Q_LATCH[7:0]):(RAM_IF_Q_LATCH[7:0]-w2[7:0]);
      B1[3] = (w3[7:0]>RAM_IF_Q_LATCH[7:0])?(w3[7:0]-RAM_IF_Q_LATCH[7:0]):(RAM_IF_Q_LATCH[7:0]-w3[7:0]);
      B1[4] = (w4[7:0]>RAM_IF_Q_LATCH[7:0])?(w4[7:0]-RAM_IF_Q_LATCH[7:0]):(RAM_IF_Q_LATCH[7:0]-w4[7:0]);
      B1[5] = (w5[7:0]>RAM_IF_Q_LATCH[7:0])?(w5[7:0]-RAM_IF_Q_LATCH[7:0]):(RAM_IF_Q_LATCH[7:0]-w5[7:0]);
      B1[6] = (w6[7:0]>RAM_IF_Q_LATCH[7:0])?(w6[7:0]-RAM_IF_Q_LATCH[7:0]):(RAM_IF_Q_LATCH[7:0]-w6[7:0]);
      B1[7] = (w7[7:0]>RAM_IF_Q_LATCH[7:0])?(w7[7:0]-RAM_IF_Q_LATCH[7:0]):(RAM_IF_Q_LATCH[7:0]-w7[7:0]);  
end
always@(*)begin
      C_store[0] ={3'd0,R1[0]}+{3'd0,G1[0]}+{3'd0,B1[0]};
      C_store[1] ={3'd0,R1[1]}+{3'd0,G1[1]}+{3'd0,B1[1]};
      C_store[2] ={3'd0,R1[2]}+{3'd0,G1[2]}+{3'd0,B1[2]};
      C_store[3] ={3'd0,R1[3]}+{3'd0,G1[3]}+{3'd0,B1[3]};
      C_store[4] ={3'd0,R1[4]}+{3'd0,G1[4]}+{3'd0,B1[4]};
      C_store[5] ={3'd0,R1[5]}+{3'd0,G1[5]}+{3'd0,B1[5]};
      C_store[6] ={3'd0,R1[6]}+{3'd0,G1[6]}+{3'd0,B1[6]};
      C_store[7] ={3'd0,R1[7]}+{3'd0,G1[7]}+{3'd0,B1[7]};
end


always@(posedge clk or posedge rst)begin
   if(rst)begin
     d0<=11'd0;
	 d1<=11'd0;
	 d2<=11'd0;
	 d3<=11'd0;
	 d4<=11'd0;
	 d5<=11'd0;
	 d6<=11'd0;
	 d7<=11'd0;
   end
   else begin
	   d0<= C_store[0];
	   d1<= C_store[1];
	   d2<= C_store[2];
	   d3<= C_store[3];
	   d4<= C_store[4];
	   d5<= C_store[5];
	   d6<= C_store[6];
	   d7<= C_store[7];	 
   end
end



always@(posedge clk or posedge rst)begin
   if(rst)begin
      w0<=24'b01111101_01111101_01111101;
   end
   else begin
       if(W_update)begin
           if(neighbor_sel[1:0]==2'b00)begin
              w0[23:16] <= (w0[23:16]>RAM_IF_Q_LATCH[23:16])?(w0[23:16]-((w0[23:16]-RAM_IF_Q_LATCH[23:16])>>2)):(w0[23:16]+((RAM_IF_Q_LATCH[23:16]-w0[23:16])>>2));
              w0[15: 8] <= (w0[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w0[15: 8]-((w0[15: 8]-RAM_IF_Q_LATCH[15: 8])>>2)):(w0[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w0[15: 8])>>2));
              w0[ 7: 0] <= (w0[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w0[ 7: 0]-((w0[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>2)):(w0[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w0[ 7: 0])>>2));
           end
           else if(neighbor_sel[1:0]==2'b01)begin
              w0[23:16] <= (w0[23:16]>RAM_IF_Q_LATCH[23:16])?(w0[23:16]-((w0[23:16]-RAM_IF_Q_LATCH[23:16])>>4)):(w0[23:16]+((RAM_IF_Q_LATCH[23:16]-w0[23:16])>>4));
              w0[15: 8] <= (w0[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w0[15: 8]-((w0[15: 8]-RAM_IF_Q_LATCH[15: 8])>>4)):(w0[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w0[15: 8])>>4));
              w0[ 7: 0] <= (w0[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w0[ 7: 0]-((w0[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>4)):(w0[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w0[ 7: 0])>>4));
           end
           else if(neighbor_sel[1:0]==2'b10)begin
              w0[23:16] <= (w0[23:16]>RAM_IF_Q_LATCH[23:16])?(w0[23:16]-((w0[23:16]-RAM_IF_Q_LATCH[23:16])>>5)):(w0[23:16]+((RAM_IF_Q_LATCH[23:16]-w0[23:16])>>5));
              w0[15: 8] <= (w0[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w0[15: 8]-((w0[15: 8]-RAM_IF_Q_LATCH[15: 8])>>5)):(w0[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w0[15: 8])>>5));
              w0[ 7: 0] <= (w0[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w0[ 7: 0]-((w0[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>5)):(w0[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w0[ 7: 0])>>5));
           end
           else begin
              w0<=w0;
           end
       end
       else begin
       
       end
   end 
end
always@(posedge clk or posedge rst)begin
   if(rst)begin
      w1<=24'b01111101_01111101_01111101;
   end
   else begin
       if(W_update)begin
           if(neighbor_sel[3:2]==2'b00)begin
              w1[23:16] <= (w1[23:16]>RAM_IF_Q_LATCH[23:16])?(w1[23:16]-((w1[23:16]-RAM_IF_Q_LATCH[23:16])>>2)):(w1[23:16]+((RAM_IF_Q_LATCH[23:16]-w1[23:16])>>2));
              w1[15: 8] <= (w1[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w1[15: 8]-((w1[15: 8]-RAM_IF_Q_LATCH[15: 8])>>2)):(w1[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w1[15: 8])>>2));
              w1[ 7: 0] <= (w1[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w1[ 7: 0]-((w1[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>2)):(w1[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w1[ 7: 0])>>2));
           end
           else if(neighbor_sel[3:2]==2'b01)begin
              w1[23:16] <= (w1[23:16]>RAM_IF_Q_LATCH[23:16])?(w1[23:16]-((w1[23:16]-RAM_IF_Q_LATCH[23:16])>>4)):(w1[23:16]+((RAM_IF_Q_LATCH[23:16]-w1[23:16])>>4));
              w1[15: 8] <= (w1[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w1[15: 8]-((w1[15: 8]-RAM_IF_Q_LATCH[15: 8])>>4)):(w1[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w1[15: 8])>>4));
              w1[ 7: 0] <= (w1[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w1[ 7: 0]-((w1[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>4)):(w1[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w1[ 7: 0])>>4));
           end
           else if(neighbor_sel[3:2]==2'b10)begin
              w1[23:16] <= (w1[23:16]>RAM_IF_Q_LATCH[23:16])?(w1[23:16]-((w1[23:16]-RAM_IF_Q_LATCH[23:16])>>5)):(w1[23:16]+((RAM_IF_Q_LATCH[23:16]-w1[23:16])>>5));
              w1[15: 8] <= (w1[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w1[15: 8]-((w1[15: 8]-RAM_IF_Q_LATCH[15: 8])>>5)):(w1[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w1[15: 8])>>5));
              w1[ 7: 0] <= (w1[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w1[ 7: 0]-((w1[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>5)):(w1[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w1[ 7: 0])>>5));
           end
           else begin
              w1<=w1;
           end
       end
       else begin
       
       end
   end 
end

always@(posedge clk or posedge rst)begin
   if(rst)begin
      w2<=24'b01111101_01111101_01111101;
   end
   else begin
        if(W_update)begin
           if(neighbor_sel[5:4]==2'b00)begin
              w2[23:16] <= (w2[23:16]>RAM_IF_Q_LATCH[23:16])?(w2[23:16]-((w2[23:16]-RAM_IF_Q_LATCH[23:16])>>2)):(w2[23:16]+((RAM_IF_Q_LATCH[23:16]-w2[23:16])>>2));
              w2[15: 8] <= (w2[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w2[15: 8]-((w2[15: 8]-RAM_IF_Q_LATCH[15: 8])>>2)):(w2[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w2[15: 8])>>2));
              w2[ 7: 0] <= (w2[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w2[ 7: 0]-((w2[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>2)):(w2[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w2[ 7: 0])>>2));
           end
           else if(neighbor_sel[5:4]==2'b01)begin
              w2[23:16] <= (w2[23:16]>RAM_IF_Q_LATCH[23:16])?(w2[23:16]-((w2[23:16]-RAM_IF_Q_LATCH[23:16])>>4)):(w2[23:16]+((RAM_IF_Q_LATCH[23:16]-w2[23:16])>>4));
              w2[15: 8] <= (w2[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w2[15: 8]-((w2[15: 8]-RAM_IF_Q_LATCH[15: 8])>>4)):(w2[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w2[15: 8])>>4));
              w2[ 7: 0] <= (w2[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w2[ 7: 0]-((w2[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>4)):(w2[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w2[ 7: 0])>>4));
           end
           else if(neighbor_sel[5:4]==2'b10)begin
              w2[23:16] <= (w2[23:16]>RAM_IF_Q_LATCH[23:16])?(w2[23:16]-((w2[23:16]-RAM_IF_Q_LATCH[23:16])>>5)):(w2[23:16]+((RAM_IF_Q_LATCH[23:16]-w2[23:16])>>5));
              w2[15: 8] <= (w2[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w2[15: 8]-((w2[15: 8]-RAM_IF_Q_LATCH[15: 8])>>5)):(w2[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w2[15: 8])>>5));
              w2[ 7: 0] <= (w2[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w2[ 7: 0]-((w2[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>5)):(w2[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w2[ 7: 0])>>5));
           end
           else begin
              w2<=w2;
           end
       end
       else begin
       
       end
   end 
end
always@(posedge clk or posedge rst)begin
   if(rst)begin
      w3<=24'b01111101_01111101_01111101;
   end
   else begin
       if(W_update)begin
           if(neighbor_sel[7:6]==2'b00)begin
              w3[23:16] <= (w3[23:16]>RAM_IF_Q_LATCH[23:16])?(w3[23:16]-((w3[23:16]-RAM_IF_Q_LATCH[23:16])>>2)):(w3[23:16]+((RAM_IF_Q_LATCH[23:16]-w3[23:16])>>2));
              w3[15: 8] <= (w3[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w3[15: 8]-((w3[15: 8]-RAM_IF_Q_LATCH[15: 8])>>2)):(w3[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w3[15: 8])>>2));
              w3[ 7: 0] <= (w3[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w3[ 7: 0]-((w3[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>2)):(w3[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w3[ 7: 0])>>2));
           end
           else if(neighbor_sel[7:6]==2'b01)begin
              w3[23:16] <= (w3[23:16]>RAM_IF_Q_LATCH[23:16])?(w3[23:16]-((w3[23:16]-RAM_IF_Q_LATCH[23:16])>>4)):(w3[23:16]+((RAM_IF_Q_LATCH[23:16]-w3[23:16])>>4));
              w3[15: 8] <= (w3[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w3[15: 8]-((w3[15: 8]-RAM_IF_Q_LATCH[15: 8])>>4)):(w3[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w3[15: 8])>>4));
              w3[ 7: 0] <= (w3[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w3[ 7: 0]-((w3[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>4)):(w3[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w3[ 7: 0])>>4));
           end
           else if(neighbor_sel[7:6]==2'b10)begin
              w3[23:16] <= (w3[23:16]>RAM_IF_Q_LATCH[23:16])?(w3[23:16]-((w3[23:16]-RAM_IF_Q_LATCH[23:16])>>5)):(w3[23:16]+((RAM_IF_Q_LATCH[23:16]-w3[23:16])>>5));
              w3[15: 8] <= (w3[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w3[15: 8]-((w3[15: 8]-RAM_IF_Q_LATCH[15: 8])>>5)):(w3[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w3[15: 8])>>5));
              w3[ 7: 0] <= (w3[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w3[ 7: 0]-((w3[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>5)):(w3[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w3[ 7: 0])>>5));
           end
           else begin
              w3<=w3;
           end
       end
       else begin
       
       end
   end 
end
always@(posedge clk or posedge rst)begin
   if(rst)begin
      w4<=24'b01111101_01111101_01111101;
   end
   else begin
       if(W_update)begin
           if(neighbor_sel[9:8]==2'b00)begin
              w4[23:16] <= (w4[23:16]>RAM_IF_Q_LATCH[23:16])?(w4[23:16]-((w4[23:16]-RAM_IF_Q_LATCH[23:16])>>2)):(w4[23:16]+((RAM_IF_Q_LATCH[23:16]-w4[23:16])>>2));
              w4[15: 8] <= (w4[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w4[15: 8]-((w4[15: 8]-RAM_IF_Q_LATCH[15: 8])>>2)):(w4[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w4[15: 8])>>2));
              w4[ 7: 0] <= (w4[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w4[ 7: 0]-((w4[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>2)):(w4[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w4[ 7: 0])>>2));
           end
           else if(neighbor_sel[9:8]==2'b01)begin
              w4[23:16] <= (w4[23:16]>RAM_IF_Q_LATCH[23:16])?(w4[23:16]-((w4[23:16]-RAM_IF_Q_LATCH[23:16])>>4)):(w4[23:16]+((RAM_IF_Q_LATCH[23:16]-w4[23:16])>>4));
              w4[15: 8] <= (w4[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w4[15: 8]-((w4[15: 8]-RAM_IF_Q_LATCH[15: 8])>>4)):(w4[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w4[15: 8])>>4));
              w4[ 7: 0] <= (w4[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w4[ 7: 0]-((w4[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>4)):(w4[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w4[ 7: 0])>>4));
           end
           else if(neighbor_sel[9:8]==2'b10)begin
              w4[23:16] <= (w4[23:16]>RAM_IF_Q_LATCH[23:16])?(w4[23:16]-((w4[23:16]-RAM_IF_Q_LATCH[23:16])>>5)):(w4[23:16]+((RAM_IF_Q_LATCH[23:16]-w4[23:16])>>5));
              w4[15: 8] <= (w4[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w4[15: 8]-((w4[15: 8]-RAM_IF_Q_LATCH[15: 8])>>5)):(w4[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w4[15: 8])>>5));
              w4[ 7: 0] <= (w4[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w4[ 7: 0]-((w4[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>5)):(w4[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w4[ 7: 0])>>5));
           end
           else begin
              w4<=w4;
           end
       end
       else begin
       
       end
   end 
end
always@(posedge clk or posedge rst)begin
   if(rst)begin
      w5<=24'b01111101_01111101_01111101;
   end
   else begin
       if(W_update)begin
           if(neighbor_sel[11:10]==2'b00)begin
              w5[23:16] <= (w5[23:16]>RAM_IF_Q_LATCH[23:16])?(w5[23:16]-((w5[23:16]-RAM_IF_Q_LATCH[23:16])>>2)):(w5[23:16]+((RAM_IF_Q_LATCH[23:16]-w5[23:16])>>2));
              w5[15: 8] <= (w5[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w5[15: 8]-((w5[15: 8]-RAM_IF_Q_LATCH[15: 8])>>2)):(w5[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w5[15: 8])>>2));
              w5[ 7: 0] <= (w5[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w5[ 7: 0]-((w5[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>2)):(w5[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w5[ 7: 0])>>2));
           end
           else if(neighbor_sel[11:10]==2'b01)begin
              w5[23:16] <= (w5[23:16]>RAM_IF_Q_LATCH[23:16])?(w5[23:16]-((w5[23:16]-RAM_IF_Q_LATCH[23:16])>>4)):(w5[23:16]+((RAM_IF_Q_LATCH[23:16]-w5[23:16])>>4));
              w5[15: 8] <= (w5[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w5[15: 8]-((w5[15: 8]-RAM_IF_Q_LATCH[15: 8])>>4)):(w5[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w5[15: 8])>>4));
              w5[ 7: 0] <= (w5[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w5[ 7: 0]-((w5[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>4)):(w5[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w5[ 7: 0])>>4));
           end
           else if(neighbor_sel[11:10]==2'b10)begin
              w5[23:16] <= (w5[23:16]>RAM_IF_Q_LATCH[23:16])?(w5[23:16]-((w5[23:16]-RAM_IF_Q_LATCH[23:16])>>5)):(w5[23:16]+((RAM_IF_Q_LATCH[23:16]-w5[23:16])>>5));
              w5[15: 8] <= (w5[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w5[15: 8]-((w5[15: 8]-RAM_IF_Q_LATCH[15: 8])>>5)):(w5[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w5[15: 8])>>5));
              w5[ 7: 0] <= (w5[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w5[ 7: 0]-((w5[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>5)):(w5[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w5[ 7: 0])>>5));
           end
           else begin
              w5<=w5;
           end
       end
       else begin
       
       end
   end 
end
always@(posedge clk or posedge rst)begin
   if(rst)begin
      w6<=24'b01111101_01111101_01111101;
   end
   else begin
       if(W_update)begin
           if(neighbor_sel[13:12]==2'b00)begin
              w6[23:16] <= (w6[23:16]>RAM_IF_Q_LATCH[23:16])?(w6[23:16]-((w6[23:16]-RAM_IF_Q_LATCH[23:16])>>2)):(w6[23:16]+((RAM_IF_Q_LATCH[23:16]-w6[23:16])>>2));
              w6[15: 8] <= (w6[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w6[15: 8]-((w6[15: 8]-RAM_IF_Q_LATCH[15: 8])>>2)):(w6[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w6[15: 8])>>2));
              w6[ 7: 0] <= (w6[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w6[ 7: 0]-((w6[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>2)):(w6[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w6[ 7: 0])>>2));
           end
           else if(neighbor_sel[13:12]==2'b01)begin
              w6[23:16] <= (w6[23:16]>RAM_IF_Q_LATCH[23:16])?(w6[23:16]-((w6[23:16]-RAM_IF_Q_LATCH[23:16])>>4)):(w6[23:16]+((RAM_IF_Q_LATCH[23:16]-w6[23:16])>>4));
              w6[15: 8] <= (w6[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w6[15: 8]-((w6[15: 8]-RAM_IF_Q_LATCH[15: 8])>>4)):(w6[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w6[15: 8])>>4));
              w6[ 7: 0] <= (w6[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w6[ 7: 0]-((w6[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>4)):(w6[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w6[ 7: 0])>>4));
           end
           else if(neighbor_sel[13:12]==2'b10)begin
              w6[23:16] <= (w6[23:16]>RAM_IF_Q_LATCH[23:16])?(w6[23:16]-((w6[23:16]-RAM_IF_Q_LATCH[23:16])>>5)):(w6[23:16]+((RAM_IF_Q_LATCH[23:16]-w6[23:16])>>5));
              w6[15: 8] <= (w6[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w6[15: 8]-((w6[15: 8]-RAM_IF_Q_LATCH[15: 8])>>5)):(w6[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w6[15: 8])>>5));
              w6[ 7: 0] <= (w6[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w6[ 7: 0]-((w6[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>5)):(w6[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w6[ 7: 0])>>5));
           end
           else begin
              w6<=w6;
           end
       end
       else begin
       
       end
   end 
end
always@(posedge clk or posedge rst)begin
   if(rst)begin
      w7<=24'b01111101_01111101_01111101;
   end
   else begin
       if(W_update)begin
           if(neighbor_sel[15:14]==2'b00)begin
              w7[23:16] <= (w7[23:16]>RAM_IF_Q_LATCH[23:16])?(w7[23:16]-((w7[23:16]-RAM_IF_Q_LATCH[23:16])>>2)):(w7[23:16]+((RAM_IF_Q_LATCH[23:16]-w7[23:16])>>2));
              w7[15: 8] <= (w7[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w7[15: 8]-((w7[15: 8]-RAM_IF_Q_LATCH[15: 8])>>2)):(w7[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w7[15: 8])>>2));
              w7[ 7: 0] <= (w7[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w7[ 7: 0]-((w7[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>2)):(w7[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w7[ 7: 0])>>2));
           end
           else if(neighbor_sel[15:14]==2'b01)begin
              w7[23:16] <= (w7[23:16]>RAM_IF_Q_LATCH[23:16])?(w7[23:16]-((w7[23:16]-RAM_IF_Q_LATCH[23:16])>>4)):(w7[23:16]+((RAM_IF_Q_LATCH[23:16]-w7[23:16])>>4));
              w7[15: 8] <= (w7[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w7[15: 8]-((w7[15: 8]-RAM_IF_Q_LATCH[15: 8])>>4)):(w7[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w7[15: 8])>>4));
              w7[ 7: 0] <= (w7[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w7[ 7: 0]-((w7[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>4)):(w7[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w7[ 7: 0])>>4));
           end
           else if(neighbor_sel[15:14]==2'b10)begin
              w7[23:16] <= (w7[23:16]>RAM_IF_Q_LATCH[23:16])?(w7[23:16]-((w7[23:16]-RAM_IF_Q_LATCH[23:16])>>5)):(w7[23:16]+((RAM_IF_Q_LATCH[23:16]-w7[23:16])>>5));
              w7[15: 8] <= (w7[15: 8]>RAM_IF_Q_LATCH[15: 8])?(w7[15: 8]-((w7[15: 8]-RAM_IF_Q_LATCH[15: 8])>>5)):(w7[15: 8]+((RAM_IF_Q_LATCH[15: 8]-w7[15: 8])>>5));
              w7[ 7: 0] <= (w7[ 7: 0]>RAM_IF_Q_LATCH[ 7: 0])?(w7[ 7: 0]-((w7[ 7: 0]-RAM_IF_Q_LATCH[ 7: 0])>>5)):(w7[ 7: 0]+((RAM_IF_Q_LATCH[ 7: 0]-w7[ 7: 0])>>5));
           end
           else begin
              w7<=w7;
           end
       end
       else begin
       
       end
   end 
end


endmodule

