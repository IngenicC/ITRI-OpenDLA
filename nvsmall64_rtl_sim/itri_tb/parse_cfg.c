/* User app source file module_info.c */
//#define VCS

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "./vpi_user.h"
#ifndef VCS
#include "./vpi_user_cds.h"
#endif

#include "parse_cfg.h"

#define DEBUG 1

void register_check_systfs();
/*
#define TRUE 1
#define FALSE 0
#define MAX_FILE_NAME_LEN 200
#define MAX_STRING_LEN 200

void getArgsToTask(vpiHandle taskH, char file_name[MAX_FILE_NAME_LEN]);
int my_atoi(char *var);
int search_reg_name(char *grp_name, char *reg_name);
int mem_init(char *arg1, char *arg2, char *arg3, char *arg4);
void parse_cfg();
void register_my_systfs();
*/
void getArgsToTask(vpiHandle taskH, char file_name[MAX_FILE_NAME_LEN])
{
    char *strProp;
    vpiHandle argI, argH;
    s_vpi_value curr_value;
//    int len;

    strProp = vpi_get_str(vpiName,taskH);
    if (!strProp) return; /* Task should always have a name.*/
    vpi_printf("Arguments for task %s:\n",strProp);
    argI = vpi_iterate(vpiArgument,taskH);
    argH = vpi_scan(argI);

    if (argI){
        // file name
//                curr_value.format = vpiHexStrVal;
        curr_value.format = vpiStringVal;
        vpi_get_value(argH, &curr_value);
//                vpi_printf("==> %s \n", curr_value.value.str);
        strcpy(file_name, curr_value.value.str);
//        vpi_printf("==> %s \n", file_name);
/*
        // --------------------------------------------------------------------
        //  pri memory
        // --------------------------------------------------------------------
        if (!(argH = vpi_scan(argI))){
            vpi_printf("  No pri_mem\n");
            return;
        }
        if (vpi_get(vpiType, argH) != vpiMemory
        &&  vpi_get(vpiType, argH) != vpiRegArray){
            vpi_printf("  pri_mem wrong type!! type:%d\n", vpi_get(vpiType,argH));
        }

        pri_memH = argH;

        // --------------------------------------------------------------------
        //  sec memory
        // --------------------------------------------------------------------
        if (!(argH = vpi_scan(argI))){
            vpi_printf("  No sec_mem\n");
            return;
        }
        if (vpi_get(vpiType, argH) != vpiMemory
        &&  vpi_get(vpiType, argH) != vpiRegArray){
            vpi_printf("  sec_mem wrong type!! type:%d\n", vpi_get(vpiType,argH));
        }

        sec_memH = argH;
*/
//        len = vpi_get(vpiSize, argH);

//        vpi_printf("  pri_mem len = %x\n", len);

    }else{
        vpi_printf(" No arguments.\n"); /* There were no arguments */
    }
    return;
}

unsigned int my_atoi(char *var)
{
    int idx;
    int len;
    int num;
    int is_hex;

    if (var[0] == '0' && var[1] == 'x'){
        is_hex = 1;
    }else{
        is_hex = 0;
    }

    len = strlen(var);
    num = 0;

    if (is_hex){
        for (idx = 2; idx < len; idx ++){
            if (var[idx] == 'L' || var[idx] == 'l'){
                break;
            }

            num <<= 4;
            if (var[idx] >= '0' && var[idx] <= '9'){
                num += var[idx] - '0';

            }else if (var[idx] >= 'a' && var[idx] <= 'f'){
                num += var[idx] - 'a' + 10;

            }else if (var[idx] >= 'A' && var[idx] <= 'F'){
                num += var[idx] - 'A' + 10;

            }else{
                return -1;
            }
        }
    }else{
        for (idx = 0; idx < len; idx ++){

            if (var[idx] == 'L' || var[idx] == 'l'){
                break;
            }

            num *= 10;
            if (var[idx] >= '0' && var[idx] <= '9'){
                num += var[idx] - '0';

            }else{
                return -1;
            }
        }
    }

    return num;
}

