module gcd (
    input clk,
    input rst,
    input start,
    input [15:0] a_in,
    input [15:0] b_in,
    output reg [15:0] gcd_out,
    output reg done
);

reg [15:0] A, B;
reg running;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        A <= 0;
        B <= 0;
        gcd_out <= 0;
        done <= 0;
        running <= 0;
    end 
    else begin
        if (start && !running) begin
            A <= a_in;
            B <= b_in;
            done <= 0;
            running <= 1;
        end 
        else if (running) begin
            if (A > B)
                A <= A - B;
            else if (B > A)
                B <= B - A;
            else begin
                gcd_out <= A;
                done <= 1;
                running <= 0;
            end
        end
    end
end

endmodule