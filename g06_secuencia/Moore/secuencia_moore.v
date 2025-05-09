module secuencia_moore (
    input wire clk,
    input wire reset,
    input wire w,
    output wire z
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
    case(state)
        S0: if (w==1'b0)
                nextstate = S0;
            else
                nextstate = S1;

        S1: if (w==1'b0)
                nextstate = S0;
            else
                nextstate = S2;
        S2: if (w==1'b0)
                nextstate = S0;
            else
                nextstate = S2;
        default:
            nextstate = state;
    endcase
end

assign z = (state == S2);
    
endmodule