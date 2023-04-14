/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// ------------------------- USS module ---------------------------//
// ----------------- Feb. 2022 Willie authored --------------------//
/////////////////////////////////////////////////////////////////////

module USS(clk, rst, X_in, X_c, Y_c, neighbor_sel);

// ---------------------- input  ---------------------- //
	input clk;
	input rst;
	input [2:0] X_in;
	input [2:0] X_c;
	input [2:0] Y_c;
	
// ---------------------- output  ---------------------- //
	output reg [15:0] neighbor_sel;
	
// ---------------------- Write down Your design below  ---------------------- //
parameter [1:0] s0=2'b00 //1
               ,s1=2'b01 //0.25
               ,s2=2'b10 //0.125
               ,s3=2'b11;//0
reg [15:0] neighbor_sel1;

always@(*)begin 
 if(X_c>=3'd2 && X_c<=3'd5)begin
    if(X_in==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_01_00;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_01_00_01;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_01_00_01_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_01_00_01_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_01_00_01_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_01_00_01_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b01_00_01_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b00_01_10_11_11_11_11_11;
          end  
   end
   else if(X_in-3'd1==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_01_01;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_01_01_01;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_01_01_01_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_01_01_01_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_01_01_01_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_01_01_01_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b01_01_01_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b01_01_10_11_11_11_11_11;
          end  
   end
   else if(X_in+3'd1==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_01_01;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_01_01_01;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_01_01_01_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_01_01_01_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_01_01_01_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_01_01_01_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b01_01_01_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b01_01_10_11_11_11_11_11;
          end  
   end
   else if(X_in+3'd2==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_10_10;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_10_10_10;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_10_10_10_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_10_10_10_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_10_10_10_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_10_10_10_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b10_10_10_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b10_10_10_11_11_11_11_11;
          end  
   end
   else if(X_in-3'd2==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_10_10;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_10_10_10;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_10_10_10_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_10_10_10_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_10_10_10_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_10_10_10_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b10_10_10_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b10_10_10_11_11_11_11_11;
          end  
   end
   else begin
        neighbor_sel1=16'b11_11_11_11_11_11_11_11;
   end
 end    
 else if(X_c==3'd1)begin
    if(X_in==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_01_00;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_01_00_01;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_01_00_01_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_01_00_01_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_01_00_01_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_01_00_01_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b01_00_01_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b00_01_10_11_11_11_11_11;
          end  
   end
   else if(X_in-3'd1==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_01_01;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_01_01_01;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_01_01_01_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_01_01_01_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_01_01_01_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_01_01_01_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b01_01_01_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b01_01_10_11_11_11_11_11;
          end  
   end
   else if(X_in+3'd1==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_01_01;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_01_01_01;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_01_01_01_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_01_01_01_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_01_01_01_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_01_01_01_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b01_01_01_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b01_01_10_11_11_11_11_11;
          end  
   end
   else if(X_in-3'd2==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_10_10;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_10_10_10;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_10_10_10_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_10_10_10_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_10_10_10_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_10_10_10_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b10_10_10_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b10_10_10_11_11_11_11_11;
          end  
   end
   else begin
        neighbor_sel1=16'b11_11_11_11_11_11_11_11;
   end
 end 
 else if(X_c==3'd0)begin
    if(X_in==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_01_00;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_01_00_01;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_01_00_01_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_01_00_01_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_01_00_01_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_01_00_01_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b01_00_01_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b00_01_10_11_11_11_11_11;
          end  
   end
   else if(X_in-3'd1==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_01_01;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_01_01_01;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_01_01_01_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_01_01_01_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_01_01_01_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_01_01_01_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b01_01_01_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b01_01_10_11_11_11_11_11;
          end  
   end
   else if(X_in-3'd2==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_10_10;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_10_10_10;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_10_10_10_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_10_10_10_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_10_10_10_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_10_10_10_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b10_10_10_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b10_10_10_11_11_11_11_11;
          end  
   end
   else begin
        neighbor_sel1=16'b11_11_11_11_11_11_11_11;
   end
 end
 else if(X_c==3'd6)begin
    if(X_in==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_01_00;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_01_00_01;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_01_00_01_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_01_00_01_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_01_00_01_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_01_00_01_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b01_00_01_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b00_01_10_11_11_11_11_11;
          end  
   end
   else if(X_in-3'd1==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_01_01;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_01_01_01;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_01_01_01_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_01_01_01_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_01_01_01_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_01_01_01_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b01_01_01_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b01_01_10_11_11_11_11_11;
          end  
   end
   else if(X_in+3'd1==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_01_01;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_01_01_01;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_01_01_01_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_01_01_01_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_01_01_01_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_01_01_01_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b01_01_01_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b01_01_10_11_11_11_11_11;
          end  
   end
   else if(X_in+3'd2==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_10_10;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_10_10_10;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_10_10_10_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_10_10_10_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_10_10_10_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_10_10_10_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b10_10_10_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b10_10_10_11_11_11_11_11;
          end  
   end
   else begin
        neighbor_sel1=16'b11_11_11_11_11_11_11_11;
   end
 end 
 else begin
    if(X_in==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_01_00;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_01_00_01;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_01_00_01_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_01_00_01_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_01_00_01_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_01_00_01_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b01_00_01_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b00_01_10_11_11_11_11_11;
          end  
   end  
   else if(X_in+3'd1==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_01_01;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_01_01_01;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_01_01_01_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_01_01_01_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_01_01_01_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_01_01_01_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b01_01_01_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b01_01_10_11_11_11_11_11;
          end  
   end
   else if(X_in+3'd2==X_c)begin
          if(Y_c==3'd0)begin
             neighbor_sel1=16'b11_11_11_11_11_10_10_10;
          end
          else if(Y_c==3'd1)begin
             neighbor_sel1=16'b11_11_11_11_10_10_10_10;    
          end
          else if(Y_c==3'd2)begin
             neighbor_sel1=16'b11_11_11_10_10_10_10_10;    
          end
          else if(Y_c==3'd3)begin
             neighbor_sel1=16'b11_11_10_10_10_10_10_11;
          end 
          else if(Y_c==3'd4)begin
             neighbor_sel1=16'b11_10_10_10_10_10_11_11;
          end 
          else if(Y_c==3'd5)begin
             neighbor_sel1=16'b10_10_10_10_10_11_11_11;
          end 
          else if(Y_c==3'd6)begin
             neighbor_sel1=16'b10_10_10_10_11_11_11_11;
          end         
          else begin
             neighbor_sel1=16'b10_10_10_11_11_11_11_11;
          end  
   end  
   else begin
        neighbor_sel1=16'b11_11_11_11_11_11_11_11;
   end
 end  
end    


always@(*)begin
  
      neighbor_sel=neighbor_sel1;
  
end

endmodule

