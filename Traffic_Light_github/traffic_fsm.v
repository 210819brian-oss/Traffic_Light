module traffic_fsm (
    input wire clk,
    input wire rst_n,
    input wire tick_1s,
    output wire state_0,
    output wire state_1
);

    parameter MAIN_GREEN  = 2'd0;
    parameter MAIN_YELLOW = 2'd1;
    parameter SIDE_GREEN  = 2'd2;
    parameter SIDE_YELLOW = 2'd3;

    reg [1:0] state;
    reg [5:0] seconds_left;

    assign state_0 = state[0];
    assign state_1 = state[1];

    always @(posedge clk or negedge rst_n)
    begin
        if (!rst_n)
        begin
            state <= MAIN_GREEN;
            seconds_left <= 6'd30;
        end
        else if (tick_1s)
        begin
            if (seconds_left > 6'd1)
                seconds_left <= seconds_left - 6'd1;
            else
            begin
                case (state)
                    MAIN_GREEN:
                    begin
                        state <= MAIN_YELLOW;
                        seconds_left <= 6'd5;
                    end

                    MAIN_YELLOW:
                    begin
                        state <= SIDE_GREEN;
                        seconds_left <= 6'd20;
                    end

                    SIDE_GREEN:
                    begin
                        state <= SIDE_YELLOW;
                        seconds_left <= 6'd5;
                    end

                    default:
                    begin
                        state <= MAIN_GREEN;
                        seconds_left <= 6'd30;
                    end
                endcase
            end
        end
    end

endmodule