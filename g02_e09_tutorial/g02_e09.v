// sum(0, 3, 4, 5, 6)

module g02_e09 (
    input wire [3:0] a,
    output wire z
    );

assign z =
            (~a[3] & ~a[1] & ~a[0]) |
            (~a[3] &  a[2] & ~a[1]) |
            (~a[3] &  a[2] & ~a[0]) |
            (~a[3] & ~a[2] & a[1] & a[0]);
    
endmodule