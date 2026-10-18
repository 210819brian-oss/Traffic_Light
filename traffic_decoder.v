module traffic_decoder (
    input wire state_0,
    input wire state_1,

    output reg main_red,
    output reg main_yellow,
    output reg main_green,

    output reg side_red,
    output reg side_yellow,
    output reg side_green
);

    always @(state_0 or state_1)
    begin
        main_red = 1'b0;
        main_yellow = 1'b0;
        main_green = 1'b0;

        side_red = 1'b0;
        side_yellow = 1'b0;
        side_green = 1'b0;

        case ({state_1, state_0})
            2'b00:
            begin
                main_green = 1'b1;
                side_red = 1'b1;
            end

            2'b01:
            begin
                main_yellow = 1'b1;
                side_red = 1'b1;
            end

            2'b10:
            begin
                main_red = 1'b1;
                side_green = 1'b1;
            end

            default:
            begin
                main_red = 1'b1;
                side_yellow = 1'b1;
            end
        endcase
    end

endmodule