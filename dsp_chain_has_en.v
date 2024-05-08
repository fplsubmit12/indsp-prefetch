`timescale 1ns / 1ps

module dsp_chain_has_en(
    input clk,
    input signed [15:0] a,
    input ena_0,
    input ena_1,
    input ena_2,
    input ena_3,
    input ena_d_0,
    input ena_d_1,
    input ena_d_2,
    input ena_d_3,
    input signed [15:0] b_0,
    input signed [15:0] b_1,
    input signed [15:0] b_2,
    input signed [15:0] b_3,
    output signed [31:0] p_out
    );

    reg signed [15:0] a_0;
    reg signed [15:0] a_1;
    reg signed [15:0] a_2;
    reg signed [15:0] a_3;

    reg signed [15:0] a_d_0;
    reg signed [15:0] a_d_1;
    reg signed [15:0] a_d_2;
    reg signed [15:0] a_d_3;

    reg signed [15:0] b_d_0;
    reg signed [15:0] b_d_1;
    reg signed [15:0] b_d_2;
    reg signed [15:0] b_d_3;

    reg signed [31:0] m_d_0;
    reg signed [31:0] m_d_1;
    reg signed [31:0] m_d_2;
    reg signed [31:0] m_d_3;

    reg signed [31:0] p_d_0;
    reg signed [31:0] p_d_1;
    reg signed [31:0] p_d_2;
    reg signed [31:0] p_d_3;

    wire signed [31:0] m_0;
    wire signed [31:0] m_1;
    wire signed [31:0] m_2;
    wire signed [31:0] m_3;

    wire signed [31:0] p_0;
    wire signed [31:0] p_1;
    wire signed [31:0] p_2;
    wire signed [31:0] p_3;

    assign m_0 = a_d_0 * b_d_0;
    assign m_1 = a_d_1 * b_d_1;
    assign m_2 = a_d_2 * b_d_2;
    assign m_3 = a_d_3 * b_d_3;

    assign p_0 = m_d_0;
    assign p_1 = m_d_1 + p_d_0;
    assign p_2 = m_d_2 + p_d_1;
    assign p_3 = m_d_3 + p_d_2;

    assign p_out = p_d_3;

    always@(posedge clk) begin
        if(ena_0) begin
            a_0 <= a;
        end
        if(ena_1) begin
            a_1 <= a_0;
        end
        if(ena_2) begin
            a_2 <= a_1;
        end
        if(ena_3) begin
            a_3 <= a_2;
        end
    end

    always@(posedge clk) begin
        if(ena_d_0) begin
            a_d_0 <= a_0;
        end
        if(ena_d_1) begin
            a_d_1 <= a_1;
        end
        if(ena_d_2) begin
            a_d_2 <= a_2;
        end
        if(ena_d_3) begin
            a_d_3 <= a_3;
        end
    end

    always@(posedge clk) begin
        b_d_0 <= b_0;
        b_d_1 <= b_1;
        b_d_2 <= b_2;
        b_d_3 <= b_3;
    end

    always@(posedge clk) begin
        m_d_0 <= m_0;
        m_d_1 <= m_1;
        m_d_2 <= m_2;
        m_d_3 <= m_3;
    end

    always@(posedge clk) begin
        p_d_0 <= p_0;
        p_d_1 <= p_1;
        p_d_2 <= p_2;
        p_d_3 <= p_3;
    end



endmodule
