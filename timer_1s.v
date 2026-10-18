module timer_1s (
    input wire clk,
    input wire rst_n,
    output reg tick_1s
);

    parameter COUNT_MAX = 26'd49999999;

    reg [25:0] count;

    always @(posedge clk or negedge rst_n)
    begin
        if (!rst_n)
        begin
            count <= 26'd0;
            tick_1s <= 1'b0;
        end
        else if (count == COUNT_MAX)
        begin
            count <= 26'd0;
            tick_1s <= 1'b1;
        end
        else
        begin
            count <= count + 1'b1;
            tick_1s <= 1'b0;
        end
    end

endmodule