int search_reg_name(char *grp_name, char *reg_name)
{
    int idx = 0;
    int max_idx;
    int base_addr;

    reg_map *reg_p;

    // ------------------------------------------------------------------------
    //  find DLA sub-unit
    // ------------------------------------------------------------------------
    if (strcmp(grp_name, "NVDLA_GLB") == 0){
        base_addr = GLB_ADDR;
        reg_p = glb;
        max_idx = sizeof(glb) / sizeof(glb[0]);

    }else if (strcmp(grp_name, "NVDLA_MCIF") == 0){
        base_addr = MCIF_ADDR;
        reg_p = mcif;
        max_idx = sizeof(mcif) / sizeof(mcif[0]);

    }else if (strcmp(grp_name, "NVDLA_CDMA") == 0){
        base_addr = CDMA_ADDR;
        reg_p = cdma;
        max_idx = sizeof(cdma) / sizeof(cdma[0]);

    }else if (strcmp(grp_name, "NVDLA_CSC") == 0){
        base_addr = CSC_ADDR;
        reg_p = csc;
        max_idx = sizeof(csc) / sizeof(csc[0]);

    }else if (strcmp(grp_name, "NVDLA_CMAC_A") == 0){
        base_addr = CMAC_A_ADDR;
        reg_p = cmac_a;
        max_idx = sizeof(cmac_a) / sizeof(cmac_a[0]);

    }else if (strcmp(grp_name, "NVDLA_CMAC_B") == 0){
        base_addr = CMAC_B_ADDR;
        reg_p = cmac_b;
        max_idx = sizeof(cmac_b) / sizeof(cmac_b[0]);

    }else if (strcmp(grp_name, "NVDLA_CACC") == 0){
        base_addr = CACC_ADDR;
        reg_p = cacc;
        max_idx = sizeof(cacc) / sizeof(cacc[0]);

    }else if (strcmp(grp_name, "NVDLA_SDP_RDMA") == 0){
        base_addr = SDP_RDMA_ADDR;
        reg_p = sdp_rdma;
        max_idx = sizeof(sdp_rdma) / sizeof(sdp_rdma[0]);

    }else if (strcmp(grp_name, "NVDLA_SDP") == 0){
        base_addr = SDP_ADDR;
        reg_p = sdp;
        max_idx = sizeof(sdp) / sizeof(sdp[0]);

    }else if (strcmp(grp_name, "NVDLA_PDP_RDMA") == 0){
        base_addr = PDP_RDMA_ADDR;
        reg_p = pdp_rdma;
        max_idx = sizeof(pdp_rdma) / sizeof(pdp_rdma[0]);

    }else if (strcmp(grp_name, "NVDLA_PDP") == 0){
        base_addr = PDP_ADDR;
        reg_p = pdp;
        max_idx = sizeof(pdp) / sizeof(pdp[0]);

    }else if (strcmp(grp_name, "NVDLA_CDP_RDMA") == 0){
        base_addr = CDP_RDMA_ADDR;
        reg_p = cdp_rdma;
        max_idx = sizeof(cdp_rdma) / sizeof(cdp_rdma[0]);

    }else if (strcmp(grp_name, "NVDLA_CDP") == 0){
        base_addr = CDP_ADDR;
        reg_p = cdp;
        max_idx = sizeof(cdp) / sizeof(cdp[0]);

    }else if (strcmp(grp_name, "NVDLA_CVIF") == 0){
        base_addr = CVIF_ADDR;
        reg_p = cvif;
        max_idx = sizeof(cvif) / sizeof(cvif[0]);

    }else if (strcmp(grp_name, "NVDLA_BDMA") == 0){
        base_addr = BDMA_ADDR;
        reg_p = bdma;
        max_idx = sizeof(bdma) / sizeof(bdma[0]);

    }else if (strcmp(grp_name, "NVDLA_RBK") == 0){
        base_addr = RBK_ADDR;
        reg_p = rubik;
        max_idx = sizeof(rubik) / sizeof(rubik[0]);

    }else{
        return -1;
    }

    // ------------------------------------------------------------------------
    //  find registers
    // ------------------------------------------------------------------------
    for (idx = 0; idx < max_idx; idx++){
        if (strcmp(reg_name, reg_p[idx].name) == 0){
            #ifdef DEBUG
            vpi_printf("        [addr=%x] %s.%s(%d)\n\n", base_addr+idx*4, grp_name, reg_p[idx].name, reg_p[idx].offset);
            #endif
//            return base_addr + idx*4;
            return base_addr + reg_p[idx].offset;
        }
    }

    return -1;
}

