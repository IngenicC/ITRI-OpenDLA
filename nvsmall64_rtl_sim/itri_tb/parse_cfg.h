#define TRUE 1
#define FALSE 0
#define MAX_FILE_NAME_LEN 200
#define MAX_STRING_LEN 2000

void getArgsToTask(vpiHandle taskH, char file_name[MAX_FILE_NAME_LEN]);
unsigned int my_atoi(char *var);
int search_reg_name(char *grp_name, char *reg_name);
int mem_init(char *arg1, char *arg2, char *arg3, char *arg4);
int mem_load(char *arg1, char *arg2, char *arg3);
void parse_cfg();
void register_my_systfs();

#define ITRI_BDMA

#define PRI_MEM_ADDR  0x80000000
//#define SEC_MEM_ADDR  0x50000000
#define SEC_MEM_ADDR  0x00000000

#define GLB_ADDR      0x00001000
#define MCIF_ADDR     0x00002000
#define CDMA_ADDR     0x00003000
#define CSC_ADDR      0x00004000
#define CMAC_A_ADDR   0x00005000
#define CMAC_B_ADDR   0x00006000
#define CACC_ADDR     0x00007000
#define SDP_RDMA_ADDR 0x00008000
#define SDP_ADDR      0x00009000
#define PDP_RDMA_ADDR 0x0000a000
#define PDP_ADDR      0x0000b000
#define CDP_RDMA_ADDR 0x0000c000
#define CDP_ADDR      0x0000d000
//#define GEC_ADDR      0x0000e000
#define CVIF_ADDR     0x0000f000
#define BDMA_ADDR     0x00010000
#define RBK_ADDR      0x00011000

#define CMD_REG_WRITE     0x00
#define CMD_REG_READ      0x10
#define CMD_REG_READ_EXP  0x20
#define CMD_POLL_REG      0x30
#define CMD_SYNC_WAIT     0x40
#define CMD_SYNC_NOTIFY   0x50
#define CMD_INTR_NOTIFY   0x60
#define CMD_CHECK_NOTHING 0x70
#define CMD_CHECK_CRC     0x80
#define CMD_CHECK_FILE    0x90
#define CMD_POLL_FIELD    0xa0

#define COND_EQUAL        0x00
#define COND_GREATER      0x01
#define COND_LESS         0x02
#define COND_NOT_EQUAL    0x03
#define COND_NOT_GREATER  0x04
#define COND_NOT_LESS     0x05

typedef struct intr_sync_map{
    int sync_id;
    int intr_src;
    char sync_name[60];
    struct intr_sync_map *next_node;
}intr_sync_map;

typedef const struct{
    int offset;
    char name[30];
}reg_map;

// ----------------------------------------------------------------------------
//  intr is not a register list, it is bit position of glb.s_intr_status
// ----------------------------------------------------------------------------
reg_map intr[]={{0x00, "SDP_0"},
                {0x01, "SDP_1"},
                {0x02, "CDP_0"},
                {0x03, "CDP_1"},
                {0x04, "PDP_0"},
                {0x05, "PDP_1"},
                {0x06, "BDMA_0"},
                {0x07, "BDMA_1"},
                {0x08, "RUBIK_0"},
                {0x09, "RUBIK_1"},
                {0x10, "CDMA_DAT_0"},
                {0x11, "CDMA_DAT_1"},
                {0x12, "CDMA_WT_0"},
                {0x13, "CDMA_WT_1"},
                {0x14, "CACC_0"},
                {0x15, "CACC_1"}};

// ----------------------------------------------------------------------------
//  register lists: GLB
// ----------------------------------------------------------------------------
reg_map glb[]={{0x0000, "S_NVDLA_HW_VERSION"},
               {0x0004, "S_INTR_MASK"},
               {0x0008, "S_INTR_SET"},
               {0x000c, "S_INTR_STATUS"}};

// ----------------------------------------------------------------------------
//  register lists: MCIF
// ----------------------------------------------------------------------------
reg_map mcif[]={{0x0000, "CFG_RD_WEIGHT_0"},
                {0x0004, "CFG_RD_WEIGHT_1"},
                {0x0008, "CFG_RD_WEIGHT_2"},
                {0x000c, "CFG_WR_WEIGHT_0"},
                {0x0010, "CFG_WR_WEIGHT_1"},
                {0x0014, "CFG_OUTSTANDING_CNT"},
                {0x0018, "STATUS"}};

