module shift_reg(input clk, input d_in, input reset, output [1:0] d_out);

    reg [1:0] ff;

    assign d_out = ff;

    always @(posedge clk or posedge reset) begin
        if(reset==1'b1)
            ff = 2'b00;
        else
            ff = {ff[0], d_in};
    end

endmodule