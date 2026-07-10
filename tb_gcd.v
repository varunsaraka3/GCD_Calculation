module tb_gcd;

reg clk, rst, start;
reg [15:0] a_in, b_in;
wire [15:0] gcd_out;
wire done;

gcd uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .a_in(a_in),
    .b_in(b_in),
    .gcd_out(gcd_out),
    .done(done)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    start = 0;

    #10 rst = 0;

    // Test Case 1
    a_in = 48;
    b_in = 18;
    start = 1;
    #10 start = 0;

    wait(done);
    $display("GCD = %d", gcd_out);

    #20;

    // Test Case 2
    a_in = 100;
    b_in = 25;
    start = 1;
    #10 start = 0;

    wait(done);
    $display("GCD = %d", gcd_out);

    #50 $finish;
end

endmodule