int mem_init(char *arg1, char *arg2, char *arg3, char *arg4)
{
    // mem_init(pri_mem/sec_mem, 0x80000000, 0x3c00, ALL_ZERO/ALL_ONE/ALL_TWO/ALL_FOUR/RANDOM
    int tar_mem;
    int s_addr;
    int len;
    int idx;
    int rand_pattern;
    int offset;
    int byte_num;
    int pattern_0;
    int pattern_1;
    vpiHandle array_word_0;
    vpiHandle array_word_1;
    s_vpi_value curr_value_0;
    s_vpi_value curr_value_1;
#if (NVDLA_PRIMARY_MEMIF_WIDTH == 64)
    vpiHandle mem_0_H;
    vpiHandle mem_1_H;

#elif (NVDLA_PRIMARY_MEMIF_WIDTH == 256)
    vpiHandle mem_0_H;
    vpiHandle mem_1_H;
    vpiHandle mem_2_H;
    vpiHandle mem_3_H;
    vpiHandle mem_4_H;
    vpiHandle mem_5_H;
    vpiHandle mem_6_H;
    vpiHandle mem_7_H;

#endif

    if (strcmp(arg1, "pri_mem") == 0){
        tar_mem = 0;

    }else if (strcmp(arg1, "pri_mem") != 0){
        tar_mem = 1;

    }else{
        vpi_printf("    No such memory: %s\n", arg1);
        return -1;
    }

#if (NVDLA_PRIMARY_MEMIF_WIDTH == 64)
    if (tar_mem == 0){  // pri_mem
        mem_0_H = vpi_handle_by_name("test.dbb_mem.u_mem.mem_rdata_o", NULL);
        byte_num = vpi_get(vpiSize, mem_0_H) >> 3;
        mem_0_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_0", NULL);
        mem_1_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_1", NULL);
    }else{
        mem_0_H = vpi_handle_by_name("test.cvsram_mem.u_mem.mem_rdata_o", NULL);
        byte_num = vpi_get(vpiSize, mem_0_H) >> 3;
        mem_0_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_0", NULL);
        mem_1_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_1", NULL);
    }

#elif (NVDLA_PRIMARY_MEMIF_WIDTH == 256)
    if (tar_mem == 0){  // pri_mem
        mem_0_H = vpi_handle_by_name("test.dbb_mem.u_mem.mem_rdata_o", NULL);
        byte_num = vpi_get(vpiSize, mem_0_H) >> 3;
        mem_0_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_0", NULL);
        mem_1_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_1", NULL);
        mem_2_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_2", NULL);
        mem_3_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_3", NULL);
        mem_4_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_4", NULL);
        mem_5_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_5", NULL);
        mem_6_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_6", NULL);
        mem_7_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_7", NULL);

    }else{
        mem_0_H = vpi_handle_by_name("test.cvsram_mem.u_mem.mem_rdata_o", NULL);
        byte_num = vpi_get(vpiSize, mem_0_H) >> 3;
        mem_0_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_0", NULL);
        mem_1_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_1", NULL);
        mem_2_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_2", NULL);
        mem_3_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_3", NULL);
        mem_4_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_4", NULL);
        mem_5_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_5", NULL);
        mem_6_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_6", NULL);
        mem_7_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_7", NULL);
    }

#endif

//vpi_printf("pri_mem_0=%x",pri_mem_0_H);
    // start address (0xhhhh)
    s_addr = my_atoi(arg2);
    if (s_addr == -1){
        vpi_printf("    Illegal format: mem_init - s_addr\n");
    }

    // length (in unit of 32-bit access)
    len = my_atoi(arg3) >> 2;

    if (tar_mem == 0){
        offset = (s_addr - PRI_MEM_ADDR) / byte_num;

    }else{
        offset = (s_addr - SEC_MEM_ADDR) / byte_num;
    }

    // init pattern
    rand_pattern = 0;

    if (strcmp(arg4, "ALL_ZERO") == 0){
        pattern_0 = 0;
        pattern_1 = 0;

    }else if (strcmp(arg4, "ALL_ONE") == 0){
        pattern_0 = 0x01010101;
        pattern_1 = 0x01010101;

    }else if (strcmp(arg4, "ALL_TWO") == 0){
        pattern_0 = 0x02020202;
        pattern_1 = 0x02020202;

    }else if (strcmp(arg4, "ALL_FOUR") == 0){
        pattern_0 = 0x04040404;
        pattern_1 = 0x04040404;

    }else if (strcmp(arg4, "RANDOM") == 0){
        rand_pattern = 1;
        srand(100);
    }
 
    //vpi_printf("mem size=%x\n", vpi_get(vpiSize, pri_memH));
    //vpi_printf("offset=%x, len=%d\n", offset, len);

    curr_value_0.format = vpiIntVal;
    curr_value_1.format = vpiIntVal;

#if (NVDLA_PRIMARY_MEMIF_WIDTH == 64)
    for (idx = 0; idx < len/2; idx++){  // 2 memories per loop
        if (rand_pattern){
            pattern_1 = rand();
            pattern_0 = rand();
        }

        curr_value_0.value.integer = pattern_0;
        curr_value_1.value.integer = pattern_1;

        array_word_0 = vpi_handle_by_index(mem_0_H, offset+idx);
        array_word_1 = vpi_handle_by_index(mem_1_H, offset+idx);

        vpi_put_value(array_word_0, &curr_value_0, NULL, vpiNoDelay);
        vpi_put_value(array_word_1, &curr_value_1, NULL, vpiNoDelay);
//        vpi_get_value(array_word, &curr_value);
//vpi_printf("  read: %LLx, sizeof(curr_val)=%d\n", curr_value.value.integer, sizeof(curr_value.value.integer));
    }

#elif (NVDLA_PRIMARY_MEMIF_WIDTH == 256)
    for (idx = 0; idx < len/2; idx++){  // 2 memories per loop
        if (rand_pattern){
            pattern_1 = rand();
            pattern_0 = rand();
        }

        curr_value_0.value.integer = pattern_0;
        curr_value_1.value.integer = pattern_1;

        if ((idx % 4) == 0){
            array_word_0 = vpi_handle_by_index(mem_0_H, offset+idx/4);
            array_word_1 = vpi_handle_by_index(mem_1_H, offset+idx/4);

        }else if ((idx % 4) == 1){
            array_word_0 = vpi_handle_by_index(mem_2_H, offset+idx/4);
            array_word_1 = vpi_handle_by_index(mem_3_H, offset+idx/4);

        }else if ((idx % 4) == 2){
            array_word_0 = vpi_handle_by_index(mem_4_H, offset+idx/4);
            array_word_1 = vpi_handle_by_index(mem_5_H, offset+idx/4);

        }else if ((idx % 4) == 3){
            array_word_0 = vpi_handle_by_index(mem_6_H, offset+idx/4);
            array_word_1 = vpi_handle_by_index(mem_7_H, offset+idx/4);
        }


        vpi_put_value(array_word_0, &curr_value_0, NULL, vpiNoDelay);
        vpi_put_value(array_word_1, &curr_value_1, NULL, vpiNoDelay);
//        vpi_get_value(array_word, &curr_value);
//vpi_printf("  read: %LLx, sizeof(curr_val)=%d\n", curr_value.value.integer, sizeof(curr_value.value.integer));
    }
#endif

    return 0;
}