// ----------------------------------------------------------------------------
//  register lists: CDMA
// ----------------------------------------------------------------------------
reg_map cdma[]={{0x0000, "S_STATUS"},
                {0x0004, "S_POINTER"},
                {0x0008, "S_ARBITER"},
                {0x000c, "S_CBUF_FLUSH_STATUS"},
                {0x0010, "D_OP_ENABLE"},
                {0x0014, "D_MISC_CFG"},
                {0x0018, "D_DATAIN_FORMAT"},
                {0x001c, "D_DATAIN_SIZE_0"},
                {0x0020, "D_DATAIN_SIZE_1"},
                {0x0024, "D_DATAIN_SIZE_EXT_0"},
                {0x0028, "D_PIXEL_OFFSET"},
                {0x002c, "D_DAIN_RAM_TYPE"},
                {0x0030, "D_DAIN_ADDR_HIGH_0"},
                {0x0034, "D_DAIN_ADDR_LOW_0"},
                {0x0038, "D_DAIN_ADDR_HIGH_1"},
                {0x003c, "D_DAIN_ADDR_LOW_1"},
                {0x0040, "D_LINE_STRIDE"},
                {0x0044, "D_LINE_UV_STRIDE"},
                {0x0048, "D_SURF_STRIDE"},
                {0x004c, "D_DAIN_MAP"},
                {0x0050, "D_RESERVED_X_CFG"},
                {0x0054, "D_RESERVED_Y_CFG"},
                {0x0058, "D_BATCH_NUMBER"},
                {0x005c, "D_BATCH_STRIDE"},
                {0x0060, "D_ENTRY_PER_SLICE"},
                {0x0064, "D_FETCH_GRAIN"},
                {0x0068, "D_WEIGHT_FORMAT"},
                {0x006c, "D_WEIGHT_SIZE_0"},
                {0x0070, "D_WEIGHT_SIZE_1"},
                {0x0074, "D_WEIGHT_RAM_TYPE"},
                {0x0078, "D_WEIGHT_ADDR_HIGH"},
                {0x007c, "D_WEIGHT_ADDR_LOW"},
                {0x0080, "D_WEIGHT_BYTES"},
                {0x0084, "D_WGS_ADDR_HIGH"},
                {0x0088, "D_WGS_ADDR_LOW"},
                {0x008c, "D_WMB_ADDR_HIGH"},
                {0x0090, "D_WMB_ADDR_LOW"},
                {0x0094, "D_WMB_BYTES"},
                {0x0098, "D_MEAN_FORMAT"},
                {0x009c, "D_MEAN_GLOBAL_0"},
                {0x00a0, "D_MEAN_GLOBAL_1"},
                {0x00a4, "D_CVT_CFG"},
                {0x00a8, "D_CVT_OFFSET"},
                {0x00ac, "D_CVT_SCALE"},
                {0x00b0, "D_CONV_STRIDE"},
                {0x00b4, "D_ZERO_PADDING"},
                {0x00b8, "D_ZERO_PADDING_VALUE"},
                {0x00bc, "D_BANK"},
                {0x00c0, "D_NAN_FLUSH_TO_ZERO"},
                {0x00c4, "D_NAN_INPUT_DATA_NUM"},
                {0x00c8, "D_NAN_INPUT_WEIGHT_NUM"},
                {0x00cc, "D_INF_INPUT_DATA_NUM"},
                {0x00d0, "D_INF_INPUT_WEIGHT_NUM"},
                {0x00d4, "D_PERF_ENABLE"},
                {0x00d8, "D_PERF_DAT_READ_STALL"},
                {0x00dc, "D_PERF_WT_READ_STALL"},
                {0x00e0, "D_PERF_DAT_READ_LATENCY"},
                {0x00e4, "D_PERF_WT_READ_LATENCY"},
                {0x00e8, "D_CYA"}};

