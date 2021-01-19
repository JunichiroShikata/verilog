`timescale 1ns/1ns
module top_tb();

    reg CLK, D_IN, RESET;
    wire [1:0] D_OUT;

    shift_reg shift_reg(.clk (CLK), .d_in (D_IN), .reset(RESET), .d_out (D_OUT));

    task tyaude(input [1:0]result, input [1:0]value);
    begin
        if(result!=value) begin
            $error("tyaude");
            $stop;
        end
    end
    endtask

    initial begin
        CLK = 0;
        RESET = 0;
        D_IN = 1'b0;
        @(posedge CLK);
        RESET = 1;
        @(posedge CLK);
        RESET = 0;
        tyaude(D_OUT, 2'b00);
        D_IN = 1'b1;
        @(posedge CLK);
        tyaude(D_OUT, 2'b00);
        @(posedge CLK);
        tyaude(D_OUT, 2'b01);
        @(posedge CLK);
        tyaude(D_OUT, 2'b11);
        $stop;
    end
    always #10
        CLK <= ~CLK;

endmodule