int mem_load(char *arg1, char *arg2, char *arg3)
{
    // mem_load(pri_mem, 0x80000000, "dc_13x15x64_5x3x64x16_int8_0_in_feature.dat");
    int tar_mem;
    int s_addr;
    //int len;
    int idx;
    int pattern;
    int offset;
    vpiHandle array_word;
    s_vpi_value curr_value;
    FILE *fp;
    char str[MAX_STRING_LEN];
    const char delim[] = "{}:, ";
    char *var;
    int data_size;
    int i;
    int byte_num;
    int mem_bank;
    int mem_addr;
#if (NVDLA_PRIMARY_MEMIF_WIDTH == 64)
    vpiHandle mem_0_H;
    vpiHandle mem_1_H;

#elif (NVDLA_PRIMARY_MEMIF_WIDTH == 256)
    vpiHandle mem_0_H;
    vpiHandle mem_1_H;
    vpiHandle mem_2_H;
    vpiHandle mem_3_H;
    vpiHandle mem_4_H;
    vpiHandle mem_5_H;
    vpiHandle mem_6_H;
    vpiHandle mem_7_H;
#endif

    if (strcmp(arg1, "pri_mem") == 0){
        tar_mem = 0;

    }else if (strcmp(arg1, "pri_mem") != 0){
        tar_mem = 1;

    }else{
        vpi_printf("    No such memory: %s\n", arg1);
        return -1;
    }
//var = (char *)malloc(MAX_STRING_LEN);

#if (NVDLA_PRIMARY_MEMIF_WIDTH == 64)
    if (tar_mem == 0){  // pri_mem
        mem_0_H = vpi_handle_by_name("test.dbb_mem.u_mem.mem_rdata_o", NULL);
        byte_num = vpi_get(vpiSize, mem_0_H) >> 3;
        mem_0_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_0", NULL);
        mem_1_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_1", NULL);
    }else{
        mem_0_H = vpi_handle_by_name("test.cvsram_mem.u_mem.mem_rdata_o", NULL);
        byte_num = vpi_get(vpiSize, mem_0_H) >> 3;
        mem_0_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_0", NULL);
        mem_1_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_1", NULL);
    }

#elif (NVDLA_PRIMARY_MEMIF_WIDTH == 256)
    if (tar_mem == 0){  // pri_mem
        mem_0_H = vpi_handle_by_name("test.dbb_mem.u_mem.mem_rdata_o", NULL);
        byte_num = vpi_get(vpiSize, mem_0_H) >> 3;
        mem_0_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_0", NULL);
        mem_1_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_1", NULL);
        mem_2_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_2", NULL);
        mem_3_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_3", NULL);
        mem_4_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_4", NULL);
        mem_5_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_5", NULL);
        mem_6_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_6", NULL);
        mem_7_H = vpi_handle_by_name("test.dbb_mem.u_mem.memory_7", NULL);

    }else{
        mem_0_H = vpi_handle_by_name("test.cvsram_mem.u_mem.mem_rdata_o", NULL);
        byte_num = vpi_get(vpiSize, mem_0_H) >> 3;
        mem_0_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_0", NULL);
        mem_1_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_1", NULL);
        mem_2_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_2", NULL);
        mem_3_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_3", NULL);
        mem_4_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_4", NULL);
        mem_5_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_5", NULL);
        mem_6_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_6", NULL);
        mem_7_H = vpi_handle_by_name("test.cvsram_mem.u_mem.memory_7", NULL);
    }

#endif

    // start address (0xhhhh)
    s_addr = my_atoi(arg2);

    if (s_addr == -1){
        vpi_printf("    Illegal format: mem_init - s_addr\n");
    }

    // length (in unit of 32-bit access)
    //len = my_atoi(arg3) >> 2;

    if (tar_mem == 0){
        offset = (s_addr - PRI_MEM_ADDR) / byte_num;

    }else{
        offset = (s_addr - SEC_MEM_ADDR) / byte_num;
    }

    //vpi_printf("mem size=%x\n", vpi_get(vpiSize, pri_memH));
    //vpi_printf("offset=%x, len=%d\n", offset, len);

    fp = fopen(arg3, "r");

    curr_value.format = vpiIntVal;
    data_size = 0;
    pattern = 0;
    i = 0;

    while (fgets(str, MAX_STRING_LEN, fp) != NULL){

//vpi_printf(" str= %s,", str);
        var = (char *)strtok(str, delim);
//vpi_printf(" var= %s\n", var);

        if (strcmp(var, "offset") == 0){
            var = (char *)strtok(NULL, delim);
            idx = my_atoi(var);
        }else{
            vpi_printf(" No \"offset\" in mem init file %s - %s\n", str, var);
            continue;
        }

        var = (char *)strtok(NULL, delim);
        if (strcmp(var, "size") == 0){    // size:4 or size:8
            var = (char *)strtok(NULL, delim);
            data_size = my_atoi(var);
        }else{
            vpi_printf(" No \"size\" in mem init file\n");
            continue;
        }

        var = (char *)strtok(NULL, delim);
        if (strcmp(var, "payload") == 0){

            for (i = 0; i < data_size; i++){

                var = (char *)strtok(NULL, delim);
                pattern |= ((long long)my_atoi(var) << ((i%4)*8));

                if ((i % 4) == 3){   // 3, 7, ...
                    curr_value.value.integer = pattern;

                    mem_bank = ((idx % byte_num) + i) / 4;

#if (NVDLA_PRIMARY_MEMIF_WIDTH == 64)
                    mem_bank %= 2;
                    mem_addr = offset + (idx+i) / byte_num;

//vpi_printf("          mem_bank=%x, mem_addr=%x\n", mem_bank, mem_addr);
                    if (mem_bank == 0){   // mem_0
                        array_word = vpi_handle_by_index(mem_0_H, mem_addr);

//vpi_printf("   m0[%x]=%x, offset=%x, idx=%x, byte_num=%x, i=%x\n", mem_addr, pattern, offset, idx, byte_num, i);
                    }else if (mem_bank == 1){
                        array_word = vpi_handle_by_index(mem_1_H, mem_addr);
//vpi_printf("   m1[%x]=%x, offset=%x, idx=%x, byte_num=%x, i=%x\n", mem_addr, pattern, offset, idx, byte_num, i);
                    }
#elif (NVDLA_PRIMARY_MEMIF_WIDTH == 256)
                    mem_bank %= 8;
                    mem_addr = offset + (idx+i) / byte_num;

//vpi_printf("          mem_bank=%x, mem_addr=%x\n", mem_bank, mem_addr);
                    if (mem_bank == 0){   // mem_0
                        array_word = vpi_handle_by_index(mem_0_H, mem_addr);

                    }else if (mem_bank == 1){
                        array_word = vpi_handle_by_index(mem_1_H, mem_addr);

                    }else if (mem_bank == 2){
                        array_word = vpi_handle_by_index(mem_2_H, mem_addr);

                    }else if (mem_bank == 3){
                        array_word = vpi_handle_by_index(mem_3_H, mem_addr);

                    }else if (mem_bank == 4){
                        array_word = vpi_handle_by_index(mem_4_H, mem_addr);

                    }else if (mem_bank == 5){
                        array_word = vpi_handle_by_index(mem_5_H, mem_addr);

                    }else if (mem_bank == 6){
                        array_word = vpi_handle_by_index(mem_6_H, mem_addr);

                    }else if (mem_bank == 7){
                        array_word = vpi_handle_by_index(mem_7_H, mem_addr);
                    }
#endif

                    vpi_put_value(array_word, &curr_value, NULL, vpiNoDelay);
                    pattern = 0;
                }
            }
        }else{
            vpi_printf(" No \"payload\" in mem init file %s - %s\n", str, var);
            continue;
        }
    }

    fclose(fp);
//    free(var);

    return 0;
}