// ----------------------------------------------------------------------------
//  register lists: CSC
// ----------------------------------------------------------------------------
reg_map csc[]={{0x0000, "S_STATUS"},
               {0x0004, "S_POINTER"},
               {0x0008, "D_OP_ENABLE"},
               {0x000c, "D_MISC_CFG"},
               {0x0010, "D_DATAIN_FORMAT"},
               {0x0014, "D_DATAIN_SIZE_EXT_0"},
               {0x0018, "D_DATAIN_SIZE_EXT_1"},
               {0x001c, "D_BATCH_NUMBER"},
               {0x0020, "D_POST_Y_EXTENSION"},
               {0x0024, "D_ENTRY_PER_SLICE"},
               {0x0028, "D_WEIGHT_FORMAT"},
               {0x002c, "D_WEIGHT_SIZE_EXT_0"},
               {0x0030, "D_WEIGHT_SIZE_EXT_1"},
               {0x0034, "D_WEIGHT_BYTES"},
               {0x0038, "D_WMB_BYTES"},
               {0x003c, "D_DATAOUT_SIZE_0"},
               {0x0040, "D_DATAOUT_SIZE_1"},
               {0x0044, "D_ATOMICS"},
               {0x0048, "D_RELEASE"},
               {0x004c, "D_CONV_STRIDE_EXT"},
               {0x0050, "D_DILATION_EXT"},
               {0x0054, "D_ZERO_PADDING"},
               {0x0058, "D_ZERO_PADDING_VALUE"},
               {0x005c, "D_BANK"},
               {0x0060, "D_PRA_CFG"},
               {0x0064, "D_CYA"}};

// ----------------------------------------------------------------------------
//  register lists: CMAC_A
// ----------------------------------------------------------------------------
reg_map cmac_a[]={{0x0000, "S_STATUS"},
                  {0x0004, "S_POINTER"},
                  {0x0008, "D_OP_ENABLE"},
                  {0x000c, "D_MISC_CFG"}};

// ----------------------------------------------------------------------------
//  register lists: CMAC_B
// ----------------------------------------------------------------------------
reg_map cmac_b[]={{0x0000, "S_STATUS"},
                  {0x0004, "S_POINTER"},
                  {0x0008, "D_OP_ENABLE"},
                  {0x000c, "D_MISC_CFG"}};

// ----------------------------------------------------------------------------
//  register lists: CACC
// ----------------------------------------------------------------------------
reg_map cacc[]={
               {0x0000, "S_STATUS"},
               {0x0004, "S_POINTER"},
               {0x0008, "D_OP_ENABLE"},
               {0x000c, "D_MISC_CFG"},
               {0x0010, "D_DATAOUT_SIZE_0"},
               {0x0014, "D_DATAOUT_SIZE_1"},
               {0x0018, "D_DATAOUT_ADDR"},
               {0x001c, "D_BATCH_NUMBER"},
               {0x0020, "D_LINE_STRIDE"},
               {0x0024, "D_SURF_STRIDE"},
               {0x0028, "D_DATAOUT_MAP"},
               {0x002c, "D_CLIP_CFG"},
               {0x0030, "D_OUT_SATURATION"},
               {0x0034, "D_CYA"},
               {0x0038, "D_DW_WEIGHT_SIZE"},
               {0x003c, "D_DW_ACT_CFG"},
               {0x0040, "D_DW_ACT_BIAS"},
               {0x0044, "D_DW_ACT_SCALE"},
               {0x0048, "D_DW_CVT_OFFSET"},
               {0x004c, "D_DW_CVT_SCALE"},
               {0x0050, "D_DW_CVT_SHIFT"},
               {0x0054, "D_DW_RDMA_CFG"},
               {0x0058, "D_DW_RDMA_BASE_ADDR_LOW"},
               {0x005c, "D_DW_RDMA_BASE_ADDR_HIGH"},
               {0x0060, "D_DW_DST_RAM_CFG"}
       ,{0x0064, "D_DW_DEBUG_0"}
       ,{0x0068, "D_DW_DEBUG_1"}
       ,{0x006c, "D_DW_DEBUG_2"}
       ,{0x0070, "D_DW_DEBUG_3"}
};

