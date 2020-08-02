`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2019 05:15:14 PM
// Design Name: 
// Module Name: FSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FSM(reset, clk, shb, ld, clr, ldp, shp );

    input clk, reset;
    
    output  shb, ld, clr, ldp, shp;
    reg     shb, ld, clr, ldp, shp;
    
    reg [3:0] cs, ns;
    parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5,
    s6 = 6, s7 = 7, s8 = 8, s9 = 9, s10 = 10, s11 = 11, s12 = 12,
    s13 = 13;
    
    always @(posedge clk or posedge reset ) begin
        if(reset)
            cs <= s0;
        else 
            cs <= ns;
     end 
     
     always @(cs)
     begin
        case(cs)
        s0: ns = s1;
        s1: ns = s2;
        s2: ns = s3;
        s3: ns = s4;
        s4: ns = s5;
        s5: ns = s6;
        s6: ns = s7;
        s7: ns = s8;
        s8: ns = s9;
        s9: ns = s10;
        s10: ns = s11;
        s11: ns = s12;
        s12: ns <= s12;
        //s13: ns <= s13;
        default: ns <= s0;
      endcase 
      end 
      
      always @(cs) 
      begin
        case (cs) 
        s0:begin 
        clr = 1;ld = 0; shp = 0; shb = 0;  ldp  = 0;
        end 

        s1:begin 
        clr = 0;ld = 1; shp = 0; shb = 0; ldp  = 0;
        end         
        //---------------------------------------------
        s2:begin 
        clr = 0;ld = 0; shp = 0; shb = 0; ldp  = 1;
        end 
        //-----------------------------------------------------
        s3:begin 
        clr = 0;ld = 0; shp = 1; shb = 0; ldp  = 0;
        end 
        
        s4:begin 
        clr = 0;ld = 0; shp = 0; shb = 1; ldp  = 0;
        end  
         
        s5:begin 
        clr = 0;ld = 0; shp = 0; shb = 0; ldp  = 1;
        end
        //------------------------------------------------------
        s6:begin 
        clr = 0;ld = 0; shp = 1; shb = 0; ldp  = 0;
        end  
        
        s7:begin 
        clr = 0;ld = 0; shp = 0;shb = 1; ldp  = 0;
        end    
 
        s8:begin 
        clr = 0;ld = 0; shp = 0; shb = 0; ldp  = 1;
        end 
        //------------------------------------------------------
        s9:begin 
        clr = 0;ld = 0; shp = 1; shb = 0; ldp  = 0;
        end 
        
        s10:begin 
        clr = 0;ld = 0; shp = 0; shb = 1; ldp  = 0;
        end
        
        s11:begin 
        clr = 0;ld = 0; shp = 0; shb = 0; ldp  = 1;
        end
        //---------------------------------------
        s12:begin 
        clr = 0;ld = 0; shp = 0; shb = 0; ldp  = 0;
        end
        
        default: begin
        clr = 0;ld = 0; shp = 0;shb = 0; ldp  = 0;
        end          
      endcase 
      end 
endmodule
