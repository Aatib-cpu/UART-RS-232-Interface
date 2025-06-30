module uart_top(
input   clk_in,
input   i_RX_Serial,
input   reset,
output  o_TX_Serial,
output  o_TX_Done,
output  o_TX_Active,
output  full,
output  empty
);

localparam IDLE  =2'b00;
localparam RW    =2'b11;


wire [7:0]  Byte;
wire [7:0]  fifo_out;
wire        DV;
reg [1:0]   state =0;
reg         w_en  =0;
reg         r_en  =0;

always@(posedge clk_in) begin
	case(state)
		IDLE: begin
			w_en <= 0;
			r_en <= 0;
			if(DV) begin
				if(Byte == 8'h72) begin
					state <= RW;
					r_en  <= 1;
				end
				else begin
					state <= RW;
					w_en  <= 1;
				end
			end
		end

		RW: begin
			r_en  <= 0;
			w_en  <= 0;
			state <= IDLE;
		end
		default:
			state <= IDLE;
	endcase
end




uart_rx RX1 (.i_Clock(clk_in), .i_RX_Serial(i_RX_Serial), .o_RX_DV(DV), .o_RX_Byte(Byte));
uart_tx TX1 (.i_Clock(clk_in), .i_TX_DV(r_en), .i_TX_Byte(fifo_out), .o_TX_Active(o_TX_Active), .o_TX_Serial(o_TX_Serial), .o_TX_Done(o_TX_Done));
FIFO    F1  (.din(Byte), .clk(clk_in), .rst(reset), .dout(fifo_out), .wen(w_en), .ren(r_en), .full(full), .empty(empty));
endmodule