// ----------------------------------------------------------------------------
//  register lists: SDP_RDMA
// ----------------------------------------------------------------------------
reg_map sdp_rdma[]={{0x0000, "S_STATUS"},
                    {0x0004, "S_POINTER"},
                    {0x0008, "D_OP_ENABLE"},
                    {0x000c, "D_DATA_CUBE_WIDTH"},
                    {0x0010, "D_DATA_CUBE_HEIGHT"},
                    {0x0014, "D_DATA_CUBE_CHANNEL"},
                    {0x0018, "D_SRC_BASE_ADDR_LOW"},
                    {0x001c, "D_SRC_BASE_ADDR_HIGH"},
                    {0x0020, "D_SRC_LINE_STRIDE"},
                    {0x0024, "D_SRC_SURFACE_STRIDE"},
                    {0x0028, "D_BRDMA_CFG"},
                    {0x002c, "D_BS_BASE_ADDR_LOW"},
                    {0x0030, "D_BS_BASE_ADDR_HIGH"},
                    {0x0034, "D_BS_LINE_STRIDE"},
                    {0x0038, "D_BS_SURFACE_STRIDE"},
                    {0x003c, "D_BS_BATCH_STRIDE"},
                    {0x0040, "D_NRDMA_CFG"},
                    {0x0044, "D_BN_BASE_ADDR_LOW"},
                    {0x0048, "D_BN_BASE_ADDR_HIGH"},
                    {0x004c, "D_BN_LINE_STRIDE"},
                    {0x0050, "D_BN_SURFACE_STRIDE"},
                    {0x0054, "D_BN_BATCH_STRIDE"},
                    {0x0058, "D_ERDMA_CFG"},
                    {0x005c, "D_EW_BASE_ADDR_LOW"},
                    {0x0060, "D_EW_BASE_ADDR_HIGH"},
                    {0x0064, "D_EW_LINE_STRIDE"},
                    {0x0068, "D_EW_SURFACE_STRIDE"},
                    {0x006c, "D_EW_BATCH_STRIDE"},
                    {0x0070, "D_FEATURE_MODE_CFG"},
                    {0x0074, "D_SRC_DMA_CFG"},
                    {0x0078, "D_STATUS_NAN_INPUT_NUM"},
                    {0x007c, "D_STATUS_INF_INPUT_NUM"},
                    {0x0080, "D_PERF_ENABLE"},
                    {0x0084, "D_PERF_MRDMA_READ_STALL"},
                    {0x0088, "D_PERF_BRDMA_READ_STALL"},
                    {0x008c, "D_PERF_NRDMA_READ_STALL"},
                    {0x0090, "D_PERF_ERDMA_READ_STALL"}};