void parse_cfg()
{
    vpiHandle tfH;
    s_vpi_value value_ret;
    char file_name[MAX_FILE_NAME_LEN];
    char str[MAX_STRING_LEN];
    FILE *fp;
    FILE *fp_cmd;
    FILE *fp_check;
    int idx;
    const char delim[] = "(,;). ";
    const char delim2[] = "(,;) \"";
    char *cmd;
    char *arg1;
    char *arg2;
    char *arg3;
    char *arg4;
    char *arg5;
    int reg_grp;
    int len;
    int seq_cmd;  // 8 bits - [7:4] op_code, [3:0] func.
    int seq_addr; // 16 bits csb address
    int seq_data; // 32 bits csb data
    int seq_field; // 32 bits csb data
    int sync_id = 0;
    intr_sync_map *sync_tail = NULL;
    intr_sync_map *sync_head = NULL;
    intr_sync_map *sync_curr = NULL;

    value_ret.format = vpiIntVal;
    value_ret.value.integer = -1;

    file_name[0] = 0;
vpi_printf("parse!!\n");

    // ------------------------------------------------------------------------
    //  get file name from args
    // ------------------------------------------------------------------------
    tfH = vpi_handle(vpiSysTfCall, NULL);
    if (!tfH){
        vpi_printf("Failure to get a task handle\n");
    }else{
        getArgsToTask(tfH, file_name);
    }

    cmd = (char *)strtok(file_name, delim2);  // kill leading space of file name
    strcpy(file_name, cmd);

    if (file_name[0] == 0){
        vpi_printf("Use $parse_cfg(\"file_name\")\n");
//        vpi_put_value(tfH, &value_ret, NULL, vpiNoDelay);
        return;
    }

    vpi_printf(" **************************************************************\n");
    vpi_printf(" => Parse %s\n", file_name);
    vpi_printf(" **************************************************************\n");

//    len = vpi_get(vpiSize, pri_memH);
//    vpi_printf("  pri_mem len = %x\n", len);

    // ------------------------------------------------------------------------
    //  parse file.cfg & store into raw format file
    // ------------------------------------------------------------------------
    fp = fopen(file_name, "r");
    fp_cmd = fopen("trace_parser_cmd_seq.log", "w");
    fp_check = fopen("trace_parser_check.log", "w");

    if (fp == NULL){
        vpi_printf("cfg file [%s] open fail\n", file_name);
//        vpi_put_value(tfH, &value_ret, NULL, vpiNoDelay);
        return;
    }

    while (fgets(str, MAX_STRING_LEN, fp) != NULL){
        #ifdef DEBUG
        vpi_printf("%s\n", str);
        #endif

        cmd = (char *)strtok(str, delim);

        if (cmd == NULL || cmd[0] == '\n' || cmd[0] == '\r' || (cmd[0] == '/' && cmd[1] == '/')){
            continue;
        }

        arg1 = (char *)strtok(NULL, delim);
        arg2 = (char *)strtok(NULL, delim);
 
        if (strcmp(cmd, "mem_load") == 0){
            arg3 = (char *)strtok(NULL, delim2);
            arg4 = 0;
        }else{
            arg3 = (char *)strtok(NULL, delim);
            arg4 = (char *)strtok(NULL, delim);
        }
        arg5 = (char *)strtok(NULL, delim2);

        #ifdef DEBUG
        vpi_printf(">>%s %s %s %s %s\n", cmd, arg1, arg2, arg3, arg4);
        #endif

        if (strcmp(cmd, "reg_write") == 0){
            seq_cmd = CMD_REG_WRITE;

        }else if (strcmp(cmd, "reg_read") == 0){
            seq_cmd = CMD_REG_READ;

        }else if (strcmp(cmd, "reg_read_expected") == 0){
            seq_cmd = CMD_REG_READ_EXP;

        }else if (strcmp(cmd, "poll_reg_equal") == 0){
            seq_cmd = CMD_POLL_REG + COND_EQUAL;

        }else if (strcmp(cmd, "poll_reg_greater") == 0){
            seq_cmd = CMD_POLL_REG + COND_GREATER;

        }else if (strcmp(cmd, "poll_reg_less") == 0){
            seq_cmd = CMD_POLL_REG + COND_LESS;

        }else if (strcmp(cmd, "poll_reg_not_equal") == 0){
            seq_cmd = CMD_POLL_REG + COND_NOT_EQUAL;

        }else if (strcmp(cmd, "poll_reg_not_greater") == 0){
            seq_cmd = CMD_POLL_REG + COND_NOT_GREATER;

        }else if (strcmp(cmd, "poll_reg_not_less") == 0){
            seq_cmd = CMD_POLL_REG + COND_NOT_LESS;

        }else if (strcmp(cmd, "poll_field_equal") == 0){
            seq_cmd = CMD_POLL_FIELD + COND_EQUAL;

        }else if (strcmp(cmd, "poll_field_greater") == 0){
            seq_cmd = CMD_POLL_FIELD + COND_GREATER;

        }else if (strcmp(cmd, "poll_field_less") == 0){
            seq_cmd = CMD_POLL_FIELD + COND_LESS;

        }else if (strcmp(cmd, "poll_field_not_equal") == 0){
            seq_cmd = CMD_POLL_FIELD + COND_NOT_EQUAL;

        }else if (strcmp(cmd, "poll_field_not_greater") == 0){
            seq_cmd = CMD_POLL_FIELD + COND_NOT_GREATER;

        }else if (strcmp(cmd, "poll_field_not_less") == 0){
            seq_cmd = CMD_POLL_FIELD + COND_NOT_LESS;

        }else if (strcmp(cmd, "intr_notify") == 0){
            seq_cmd = CMD_INTR_NOTIFY;

        }else if (strcmp(cmd, "check_nothing") == 0){
            seq_cmd = CMD_CHECK_NOTHING;

        }else if (strcmp(cmd, "check_crc") == 0){
            seq_cmd = CMD_CHECK_CRC;

        }else if (strcmp(cmd, "check_file") == 0){
            seq_cmd = CMD_CHECK_FILE;

        }else if (strcmp(cmd, "mem_init") == 0){
            // mem_init(pri_mem/sec_mem, 0x80000000, 0x3c00, ALL_ZERO/ALL_ONE/ALL_TWO/ALL_FOUR/RANDOM
            mem_init(arg1, arg2, arg3, arg4);
            continue;

        }else if (strcmp(cmd, "mem_load") == 0){
            // mem_load(pri_mem, 0x80000000, "dc_13x15x64_5x3x64x16_int8_0_in_feature.dat");
            mem_load(arg1, arg2, arg3);
            continue;

        }else if (strcmp(cmd, "sync_notify") == 0
              ||  strcmp(cmd, "sync_wait") == 0){
            continue;

        }else{
            vpi_printf("Error!! Illegal instruction: %s\n", cmd);
//            vpi_put_value(tfH, &value_ret, NULL, vpiNoDelay);
            return;
        }

        if (seq_cmd == CMD_REG_WRITE || (seq_cmd & 0xf0) == CMD_POLL_REG
        ||  seq_cmd == CMD_REG_READ || seq_cmd == CMD_REG_READ_EXP
        || (seq_cmd & 0xf0) == CMD_POLL_FIELD){

            len = strlen(arg2);

            // set register group number and delete posfix "_0" or "_1"
            if (arg2[len-2] == '_' && arg2[len-1] == '0'){
                reg_grp = 0;

            }else if (arg2[len-2] == '_' && arg2[len-1] == '1'){
                reg_grp = 1;
            }

            arg2[len-2] = '\0';

//            vpi_printf("  reg_write(grp=%d) %s*%s(%d) %s %s\n", reg_grp, arg1, arg2, strlen(arg2), arg3, arg4);

            seq_addr = search_reg_name(arg1, arg2);

            if (seq_addr == -1){
                vpi_printf("No such name: %s.%s\n", arg1, arg2);
//                vpi_put_value(tfH, &value_ret, NULL, vpiNoDelay);
                return;
            }

            seq_addr >>= 2;

            if ((seq_cmd & 0xf0) == CMD_POLL_FIELD){
                seq_field = my_atoi(arg3);
                seq_data = my_atoi(arg4);

                vpi_printf("    %s(grp=%d) %s*%s(%d) %s %s\n", cmd, reg_grp, arg1, arg2, strlen(arg2), arg3, arg4);
                #ifdef DEBUG
                vpi_printf("    raw: %01x %04x %08x %08x\n", seq_cmd, seq_addr, seq_field, seq_data);
                #endif
                fprintf(fp_cmd, "%02x%04x%08x%08x\n", seq_cmd, seq_addr, seq_field, seq_data);

            }else{
                seq_data = my_atoi(arg3);

                vpi_printf("    %s(grp=%d) %s*%s(%d) %s\n", cmd, reg_grp, arg1, arg2, strlen(arg2), arg3);
                #ifdef DEBUG
                vpi_printf("    raw: %01x %04x %08x\n", seq_cmd, seq_addr, seq_data);
                #endif
                fprintf(fp_cmd, "%02x%04x%08x%08x\n", seq_cmd, seq_addr, seq_data, 0);
            }

        }else if (seq_cmd == CMD_INTR_NOTIFY){

            sync_id ++;
            sync_curr = (intr_sync_map *)malloc(sizeof(intr_sync_map));
            sync_curr->next_node = NULL;
            sync_curr->sync_id = sync_id;
            strcpy(sync_curr->sync_name, arg2);

            len = sizeof(intr) / sizeof(intr[0]);

            for (idx = 0; idx < len; idx ++){
                if (strcmp(arg1, intr[idx].name) == 0){
                    break;
                }
            }

            sync_curr->intr_src = intr[idx].offset;

            if (sync_head == NULL){
                sync_head = sync_curr;

            }else{
                sync_tail->next_node = sync_curr;
            }

            sync_tail = sync_curr;
            seq_addr = sync_curr->intr_src;
            seq_data = sync_curr->sync_id;

            vpi_printf("    intr_notify %s(%x) %s(%x)\n", arg1, sync_curr->intr_src, arg2, sync_curr->sync_id);
//            #ifdef DEBUG
            vpi_printf("    raw: %01x %04x %08x\n", seq_cmd, seq_addr, seq_data);
//            #endif
            fprintf(fp_cmd, "%02x%04x%08x%08x\n", seq_cmd, seq_addr, seq_data, 0);

        }else if (seq_cmd == CMD_CHECK_CRC || seq_cmd == CMD_CHECK_FILE
              ||  seq_cmd == CMD_CHECK_NOTHING){

            sync_curr = sync_head;

            while (1){
                if (sync_curr == NULL){
                    vpi_printf("illegal sync_id: %s", arg1);
//                    vpi_put_value(tfH, &value_ret, NULL, vpiNoDelay);
                    return;
                }

                if (strcmp(arg1, sync_curr->sync_name) == 0){
                    break;
                }

                sync_curr = sync_curr->next_node;
            }

            #ifdef DEBUG
            vpi_printf("    %s sync_id=%s(%x), intr_src=%x\n", cmd, sync_curr->sync_name, sync_curr->sync_id, sync_curr->intr_src);
            #endif

            if (seq_cmd == CMD_CHECK_NOTHING){
                vpi_printf("    %s 0x%x\n", cmd, sync_curr->sync_id);
                fprintf(fp_check, "%s 0x%x\n", cmd, sync_curr->sync_id);

            }else{
                vpi_printf("    %s 0x%x %s %s %s \"%s\"\n", cmd, sync_curr->sync_id, arg2, arg3, arg4, arg5);
                fprintf(fp_check, "%s 0x%x %s %s %s \"%s\"\n", cmd, sync_curr->sync_id, arg2, arg3, arg4, arg5);
            }
        }
    }

    fclose(fp);
    fclose(fp_cmd);
    fclose(fp_check);

    vpi_printf(" **************************************************************\n");
    vpi_printf(" => End parse %s\n", file_name);
    vpi_printf(" **************************************************************\n");

    value_ret.value.integer = 0;
//    vpi_put_value(tfH, &value_ret, NULL, vpiNoDelay);
}

