module secuencia_merged (
    input wire clk,
    input wire reset,
    input wire w,
    output reg z
);

localparam [1:0]
    S0 = 2'b00,
    S1 = 2'b01,
    S2 = 2'b10;

reg [1:0] state, nextstate;

always @(posedge clk, posedge reset)
begin
    if(reset) // go to state zero if rese
        begin
            state <= S0;
        end
    else // otherwise update the states
        begin
            state <= nextstate;
        end
end

always @*
begin
    nextstate = state;
    z = 1'b0;
    case(state)
        S0: 
        begin
            if (w==1'b0)
                nextstate = S0;
            else
                nextstate = S1;
        end
        S1:
        begin
            if (w==1'b0)
                nextstate = S0;
            else
                nextstate = S2;
        end
        S2:
        begin
            z = 1'b1;
            if (w==1'b0)
                nextstate = S0;
            else
                nextstate = S2;
        end
        default:
            nextstate = S0;
    endcase
end

// assign z = (state == S2);
    
endmodule