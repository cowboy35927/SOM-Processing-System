/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// --------------------- Controller module ------------------------//
// ----------------- Feb. 2022 Willie authored --------------------//
/////////////////////////////////////////////////////////////////////

module Controller(clk, rst, D_update, W_update, RAM_IF_A, RAM_IF_OE, RAM_W_A, RAM_W_WE, RAM_RESULT_A, RAM_RESULT_WE, done);

// ---------------------- input  ---------------------- //
	input clk;
	input rst;

// ---------------------- output  ---------------------- //	
	output reg D_update;
	output reg W_update;
	output reg [17:0] RAM_IF_A;
	output reg RAM_IF_OE;
	output reg [17:0] RAM_W_A;
	output reg RAM_W_WE;
	output reg [17:0] RAM_RESULT_A;
	output reg RAM_RESULT_WE;
	output reg done;
	
// ---------------------- Write down Your design below  ---------------------- //
reg [3:0] st,st_ns;

parameter [3:0] INI=4'd0,READ=4'd1,SEL=4'd2,UPDATE=4'd3,W_WEIGHT=4'd4,W_PIC=4'd5,delay1=4'd6,delay2=4'd7,delay3=4'd8,DONE=4'd9;
reg reset_RAM_IF_A;

always@(posedge clk or posedge rst)begin
   if(rst)begin
      RAM_IF_A<=18'd0;
   end
   else begin
        if(RAM_IF_OE)begin
           RAM_IF_A<=RAM_IF_A+18'd1;
        end
        else if(reset_RAM_IF_A)begin
           RAM_IF_A<=18'd0;
        end
        else begin
           
        end
   end
end
always@(posedge clk or posedge rst)begin
   if(rst)begin
      RAM_W_A<=18'd0;
   end
   else begin
        if(RAM_W_WE)begin
           RAM_W_A<=RAM_W_A+18'd1;
        end
        else begin
        
        end
   end
end

always@(posedge clk or posedge rst)begin
   if(rst)begin
      RAM_RESULT_A<=18'd0;
   end
   else begin
        if(RAM_RESULT_WE)begin
           RAM_RESULT_A<=RAM_RESULT_A+18'd1;
        end
        else begin
        
        end
   end
end



always@(posedge clk or posedge rst)begin
      if(rst)begin
      st<=INI;
   end
   else begin
      st<=st_ns;
   end
end

always@(*)begin
   case(st)
        INI:begin
           st_ns=READ;
        end
        READ:begin
           st_ns=SEL;
        end
        SEL:begin
           st_ns=UPDATE;
        end  
        UPDATE:begin
           if(RAM_IF_A<18'd4096)begin
              st_ns=READ;
           end
           else begin
              st_ns=W_WEIGHT;
           end
        end
        W_WEIGHT:begin  
            if(RAM_W_A<18'd63)begin   
               st_ns=W_WEIGHT;  
            end
            else begin
               st_ns=delay1;   
            end
        end
        delay1:begin
            st_ns=delay2;   
        end
        delay2:begin
            st_ns=delay3;   
        end
        delay3:begin
            st_ns=W_PIC;   
        end
        W_PIC:begin
           if(RAM_RESULT_A<18'd4096)begin
              st_ns=W_PIC;
           end
           else begin
              st_ns=DONE;   
           end 
        end 
        DONE:begin
           st_ns=DONE;   
        end
        default:begin
           st_ns=INI;
        end
   endcase
end

always@(*)begin
   case(st)
        INI:begin
           RAM_IF_OE=1'b0;
           D_update =1'b0;
           RAM_RESULT_WE=1'b0;
           W_update =1'b0;
           RAM_W_WE=1'b0;
           reset_RAM_IF_A=1'b0;
           done=1'b0;
        end
        READ:begin
           RAM_IF_OE=1'b1;
           D_update =1'b1;
           RAM_RESULT_WE=1'b0; 
           W_update =1'b0;
           RAM_W_WE=1'b0;   
           reset_RAM_IF_A=1'b0;
           done=1'b0;      
        end
        SEL:begin
           RAM_IF_OE=1'b0;
           D_update =1'b0;
           RAM_RESULT_WE=1'b0;
           W_update =1'b0;
           RAM_W_WE=1'b0; 
           reset_RAM_IF_A=1'b0;
           done=1'b0;
        end  
        UPDATE:begin
           RAM_IF_OE=1'b0;
           D_update =1'b0;
           RAM_RESULT_WE=1'b0;
           W_update =1'b1;
           RAM_W_WE=1'b0; 
           reset_RAM_IF_A=1'b0;
           done=1'b0;
        end
        W_WEIGHT:begin
           RAM_IF_OE=1'b0;
           D_update =1'b0;
           RAM_RESULT_WE=1'b0;
           W_update =1'b0;
           RAM_W_WE=1'b1; 
           reset_RAM_IF_A=1'b1;
           done=1'b0;
        end
        delay1:begin
           RAM_IF_OE=1'b1;
           D_update =1'b1;
           RAM_RESULT_WE=1'b0;
           W_update =1'b0;
           RAM_W_WE=1'b0; 
           reset_RAM_IF_A=1'b0;
           done=1'b0;          
        end
        delay2:begin
           RAM_IF_OE=1'b1;
           D_update =1'b1;
           RAM_RESULT_WE=1'b0;
           W_update =1'b0;
           RAM_W_WE=1'b0; 
           reset_RAM_IF_A=1'b0;
           done=1'b0;          
        end
        delay3:begin
           RAM_IF_OE=1'b1;
           D_update =1'b1;
           RAM_RESULT_WE=1'b0;
           W_update =1'b0;
           RAM_W_WE=1'b0; 
           reset_RAM_IF_A=1'b0;
           done=1'b0;          
        end
        W_PIC:begin
           RAM_IF_OE=1'b1;
           D_update =1'b1;
           RAM_RESULT_WE=1'b1;
           W_update =1'b0;
           RAM_W_WE=1'b0; 
           reset_RAM_IF_A=1'b0;
           done=1'b0;
        end 
        DONE:begin
           RAM_IF_OE=1'b0;
           D_update =1'b0;
           RAM_RESULT_WE=1'b0;
           W_update =1'b0;
           RAM_W_WE=1'b0; 
           reset_RAM_IF_A=1'b0;
           done=1'b1;
        end
        default:begin
           RAM_IF_OE=1'b0;
           D_update =1'b0;
           RAM_RESULT_WE=1'b0;
           W_update =1'b0;
           RAM_W_WE=1'b0; 
           reset_RAM_IF_A=1'b0;
           done=1'b0;
        end
   endcase
end
endmodule 