// ----------------------------------------------------------------------------
//  register lists: SDP
// ----------------------------------------------------------------------------
reg_map sdp[]={{0x0000, "S_STATUS"},
               {0x0004, "S_POINTER"},
               {0x0008, "S_LUT_ACCESS_CFG"},
               {0x000c, "S_LUT_ACCESS_DATA"},
               {0x0010, "S_LUT_CFG"},
               {0x0014, "S_LUT_INFO"},
               {0x0018, "S_LUT_LE_START"},
               {0x001c, "S_LUT_LE_END"},
               {0x0020, "S_LUT_LO_START"},
               {0x0024, "S_LUT_LO_END"},
               {0x0028, "S_LUT_LE_SLOPE_SCALE"},
               {0x002c, "S_LUT_LE_SLOPE_SHIFT"},
               {0x0030, "S_LUT_LO_SLOPE_SCALE"},
               {0x0034, "S_LUT_LO_SLOPE_SHIFT"},
               {0x0038, "D_OP_ENABLE"},
               {0x003c, "D_DATA_CUBE_WIDTH"},
               {0x0040, "D_DATA_CUBE_HEIGHT"},
               {0x0044, "D_DATA_CUBE_CHANNEL"},
               {0x0048, "D_DST_BASE_ADDR_LOW"},
               {0x004c, "D_DST_BASE_ADDR_HIGH"},
               {0x0050, "D_DST_LINE_STRIDE"},
               {0x0054, "D_DST_SURFACE_STRIDE"},
               {0x0058, "D_DP_BS_CFG"},
               {0x005c, "D_DP_BS_ALU_CFG"},
               {0x0060, "D_DP_BS_ALU_SRC_VALUE"},
               {0x0064, "D_DP_BS_MUL_CFG"},
               {0x0068, "D_DP_BS_MUL_SRC_VALUE"},
               {0x006c, "D_DP_BN_CFG"},
               {0x0070, "D_DP_BN_ALU_CFG"},
               {0x0074, "D_DP_BN_ALU_SRC_VALUE"},
               {0x0078, "D_DP_BN_MUL_CFG"},
               {0x007c, "D_DP_BN_MUL_SRC_VALUE"},
               {0x0080, "D_DP_EW_CFG"},
               {0x0084, "D_DP_EW_ALU_CFG"},
               {0x0088, "D_DP_EW_ALU_SRC_VALUE"},
               {0x008c, "D_DP_EW_ALU_CVT_OFFSET_VALUE"},
               {0x0090, "D_DP_EW_ALU_CVT_SCALE_VALUE"},
               {0x0094, "D_DP_EW_ALU_CVT_TRUNCATE_VALUE"},
               {0x0098, "D_DP_EW_MUL_CFG"},
               {0x009c, "D_DP_EW_MUL_SRC_VALUE"},
               {0x00a0, "D_DP_EW_MUL_CVT_OFFSET_VALUE"},
               {0x00a4, "D_DP_EW_MUL_CVT_SCALE_VALUE"},
               {0x00a8, "D_DP_EW_MUL_CVT_TRUNCATE_VALUE"},
               {0x00ac, "D_DP_EW_TRUNCATE_VALUE"},
               {0x00b0, "D_FEATURE_MODE_CFG"},
               {0x00b4, "D_DST_DMA_CFG"},
               {0x00b8, "D_DST_BATCH_STRIDE"},
               {0x00bc, "D_DATA_FORMAT"},
               {0x00c0, "D_CVT_OFFSET"},
               {0x00c4, "D_CVT_SCALE"},
               {0x00c8, "D_CVT_SHIFT"},
               {0x00cc, "D_STATUS"},
               {0x00d0, "D_STATUS_NAN_INPUT_NUM"},
               {0x00d4, "D_STATUS_INF_INPUT_NUM"},
               {0x00d8, "D_STATUS_NAN_OUTPUT_NUM"},
               {0x00dc, "D_PERF_ENABLE"},
               {0x00e0, "D_PERF_WDMA_WRITE_STALL"},
               {0x00e4, "D_PERF_LUT_UFLOW"},
               {0x00e8, "D_PERF_LUT_OFLOW"},
               {0x00ec, "D_PERF_OUT_SATURATION"},
               {0x00f0, "D_PERF_LUT_HYBRID"},
               {0x00f4, "D_PERF_LUT_LE_HIT"},
               {0x00f8, "D_PERF_LUT_LO_HIT"}};

// ----------------------------------------------------------------------------
//  register lists: PDP_RDMA
// ----------------------------------------------------------------------------
reg_map pdp_rdma[]={{0x0000, "S_STATUS"},
                    {0x0004, "S_POINTER"},
                    {0x0008, "D_OP_ENABLE"},
                    {0x000c, "D_DATA_CUBE_IN_WIDTH"},
                    {0x0010, "D_DATA_CUBE_IN_HEIGHT"},
                    {0x0014, "D_DATA_CUBE_IN_CHANNEL"},
                    {0x0018, "D_FLYING_MODE"},
                    {0x001c, "D_SRC_BASE_ADDR_LOW"},
                    {0x0020, "D_SRC_BASE_ADDR_HIGH"},
                    {0x0024, "D_SRC_LINE_STRIDE"},
                    {0x0028, "D_SRC_SURFACE_STRIDE"},
                    {0x002c, "D_SRC_RAM_CFG"},
                    {0x0030, "D_DATA_FORMAT"},
                    {0x0034, "D_OPERATION_MODE_CFG"},
                    {0x0038, "D_POOLING_KERNEL_CFG"},
                    {0x003c, "D_POOLING_PADDING_CFG"},
                    {0x0040, "D_PARTIAL_WIDTH_IN"},
                    {0x0044, "D_PERF_ENABLE"},
                    {0x0048, "D_PERF_READ_STALL"},
                    {0x004c, "D_CYA"}};