/* register your function as a system task */
void register_parse_systfs()
{
    s_vpi_systf_data task_data_s;
    p_vpi_systf_data task_data_p = &task_data_s;

//    task_data_p->type = vpiSysTask;  //vpiSysTask - does not return a value, vpiSysFunc - can return a value
//  task_data_p->sysfuncttype =   // vpiSysFuncInt - int, vpiSysFuncReal - real, vpiSysFuncTime - time, vpiSysFuncSized - variable size
//    task_data_p->type = vpiSysFunc;  //vpiSysTask - does not return a value, vpiSysFunc - can return a value
    task_data_p->type = vpiSysTask;  //vpiSysTask - does not return a value, vpiSysFunc - can return a value
//    task_data_p->sysfunctype = vpiSysFuncInt;  // vpiSysFuncInt - int, vpiSysFuncReal - real, vpiSysFuncTime - time, vpiSysFuncSized - variable size
    task_data_p->tfname = "$parse_cfg";  // start from $, used in verilog code
    task_data_p->calltf = (int(*)()) parse_cfg;  // sim. call this routine when rtl call the function
    task_data_p->compiletf = 0;      // sim. calls once each time it compiles an instance of the function
//  task_data_p->sizetf = 64;           // size in bits of the return data type vpiSysFuncSized
//  task_data_p->user_data =         // pointer to optional data (by calling vpi_get_systf_info() )

    vpi_register_systf(task_data_p);
}

//void (*vlog_startup_routines[])() = 
//#else

#ifndef VCS
void (*vlog_startup_routines[VPI_MAXARRAY])() = 
{
    register_parse_systfs,
    register_check_systfs,
    0
};
#endif

