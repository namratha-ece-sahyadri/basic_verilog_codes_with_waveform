module mux_4to1 (
    input [3:0] in,       
    input [1:0] sel,    
    output out            
);
    assign out = (sel == 2'b00) ? in[0] :
                 (sel == 2'b01) ? in[1] :
                 (sel == 2'b10) ? in[2] :
                 in[3];
endmodule