// ----------------------------------------------------------------------------
//  register lists: PDP
// ----------------------------------------------------------------------------
reg_map pdp[]={{0x0000, "S_STATUS"},
               {0x0004, "S_POINTER"},
               {0x0008, "D_OP_ENABLE"},
               {0x000c, "D_DATA_CUBE_IN_WIDTH"},
               {0x0010, "D_DATA_CUBE_IN_HEIGHT"},
               {0x0014, "D_DATA_CUBE_IN_CHANNEL"},
               {0x0018, "D_DATA_CUBE_OUT_WIDTH"},
               {0x001c, "D_DATA_CUBE_OUT_HEIGHT"},
               {0x0020, "D_DATA_CUBE_OUT_CHANNEL"},
               {0x0024, "D_OPERATION_MODE_CFG"},
               {0x0028, "D_NAN_FLUSH_TO_ZERO"},
               {0x002c, "D_PARTIAL_WIDTH_IN"},
               {0x0030, "D_PARTIAL_WIDTH_OUT"},
               {0x0034, "D_POOLING_KERNEL_CFG"},
               {0x0038, "D_RECIP_KERNEL_WIDTH"},
               {0x003c, "D_RECIP_KERNEL_HEIGHT"},
               {0x0040, "D_POOLING_PADDING_CFG"},
               {0x0044, "D_POOLING_PADDING_VALUE_1_CFG"},
               {0x0048, "D_POOLING_PADDING_VALUE_2_CFG"},
               {0x004c, "D_POOLING_PADDING_VALUE_3_CFG"},
               {0x0050, "D_POOLING_PADDING_VALUE_4_CFG"},
               {0x0054, "D_POOLING_PADDING_VALUE_5_CFG"},
               {0x0058, "D_POOLING_PADDING_VALUE_6_CFG"},
               {0x005c, "D_POOLING_PADDING_VALUE_7_CFG"},
               {0x0060, "D_SRC_BASE_ADDR_LOW"},
               {0x0064, "D_SRC_BASE_ADDR_HIGH"},
               {0x0068, "D_SRC_LINE_STRIDE"},
               {0x006c, "D_SRC_SURFACE_STRIDE"},
               {0x0070, "D_DST_BASE_ADDR_LOW"},
               {0x0074, "D_DST_BASE_ADDR_HIGH"},
               {0x0078, "D_DST_LINE_STRIDE"},
               {0x007c, "D_DST_SURFACE_STRIDE"},
               {0x0080, "D_DST_RAM_CFG"},
               {0x0084, "D_DATA_FORMAT"},
               {0x0088, "D_INF_INPUT_NUM"},
               {0x008c, "D_NAN_INPUT_NUM"},
               {0x0090, "D_NAN_OUTPUT_NUM"},
               {0x0094, "D_PERF_ENABLE"},
               {0x0098, "D_PERF_WRITE_STALL"},
               {0x009c, "D_CYA"}};

// ----------------------------------------------------------------------------
//  register lists: CDP_RDMA
// ----------------------------------------------------------------------------
reg_map cdp_rdma[]={{0x0000, "S_STATUS"},
                    {0x0004, "S_POINTER"},
                    {0x0008, "D_OP_ENABLE"},
                    {0x000c, "D_DATA_CUBE_WIDTH"},
                    {0x0010, "D_DATA_CUBE_HEIGHT"},
                    {0x0014, "D_DATA_CUBE_CHANNEL"},
                    {0x0018, "D_SRC_BASE_ADDR_LOW"},
                    {0x001c, "D_SRC_BASE_ADDR_HIGH"},
                    {0x0020, "D_SRC_LINE_STRIDE"},
                    {0x0024, "D_SRC_SURFACE_STRIDE"},
                    {0x0028, "D_SRC_DMA_CFG"},
                    {0x002c, "D_SRC_COMPRESSION_EN"},
                    {0x0030, "D_OPERATION_MODE"},
                    {0x0034, "D_DATA_FORMAT"},
                    {0x0038, "D_PERF_ENABLE"},
                    {0x003c, "D_PERF_READ_STALL"},
                    {0x0040, "D_CYA"}};

