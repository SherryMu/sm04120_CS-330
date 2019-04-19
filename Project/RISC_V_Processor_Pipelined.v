module RISC_V_Processor_Pipelined
(
  input wire clk, reset
);

  wire Branch;
  wire MemRead;
  wire MemtoReg;
  wire [1:0] ALUOp;
  wire MemWrite;
  wire ALUSrc;
  wire RegWrite;

  wire [63:0] out1;
  wire [63:0] PC_Out;
  wire [31:0] Instruction;
  wire [63:0] out2;
  wire [63:0] out3;
  //assign out3 = 0;
  wire [63:0] imm_data;
  
  wire [63:0] Result;
  wire Zero;
  
  wire [63:0] WriteData;
  
  wire [63:0]if_id_pc_out;
  wire [31:0]if_id_im_out;
  
  wire [63:0]id_ex_pc_out;
  wire [63:0]id_ex_imm_data_out;
  wire [63:0]id_ex_read_data1_out;
  wire [63:0]id_ex_read_data2_out;
  wire [4:0]id_ex_rs1_out;
  wire [4:0]id_ex_rs2_out;
  wire [4:0]id_ex_rd_out;
  wire [3:0]id_ex_funct4_out;
  wire [1:0]id_ex_wb_out;
  wire [2:0]id_ex_m_out;
  wire [2:0]id_ex_ex_out;
  
  wire [63:0]tbmout;
  wire [63:0]tbmout2;
  
  wire [1:0] ForwardA;
  wire [1:0] ForwardB;
  
  wire [1:0] ex_mem_wb_out;
  wire [2:0] ex_mem_m_out;
  wire [63:0] ex_mem_adder_out_out;
  wire [63:0] ex_mem_alu_result_out;
  wire [63:0] ex_mem_mux_out;
  wire [4:0] ex_mem_rd_out;
  wire ex_mem_zero_out;
  Adder add1
  (
    .a(PC_Out),
    .b(64'd4),
    .out(out1)
  );
  Adder add2
  (
    .a(id_ex_pc_out),
    .b({id_ex_imm_data_out*2}),
    .out(out2)
  );
  Mux mux1
  (
    .a(out1),
    .b(ex_mem_adder_out_out),
    .sel(ex_mem_m_out[0] & ex_mem_zero_out),
    .data(out3)
  );
  Program_Counter pc
  (
    .clk(clk),
    .reset(reset),
    .PC_In(out3),
    .PC_Out(PC_Out)
  );
  Instruction_Memory im
  (
    .Inst_Address(PC_Out),
    .Instruction(Instruction)
  );
  wire [6:0] opcode;
  wire [4:0] rd;
  wire [2:0] funct3;
  wire [4:0] rs1;
  wire [4:0] rs2;
  wire [6:0] funct7;
  instructionParser ip
  (
    .instruction(if_id_im_out),
    .opcode(opcode),
    .rd(rd),
    .funct3(funct3),
    .rs1(rs1),
    .rs2(rs2),
    .funct7(funct7)
  );
  
  
  Control_Unit cu
  (
    .Opcode(opcode),
    .Branch(Branch),
    .MemRead(MemRead),
    .MemtoReg(MemtoReg),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite),
    .ALUOp(ALUOp)
  );
  
  IDG idg
  (
    .instruction(if_id_im_out),
    .imm_data(imm_data)
  );
  wire [63:0] ReadData1;
  wire [63:0] ReadData2;
  registerFile rf
  (
    .WriteData(WriteData),
    .RS1(rs1),
    .RS2(rs2),
    .RD(rd),
    .ReadData1(ReadData1),
    .ReadData2(ReadData2),
    .clk(clk),
    .reset(reset),
    .RegWrite(RegWrite)
  );
  wire [63:0] b;
  Mux mux2
  (
    .a(tbmout2),
    .b(id_ex_imm_data_out),
    .sel(id_ex_ex_out[2]),
    .data(b)
  );
  wire [3:0] Operation;
  ALU_Control ac
  (
    .ALUOp(id_ex_ex_out[1:0]),
    .Funct(),
    .Operation(Operation)
  );
  
  ALU_64_bit alu
  (
    .a(tbmout1),
    .b(b),
    .ALUOp(Operation),
    .Result(Result),
    .Zero(Zero)
  );
  wire [63:0] Read_Data;
  Data_Memory dm
  (
    .Mem_Addr(Result),
    .Write_Data(ReadData2),
    .clk(clk),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .Read_Data(Read_Data)
  );
  
  Mux mux3
  (
    .b(Read_Data),
    .a(Result),
    .sel(MemtoReg),
    .data(WriteData)
  );
  IF_ID if_id
  (
    .pc_in(PC_Out),
    .clk(clk),
    .im_in(Instuction),
    .pc_out(if_id_pc_out),
    .im_out(if_id_im_out)
  );
  
  ID_EX id_ex
  (
    .pc_in(if_id_pc_out),
    .imm_data_in(imm_data),
    .read_data1_in(ReadData1),
    .read_data2_in(ReadData2),
    .rs1_in(rs1),
    .rs2_in(rs2),
    .rd_in(rd),
    .funct4_in({Instruction[30],Instruction[14:12]}),
    .wb_in({{RegWrite},{MemtoReg}}),
    .m_in({{MemRead},{MemWrite},{Branch}}),
    .ex_in({{ALUSrc},{ALUOp}}),
    .clk(clk),
    .pc_out(id_ex_pc_out),
    .imm_data_out(id_ex_imm_data_out),
    .read_data1_out(id_ex_read_data1_out),
    .read_data2_out(id_ex_read_data2_out),
    .rs1_out(id_ex_rs1_out),
    .rs2_out(id_ex_rs2_out),
    .rd_out(id_ex_rd_out),
    .funct4_out(id_ex_funct4_out),
    .wb_out(id_ex_wb_out),
    .m_out(id_ex_m_out),
    .ex_out(id_ex_ex_out)
    );
    three_bit_Mux tbm
    (
      .a(id_ex_read_data1_out),
      .b()
      .c(ex_mem_alu_result_out)
      .sel(ForwardA)
      .data(tbmout)
    );
    three_bit_Mux tbm2
    (
      .a(id_ex_read_data2_out),
      .b()
      .c(ex_mem_alu_result_out)
      .sel(ForwardB)
      .data(tbmout2)
    );
    Forwarding_Unit fu
    (
      .rd_from_mem(ex_mem_rd_out),
      .rd_from_wb(),
      .Regwrite_from_mem(ex_mem_wb_out[1]),
      .Regwrite_from_wb(),
      .rs1_from_ex(id_ex_rs1_out),
      .rs2_from_ex(id_ex_rs2_out),
  
      .mux_to_rs1(ForwardA),
      .mux_to_rs2(ForwardB)
    );
    EX_MEM ex_mem
    (
      .wb_in(id_ex_wb_out),
      .m_in(id_ex_m_out),
      .adder_out_in(out2),
      .alu_result_in(Result),
      .mux_in(tbmout2),
      .rd_in(id_ex_rd_out),
      .clk(clk),
      .Zero(Zero)
      .wb_out(ex_mem_wb_out),
      .m_out(ex_mem_m_out),
      .adder_out_out(ex_mem_adder_out_out),
      .alu_result_out(ex_mem_alu_result_out),
      .mux_out(ex_mem_mux_out),
      .rd_out(ex_mem_rd_out);
      .Zero_out(ex_mem_zero_out)
    );
endmodule