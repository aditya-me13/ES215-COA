module ID_EX_Register (
    input clk,
    input reset,
    input [31:0] read_data1_in, read_data2_in, sign_extended_immediate_in,
    input [4:0] rs_in, rt_in, rd_in,
    input reg_dst_in, alu_src_in, mem_to_reg_in, reg_write_in, mem_read_in, mem_write_in, branch_in, jump_in,
    output reg [31:0] read_data1_out, read_data2_out, sign_extended_immediate_out,
    output reg [4:0] rs_out, rt_out, rd_out,
    output reg reg_dst_out, alu_src_out, mem_to_reg_out, reg_write_out, mem_read_out, mem_write_out, branch_out, jump_out
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset all pipeline outputs
            read_data1_out <= 0;
            read_data2_out <= 0;
            sign_extended_immediate_out <= 0;
            rs_out <= 0;
            rt_out <= 0;
            rd_out <= 0;
            reg_dst_out <= 0;
            alu_src_out <= 0;
            mem_to_reg_out <= 0;
            reg_write_out <= 0;
            mem_read_out <= 0;
            mem_write_out <= 0;
            branch_out <= 0;
            jump_out <= 0;
        end else begin
            // Store inputs to outputs
            read_data1_out <= read_data1_in;
            read_data2_out <= read_data2_in;
            sign_extended_immediate_out <= sign_extended_immediate_in;
            rs_out <= rs_in;
            rt_out <= rt_in;
            rd_out <= rd_in;
            reg_dst_out <= reg_dst_in;
            alu_src_out <= alu_src_in;
            mem_to_reg_out <= mem_to_reg_in;
            reg_write_out <= reg_write_in;
            mem_read_out <= mem_read_in;
            mem_write_out <= mem_write_in;
            branch_out <= branch_in;
            jump_out <= jump_in;
        end
    end
endmodule