// ----------------------------------------------------------------------------
//  register lists: CDP
// ----------------------------------------------------------------------------
reg_map cdp[]={{0x0000, "S_STATUS"},
               {0x0004, "S_POINTER"},
               {0x0008, "S_LUT_ACCESS_CFG"},
               {0x000c, "S_LUT_ACCESS_DATA"},
               {0x0010, "S_LUT_CFG"},
               {0x0014, "S_LUT_INFO"},
               {0x0018, "S_LUT_LE_START_LOW"},
               {0x001c, "S_LUT_LE_START_HIGH"},
               {0x0020, "S_LUT_LE_END_LOW"},
               {0x0024, "S_LUT_LE_END_HIGH"},
               {0x0028, "S_LUT_LO_START_LOW"},
               {0x002c, "S_LUT_LO_START_HIGH"},
               {0x0030, "S_LUT_LO_END_LOW"},
               {0x0034, "S_LUT_LO_END_HIGH"},
               {0x0038, "S_LUT_LE_SLOPE_SCALE"},
               {0x003c, "S_LUT_LE_SLOPE_SHIFT"},
               {0x0040, "S_LUT_LO_SLOPE_SCALE"},
               {0x0044, "S_LUT_LO_SLOPE_SHIFT"},
               {0x0048, "D_OP_ENABLE"},
               {0x004c, "D_FUNC_BYPASS"},
               {0x0050, "D_DST_BASE_ADDR_LOW"},
               {0x0054, "D_DST_BASE_ADDR_HIGH"},
               {0x0058, "D_DST_LINE_STRIDE"},
               {0x005c, "D_DST_SURFACE_STRIDE"},
               {0x0060, "D_DST_DMA_CFG"},
               {0x0064, "D_DST_COMPRESSION_EN"},
               {0x0068, "D_DATA_FORMAT"},
               {0x006c, "D_NAN_FLUSH_TO_ZERO"},
               {0x0070, "D_LRN_CFG"},
               {0x0074, "D_DATIN_OFFSET"},
               {0x0078, "D_DATIN_SCALE"},
               {0x007c, "D_DATIN_SHIFTER"},
               {0x0080, "D_DATOUT_OFFSET"},
               {0x0084, "D_DATOUT_SCALE"},
               {0x0088, "D_DATOUT_SHIFTER"},
               {0x008c, "D_NAN_INPUT_NUM"},
               {0x0090, "D_INF_INPUT_NUM"},
               {0x0094, "D_NAN_OUTPUT_NUM"},
               {0x0098, "D_OUT_SATURATION"},
               {0x009c, "D_PERF_ENABLE"},
               {0x00a0, "D_PERF_WRITE_STALL"},
               {0x00a4, "D_PERF_LUT_UFLOW"},
               {0x00a8, "D_PERF_LUT_OFLOW"},
               {0x00ac, "D_PERF_LUT_HYBRID"},
               {0x00b0, "D_PERF_LUT_LE_HIT"},
               {0x00b4, "D_PERF_LUT_LO_HIT"},
               {0x00b8, "D_CYA"}};

// ----------------------------------------------------------------------------
//  register lists: GEC
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
//  register lists: CVIF
// ----------------------------------------------------------------------------
reg_map cvif[]={{0x0000, "CFG_RD_WEIGHT_0"},
                {0x0004, "CFG_RD_WEIGHT_1"},
                {0x0008, "CFG_RD_WEIGHT_2"},
                {0x000c, "CFG_WR_WEIGHT_0"},
                {0x0010, "CFG_WR_WEIGHT_1"},
                {0x0014, "CFG_OUTSTANDING_CNT"},
                {0x0018, "STATUS"}};

