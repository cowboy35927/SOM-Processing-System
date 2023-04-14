/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// ------------------------ TOP module ----------------------------//
// ----------------- Feb. 2022 Willie authored --------------------//
/////////////////////////////////////////////////////////////////////

`include "VEP.v"
`include "MIN_1.v"
`include "MIN_2.v"
`include "USS.v"
`include "Controller.v"

module TOP(clk, rst, RAM_IF_Q, RAM_W_Q, RAM_RESULT_Q, RAM_IF_OE, RAM_IF_WE, RAM_IF_A, RAM_IF_D,
		RAM_W_OE, RAM_W_WE, RAM_W_A, RAM_W_D, RAM_RESULT_OE, RAM_RESULT_WE, RAM_RESULT_A, RAM_RESULT_D, done);

// ---------------------- input  ---------------------- //
	input clk;
	input rst;
	input [23:0] RAM_IF_Q;
	input [23:0] RAM_W_Q;
	input [23:0] RAM_RESULT_Q;
	
// ---------------------- output  ---------------------- //	
	output RAM_IF_OE;
	output RAM_IF_WE;
	output [17:0] RAM_IF_A;
	output [23:0] RAM_IF_D;
	output RAM_W_OE;
	output RAM_W_WE;
	output [17:0] RAM_W_A;
	output reg [23:0] RAM_W_D;
	output RAM_RESULT_OE;
	output RAM_RESULT_WE;
	output [17:0] RAM_RESULT_A;
	output [23:0] RAM_RESULT_D;
	output done;

// ---------------------- Write down Your design below  ---------------------- //
wire [2:0] id_0,id_1,id_2,id_3,id_4,id_5,id_6,id_7;
wire D_update;
wire W_update;
wire [15:0] sel0,sel1,sel2,sel3,sel4,sel5,sel6,sel7;
wire [10:0] d0_out,d1_out, d2_out, d3_out, d4_out, d5_out, d6_out, d7_out;		
wire [10:0] d8_out,d9_out, d10_out, d11_out, d12_out, d13_out, d14_out, d15_out;
wire [10:0] d16_out,d17_out, d18_out, d19_out, d20_out, d21_out, d22_out, d23_out;
wire [10:0] d24_out,d25_out, d26_out, d27_out, d28_out, d29_out, d30_out, d31_out;
wire [10:0] d32_out,d33_out, d34_out, d35_out, d36_out, d37_out, d38_out, d39_out;
wire [10:0] d40_out,d41_out, d42_out, d43_out, d44_out, d45_out, d46_out, d47_out;
wire [10:0] d48_out,d49_out, d50_out, d51_out, d52_out, d53_out, d54_out, d55_out;
wire [10:0] d56_out,d57_out, d58_out, d59_out, d60_out, d61_out, d62_out, d63_out;
wire [23:0] weight0,weight1, weight2, weight3, weight4, weight5, weight6, weight7;
wire [23:0] weight8,weight9, weight10, weight11, weight12, weight13, weight14, weight15;
wire [23:0] weight16,weight17, weight18, weight19, weight20, weight21, weight22, weight23;
wire [23:0] weight24,weight25, weight26, weight27, weight28, weight29, weight30, weight31;
wire [23:0] weight32,weight33, weight34, weight35, weight36, weight37, weight38, weight39;
wire [23:0] weight40,weight41, weight42, weight43, weight44, weight45, weight46, weight47;
wire [23:0] weight48,weight49, weight50, weight51, weight52, weight53, weight54, weight55;
wire [23:0] weight56,weight57, weight58, weight59, weight60, weight61, weight62, weight63;
wire [2:0]  d_min_pos_0,d_min_pos_1,d_min_pos_2,d_min_pos_3,d_min_pos_4,d_min_pos_5,d_min_pos_6,d_min_pos_7;
wire [10:0] d_min_0, d_min_1, d_min_2, d_min_3, d_min_4, d_min_5, d_min_6, d_min_7;
wire [23:0] weight_min_0,weight_min_1, weight_min_2, weight_min_3, weight_min_4, weight_min_5, weight_min_6, weight_min_7;
wire [2:0]X_c,Y_c;
Controller  CNTR(.clk(clk), .rst(rst), .D_update(D_update), .W_update(W_update), .RAM_IF_A(RAM_IF_A), .RAM_IF_OE(RAM_IF_OE), .RAM_W_A(RAM_W_A), .RAM_W_WE(RAM_W_WE), .RAM_RESULT_A(RAM_RESULT_A), .RAM_RESULT_WE(RAM_RESULT_WE), .done(done));
VEP V0(.clk(clk), .rst(rst), .D_update(D_update), .W_update(W_update), .neighbor_sel(sel0), .pixel(RAM_IF_Q),.d0(d0_out ),.d1(d1_out ),.d2(d2_out ),.d3(d3_out ),.d4(d4_out ),.d5(d5_out ),.d6(d6_out ),.d7(d7_out ),.w0(weight0 ), .w1(weight1 ), .w2(weight2 ), .w3(weight3 ), .w4(weight4 ), .w5(weight5 ), .w6(weight6 ), .w7(weight7 ));
VEP V1(.clk(clk), .rst(rst), .D_update(D_update), .W_update(W_update), .neighbor_sel(sel1), .pixel(RAM_IF_Q),.d0(d8_out ),.d1(d9_out ),.d2(d10_out),.d3(d11_out),.d4(d12_out),.d5(d13_out),.d6(d14_out),.d7(d15_out),.w0(weight8 ), .w1(weight9 ), .w2(weight10), .w3(weight11), .w4(weight12), .w5(weight13), .w6(weight14), .w7(weight15));
VEP V2(.clk(clk), .rst(rst), .D_update(D_update), .W_update(W_update), .neighbor_sel(sel2), .pixel(RAM_IF_Q),.d0(d16_out),.d1(d17_out),.d2(d18_out),.d3(d19_out),.d4(d20_out),.d5(d21_out),.d6(d22_out),.d7(d23_out),.w0(weight16), .w1(weight17), .w2(weight18), .w3(weight19), .w4(weight20), .w5(weight21), .w6(weight22), .w7(weight23));
VEP V3(.clk(clk), .rst(rst), .D_update(D_update), .W_update(W_update), .neighbor_sel(sel3), .pixel(RAM_IF_Q),.d0(d24_out),.d1(d25_out),.d2(d26_out),.d3(d27_out),.d4(d28_out),.d5(d29_out),.d6(d30_out),.d7(d31_out),.w0(weight24), .w1(weight25), .w2(weight26), .w3(weight27), .w4(weight28), .w5(weight29), .w6(weight30), .w7(weight31));
VEP V4(.clk(clk), .rst(rst), .D_update(D_update), .W_update(W_update), .neighbor_sel(sel4), .pixel(RAM_IF_Q),.d0(d32_out),.d1(d33_out),.d2(d34_out),.d3(d35_out),.d4(d36_out),.d5(d37_out),.d6(d38_out),.d7(d39_out),.w0(weight32), .w1(weight33), .w2(weight34), .w3(weight35), .w4(weight36), .w5(weight37), .w6(weight38), .w7(weight39));
VEP V5(.clk(clk), .rst(rst), .D_update(D_update), .W_update(W_update), .neighbor_sel(sel5), .pixel(RAM_IF_Q),.d0(d40_out),.d1(d41_out),.d2(d42_out),.d3(d43_out),.d4(d44_out),.d5(d45_out),.d6(d46_out),.d7(d47_out),.w0(weight40), .w1(weight41), .w2(weight42), .w3(weight43), .w4(weight44), .w5(weight45), .w6(weight46), .w7(weight47));
VEP V6(.clk(clk), .rst(rst), .D_update(D_update), .W_update(W_update), .neighbor_sel(sel6), .pixel(RAM_IF_Q),.d0(d48_out),.d1(d49_out),.d2(d50_out),.d3(d51_out),.d4(d52_out),.d5(d53_out),.d6(d54_out),.d7(d55_out),.w0(weight48), .w1(weight49), .w2(weight50), .w3(weight51), .w4(weight52), .w5(weight53), .w6(weight54), .w7(weight55));
VEP V7(.clk(clk), .rst(rst), .D_update(D_update), .W_update(W_update), .neighbor_sel(sel7), .pixel(RAM_IF_Q),.d0(d56_out),.d1(d57_out),.d2(d58_out),.d3(d59_out),.d4(d60_out),.d5(d61_out),.d6(d62_out),.d7(d63_out),.w0(weight56), .w1(weight57), .w2(weight58), .w3(weight59), .w4(weight60), .w5(weight61), .w6(weight62), .w7(weight63));

MIN_1 min0(.clk(clk), .rst(rst),.d0( d0_out),.d1( d1_out),.d2( d2_out),.d3( d3_out),.d4( d4_out),.d5( d5_out),.d6( d6_out),.d7( d7_out),.w0(weight0 ), .w1(weight1 ), .w2(weight2 ), .w3(weight3 ), .w4(weight4 ), .w5(weight5 ), .w6(weight6 ), .w7(weight7 ),.d_min(d_min_0),.d_min_index(d_min_pos_0),.w_min(weight_min_0));
MIN_1 min1(.clk(clk), .rst(rst),.d0( d8_out),.d1( d9_out),.d2(d10_out),.d3(d11_out),.d4(d12_out),.d5(d13_out),.d6(d14_out),.d7(d15_out),.w0(weight8 ), .w1(weight9 ), .w2(weight10), .w3(weight11), .w4(weight12), .w5(weight13), .w6(weight14), .w7(weight15),.d_min(d_min_1),.d_min_index(d_min_pos_1),.w_min(weight_min_1));
MIN_1 min2(.clk(clk), .rst(rst),.d0(d16_out),.d1(d17_out),.d2(d18_out),.d3(d19_out),.d4(d20_out),.d5(d21_out),.d6(d22_out),.d7(d23_out),.w0(weight16), .w1(weight17), .w2(weight18), .w3(weight19), .w4(weight20), .w5(weight21), .w6(weight22), .w7(weight23),.d_min(d_min_2),.d_min_index(d_min_pos_2),.w_min(weight_min_2));
MIN_1 min3(.clk(clk), .rst(rst),.d0(d24_out),.d1(d25_out),.d2(d26_out),.d3(d27_out),.d4(d28_out),.d5(d29_out),.d6(d30_out),.d7(d31_out),.w0(weight24), .w1(weight25), .w2(weight26), .w3(weight27), .w4(weight28), .w5(weight29), .w6(weight30), .w7(weight31),.d_min(d_min_3),.d_min_index(d_min_pos_3),.w_min(weight_min_3));
MIN_1 min4(.clk(clk), .rst(rst),.d0(d32_out),.d1(d33_out),.d2(d34_out),.d3(d35_out),.d4(d36_out),.d5(d37_out),.d6(d38_out),.d7(d39_out),.w0(weight32), .w1(weight33), .w2(weight34), .w3(weight35), .w4(weight36), .w5(weight37), .w6(weight38), .w7(weight39),.d_min(d_min_4),.d_min_index(d_min_pos_4),.w_min(weight_min_4));
MIN_1 min5(.clk(clk), .rst(rst),.d0(d40_out),.d1(d41_out),.d2(d42_out),.d3(d43_out),.d4(d44_out),.d5(d45_out),.d6(d46_out),.d7(d47_out),.w0(weight40), .w1(weight41), .w2(weight42), .w3(weight43), .w4(weight44), .w5(weight45), .w6(weight46), .w7(weight47),.d_min(d_min_5),.d_min_index(d_min_pos_5),.w_min(weight_min_5));
MIN_1 min6(.clk(clk), .rst(rst),.d0(d48_out),.d1(d49_out),.d2(d50_out),.d3(d51_out),.d4(d52_out),.d5(d53_out),.d6(d54_out),.d7(d55_out),.w0(weight48), .w1(weight49), .w2(weight50), .w3(weight51), .w4(weight52), .w5(weight53), .w6(weight54), .w7(weight55),.d_min(d_min_6),.d_min_index(d_min_pos_6),.w_min(weight_min_6));
MIN_1 min7(.clk(clk), .rst(rst),.d0(d56_out),.d1(d57_out),.d2(d58_out),.d3(d59_out),.d4(d60_out),.d5(d61_out),.d6(d62_out),.d7(d63_out),.w0(weight56), .w1(weight57), .w2(weight58), .w3(weight59), .w4(weight60), .w5(weight61), .w6(weight62), .w7(weight63),.d_min(d_min_7),.d_min_index(d_min_pos_7),.w_min(weight_min_7));

//MIN_2 min8(.clk(clk), .rst(rst),.d0(d_min_0),.d1(d_min_1),.d2(d_min_2),.d3(d_min_3),.d4(d_min_4),.d5(d_min_5),.d6(d_min_6),.d7(d_min_7),.w0(weight_min_0),.w1(weight_min_1),.w2(weight_min_2),.w3(weight_min_4),.w4(weight_min_4),.w5(weight_min_5),.w6(weight_min_6),.w7(weight_min_7),.X_c(d_min_pos_8),.w_min(weight_min_8));
//MIN_2 min8(.clk(clk), .rst(rst),.d0(d_min_0),.d1(d_min_1),.d2(d_min_2),.d3(d_min_3),.d4(d_min_4),.d5(d_min_5),.d6(d_min_6),.d7(d_min_7),.w0(weight_min_0),.w1(weight_min_1),.w2(weight_min_2),.w3(weight_min_4),.w4(weight_min_4),.w5(weight_min_5),.w6(weight_min_6),.w7(weight_min_7),.d_min(d_min_8),.d_min_index(d_min_pos_8),.w_min(weight_min_8));
MIN_2 min8(.clk(clk),.rst(rst),.d0(d_min_0),.d1(d_min_1),.d2(d_min_2),.d3(d_min_3),.d4(d_min_4),.d5(d_min_5),.d6(d_min_6),.d7(d_min_7),.w0(weight_min_0),.w1(weight_min_1),.w2(weight_min_2),.w3(weight_min_3),.w4(weight_min_4),.w5(weight_min_5),.w6(weight_min_6),.w7(weight_min_7)
,.index0(d_min_pos_0),.index1(d_min_pos_1),.index2(d_min_pos_2),.index3(d_min_pos_3),.index4(d_min_pos_4),.index5(d_min_pos_5),.index6(d_min_pos_6),.index7(d_min_pos_7),.X_c(X_c),.Y_c(Y_c),.weight_c(RAM_RESULT_D));
USS u0(.clk(clk),.rst(rst), .X_in(id_0), .X_c(X_c), .Y_c(Y_c), .neighbor_sel(sel0));
USS u1(.clk(clk),.rst(rst), .X_in(id_1), .X_c(X_c), .Y_c(Y_c), .neighbor_sel(sel1));
USS u2(.clk(clk),.rst(rst), .X_in(id_2), .X_c(X_c), .Y_c(Y_c), .neighbor_sel(sel2));
USS u3(.clk(clk),.rst(rst), .X_in(id_3), .X_c(X_c), .Y_c(Y_c), .neighbor_sel(sel3));
USS u4(.clk(clk),.rst(rst), .X_in(id_4), .X_c(X_c), .Y_c(Y_c), .neighbor_sel(sel4));
USS u5(.clk(clk),.rst(rst), .X_in(id_5), .X_c(X_c), .Y_c(Y_c), .neighbor_sel(sel5));
USS u6(.clk(clk),.rst(rst), .X_in(id_6), .X_c(X_c), .Y_c(Y_c), .neighbor_sel(sel6));
USS u7(.clk(clk),.rst(rst), .X_in(id_7), .X_c(X_c), .Y_c(Y_c), .neighbor_sel(sel7));
assign id_0=3'd0;
assign id_1=3'd1;
assign id_2=3'd2;
assign id_3=3'd3;
assign id_4=3'd4;
assign id_5=3'd5;
assign id_6=3'd6;
assign id_7=3'd7;
always@(*)begin
       case(RAM_W_A[5:3])
           3'd0:begin
                case(RAM_W_A[2:0])
                       3'd0:RAM_W_D=weight0;
                       3'd1:RAM_W_D=weight1;
                       3'd2:RAM_W_D=weight2;
                       3'd3:RAM_W_D=weight3;
                       3'd4:RAM_W_D=weight4;
                       3'd5:RAM_W_D=weight5;
                       3'd6:RAM_W_D=weight6;
                       3'd7:RAM_W_D=weight7;                       
                endcase
           end
           3'd1:begin
                case(RAM_W_A[2:0])
                       3'd0:RAM_W_D=weight8;
                       3'd1:RAM_W_D=weight9;
                       3'd2:RAM_W_D=weight10;
                       3'd3:RAM_W_D=weight11;
                       3'd4:RAM_W_D=weight12;
                       3'd5:RAM_W_D=weight13;
                       3'd6:RAM_W_D=weight14;
                       3'd7:RAM_W_D=weight15;                       
                endcase
           end
           3'd2:begin
                case(RAM_W_A[2:0])
                       3'd0:RAM_W_D=weight16;
                       3'd1:RAM_W_D=weight17;
                       3'd2:RAM_W_D=weight18;
                       3'd3:RAM_W_D=weight19;
                       3'd4:RAM_W_D=weight20;
                       3'd5:RAM_W_D=weight21;
                       3'd6:RAM_W_D=weight22;
                       3'd7:RAM_W_D=weight23;                       
                endcase
           end
           3'd3:begin
                case(RAM_W_A[2:0])
                       3'd0:RAM_W_D=weight24;
                       3'd1:RAM_W_D=weight25;
                       3'd2:RAM_W_D=weight26;
                       3'd3:RAM_W_D=weight27;
                       3'd4:RAM_W_D=weight28;
                       3'd5:RAM_W_D=weight29;
                       3'd6:RAM_W_D=weight30;
                       3'd7:RAM_W_D=weight31;                       
                endcase
           end
           3'd4:begin
                case(RAM_W_A[2:0])
                       3'd0:RAM_W_D=weight32;
                       3'd1:RAM_W_D=weight33;
                       3'd2:RAM_W_D=weight34;
                       3'd3:RAM_W_D=weight35;
                       3'd4:RAM_W_D=weight36;
                       3'd5:RAM_W_D=weight37;
                       3'd6:RAM_W_D=weight38;
                       3'd7:RAM_W_D=weight39;                       
                endcase
           end
           3'd5:begin
                case(RAM_W_A[2:0])
                       3'd0:RAM_W_D=weight40;
                       3'd1:RAM_W_D=weight41;
                       3'd2:RAM_W_D=weight42;
                       3'd3:RAM_W_D=weight43;
                       3'd4:RAM_W_D=weight44;
                       3'd5:RAM_W_D=weight45;
                       3'd6:RAM_W_D=weight46;
                       3'd7:RAM_W_D=weight47;                       
                endcase
           end
           3'd6:begin
                case(RAM_W_A[2:0])
                       3'd0:RAM_W_D=weight48;
                       3'd1:RAM_W_D=weight49;
                       3'd2:RAM_W_D=weight50;
                       3'd3:RAM_W_D=weight51;
                       3'd4:RAM_W_D=weight52;
                       3'd5:RAM_W_D=weight53;
                       3'd6:RAM_W_D=weight54;
                       3'd7:RAM_W_D=weight55;                       
                endcase
           end
           3'd7:begin
                case(RAM_W_A[2:0])
                       3'd0:RAM_W_D=weight56;
                       3'd1:RAM_W_D=weight57;
                       3'd2:RAM_W_D=weight58;
                       3'd3:RAM_W_D=weight59;
                       3'd4:RAM_W_D=weight60;
                       3'd5:RAM_W_D=weight61;
                       3'd6:RAM_W_D=weight62;
                       3'd7:RAM_W_D=weight63;                       
                endcase
           end
      endcase
    end
endmodule