// ----------------------------------------------------------------------------
//  register lists: BDMA
// ----------------------------------------------------------------------------
#ifdef ITRI_BDMA
reg_map bdma[]={{0x0000, "S_STATUS"},
                {0x0004, "S_POINTER"},
                {0x0008, "D_CFG_SRC_ADDR_LOW"},
                {0x000c, "D_CFG_SRC_ADDR_HIGH"},
                {0x0010, "D_CFG_DST_ADDR_LOW"},
                {0x0014, "D_CFG_DST_ADDR_HIGH"},
                {0x0018, "D_CFG_LINE"},
                {0x001c, "D_CFG_CMD"},
                {0x0020, "D_CFG_LINE_REPEAT"},
                {0x0024, "D_CFG_SRC_LINE"},
                {0x0028, "D_CFG_DST_LINE"},
                {0x002c, "D_CFG_SURF_REPEAT"},
                {0x0030, "D_CFG_SRC_SURF"},
                {0x0034, "D_CFG_DST_SURF"},
                {0x0038, "D_UPSAMPLE_FACTOR"},
                {0x003c, "D_UPSAMPLE_CFG"},
                {0x0040, "D_OP_ENABLE"},
                {0x0044, "D_PERF_ENABLE"},
                {0x0048, "D_PERF_READ_STALL"},
                {0x004c, "D_PERF_WRITE_STALL"}};
#else
reg_map bdma[]={{0x0000, "CFG_SRC_ADDR_LOW"},
                {0x0004, "CFG_SRC_ADDR_HIGH"},
                {0x0008, "CFG_DST_ADDR_LOW"},
                {0x000c, "CFG_DST_ADDR_HIGH"},
                {0x0010, "CFG_LINE"},
                {0x0014, "CFG_CMD"},
                {0x0018, "CFG_LINE_REPEAT"},
                {0x001c, "CFG_SRC_LINE"},
                {0x0020, "CFG_DST_LINE"},
                {0x0024, "CFG_SURF_REPEAT"},
                {0x0028, "CFG_SRC_SURF"},
                {0x002c, "CFG_DST_SURF"},
                {0x0030, "CFG_OP"},
                {0x0034, "CFG_LAUNCH0"},
                {0x0038, "CFG_LAUNCH1"},
                {0x003c, "CFG_STATUS"},
                {0x0040, "STATUS"},
                {0x0044, "STATUS_GRP0_READ_STALL"},
                {0x0048, "STATUS_GRP0_WRITE_STALL"},
                {0x004c, "STATUS_GRP1_READ_STALL"},
                {0x0050, "STATUS_GRP1_WRITE_STALL"}};
#endif

// ----------------------------------------------------------------------------
//  register lists: RUBIK
// ----------------------------------------------------------------------------
reg_map rubik[]={{0x0000, "S_STATUS"},
                 {0x0004, "S_POINTER"},
                 {0x0008, "D_OP_ENABLE"},
                 {0x000c, "D_MISC_CFG"},
                 {0x0010, "D_DAIN_RAM_TYPE"},
                 {0x0014, "D_DATAIN_SIZE_0"},
                 {0x0018, "D_DATAIN_SIZE_1"},
                 {0x001c, "D_DAIN_ADDR_HIGH"},
                 {0x0020, "D_DAIN_ADDR_LOW"},
                 {0x0024, "D_DAIN_LINE_STRIDE"},
                 {0x0028, "D_DAIN_SURF_STRIDE"},
                 {0x002c, "D_DAIN_PLANAR_STRIDE"},
                 {0x0030, "D_DAOUT_RAM_TYPE"},
                 {0x0034, "D_DATAOUT_SIZE_1"},
                 {0x0038, "D_DAOUT_ADDR_HIGH"},
                 {0x003c, "D_DAOUT_ADDR_LOW"},
                 {0x0040, "D_DAOUT_LINE_STRIDE"},
                 {0x0044, "D_CONTRACT_STRIDE_0"},
                 {0x0048, "D_CONTRACT_STRIDE_1"},
                 {0x004c, "D_DAOUT_SURF_STRIDE"},
                 {0x0050, "D_DAOUT_PLANAR_STRIDE"},
                 {0x0054, "D_DECONV_STRIDE"},
                 {0x0058, "D_PERF_ENABLE"},
                 {0x005c, "D_PERF_READ_STALL"},
                 {0x0060, "D_PERF_WRITE_STALL"}};

