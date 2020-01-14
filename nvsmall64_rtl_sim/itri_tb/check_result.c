#define VCS

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "./vpi_user.h"
#ifndef VCS
#include "./vpi_user_cds.h"
#endif

//#include "parse_cfg.h"

#define MAX_STRING_LEN 1000

#define PRI_MEM_ADDR  0x80000000
//#define SEC_MEM_ADDR  0x50000000
#define SEC_MEM_ADDR  0x00000000

extern unsigned int my_atoi(char *var);  // from parse_cfg.c

    static const unsigned int crc32_table[] = {0x00000000,0x77073096,0xee0e612c,0x990951ba,
                                               0x076dc419,0x706af48f,0xe963a535,0x9e6495a3,
                                               0x0edb8832,0x79dcb8a4,0xe0d5e91e,0x97d2d988,
                                               0x09b64c2b,0x7eb17cbd,0xe7b82d07,0x90bf1d91,
                                               0x1db71064,0x6ab020f2,0xf3b97148,0x84be41de,
                                               0x1adad47d,0x6ddde4eb,0xf4d4b551,0x83d385c7,
                                               0x136c9856,0x646ba8c0,0xfd62f97a,0x8a65c9ec,
                                               0x14015c4f,0x63066cd9,0xfa0f3d63,0x8d080df5,
                                               0x3b6e20c8,0x4c69105e,0xd56041e4,0xa2677172,
                                               0x3c03e4d1,0x4b04d447,0xd20d85fd,0xa50ab56b,
                                               0x35b5a8fa,0x42b2986c,0xdbbbc9d6,0xacbcf940,
                                               0x32d86ce3,0x45df5c75,0xdcd60dcf,0xabd13d59,
                                               0x26d930ac,0x51de003a,0xc8d75180,0xbfd06116,
                                               0x21b4f4b5,0x56b3c423,0xcfba9599,0xb8bda50f,
                                               0x2802b89e,0x5f058808,0xc60cd9b2,0xb10be924,
                                               0x2f6f7c87,0x58684c11,0xc1611dab,0xb6662d3d,
                                               0x76dc4190,0x01db7106,0x98d220bc,0xefd5102a,
                                               0x71b18589,0x06b6b51f,0x9fbfe4a5,0xe8b8d433,
                                               0x7807c9a2,0x0f00f934,0x9609a88e,0xe10e9818,
                                               0x7f6a0dbb,0x086d3d2d,0x91646c97,0xe6635c01,
                                               0x6b6b51f4,0x1c6c6162,0x856530d8,0xf262004e,
                                               0x6c0695ed,0x1b01a57b,0x8208f4c1,0xf50fc457,
                                               0x65b0d9c6,0x12b7e950,0x8bbeb8ea,0xfcb9887c,
                                               0x62dd1ddf,0x15da2d49,0x8cd37cf3,0xfbd44c65,
                                               0x4db26158,0x3ab551ce,0xa3bc0074,0xd4bb30e2,
                                               0x4adfa541,0x3dd895d7,0xa4d1c46d,0xd3d6f4fb,
                                               0x4369e96a,0x346ed9fc,0xad678846,0xda60b8d0,
                                               0x44042d73,0x33031de5,0xaa0a4c5f,0xdd0d7cc9,
                                               0x5005713c,0x270241aa,0xbe0b1010,0xc90c2086,
                                               0x5768b525,0x206f85b3,0xb966d409,0xce61e49f,
                                               0x5edef90e,0x29d9c998,0xb0d09822,0xc7d7a8b4,
                                               0x59b33d17,0x2eb40d81,0xb7bd5c3b,0xc0ba6cad,
                                               0xedb88320,0x9abfb3b6,0x03b6e20c,0x74b1d29a,
                                               0xead54739,0x9dd277af,0x04db2615,0x73dc1683,
                                               0xe3630b12,0x94643b84,0x0d6d6a3e,0x7a6a5aa8,
                                               0xe40ecf0b,0x9309ff9d,0x0a00ae27,0x7d079eb1,
                                               0xf00f9344,0x8708a3d2,0x1e01f268,0x6906c2fe,
                                               0xf762575d,0x806567cb,0x196c3671,0x6e6b06e7,
                                               0xfed41b76,0x89d32be0,0x10da7a5a,0x67dd4acc,
                                               0xf9b9df6f,0x8ebeeff9,0x17b7be43,0x60b08ed5,
                                               0xd6d6a3e8,0xa1d1937e,0x38d8c2c4,0x4fdff252,
                                               0xd1bb67f1,0xa6bc5767,0x3fb506dd,0x48b2364b,
                                               0xd80d2bda,0xaf0a1b4c,0x36034af6,0x41047a60,
                                               0xdf60efc3,0xa867df55,0x316e8eef,0x4669be79,
                                               0xcb61b38c,0xbc66831a,0x256fd2a0,0x5268e236,
                                               0xcc0c7795,0xbb0b4703,0x220216b9,0x5505262f,
                                               0xc5ba3bbe,0xb2bd0b28,0x2bb45a92,0x5cb36a04,
                                               0xc2d7ffa7,0xb5d0cf31,0x2cd99e8b,0x5bdeae1d,
                                               0x9b64c2b0,0xec63f226,0x756aa39c,0x026d930a,
                                               0x9c0906a9,0xeb0e363f,0x72076785,0x05005713,
                                               0x95bf4a82,0xe2b87a14,0x7bb12bae,0x0cb61b38,
                                               0x92d28e9b,0xe5d5be0d,0x7cdcefb7,0x0bdbdf21,
                                               0x86d3d2d4,0xf1d4e242,0x68ddb3f8,0x1fda836e,
                                               0x81be16cd,0xf6b9265b,0x6fb077e1,0x18b74777,
                                               0x88085ae6,0xff0f6a70,0x66063bca,0x11010b5c,
                                               0x8f659eff,0xf862ae69,0x616bffd3,0x166ccf45,
                                               0xa00ae278,0xd70dd2ee,0x4e048354,0x3903b3c2,
                                               0xa7672661,0xd06016f7,0x4969474d,0x3e6e77db,
                                               0xaed16a4a,0xd9d65adc,0x40df0b66,0x37d83bf0,
                                               0xa9bcae53,0xdebb9ec5,0x47b2cf7f,0x30b5ffe9,
                                               0xbdbdf21c,0xcabac28a,0x53b39330,0x24b4a3a6,
                                               0xbad03605,0xcdd70693,0x54de5729,0x23d967bf,
                                               0xb3667a2e,0xc4614ab8,0x5d681b02,0x2a6f2b94,
                                               0xb40bbe37,0xc30c8ea1,0x5a05df1b,0x2d02ef8d};

// not verified!!
int check_crc(char *arg2, char *arg3, char *arg4, char *arg5)
{
    int tar_mem;
    int s_addr;
    int len;
    int crc_ref;
    int byte_num;
    int offset;
    int idx;
    vpiHandle array_word;
    s_vpi_value curr_value;
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

    unsigned int crc_result = ~0;
    unsigned char crc_tmp;
    unsigned int crc_idx;

    if (strcmp(arg2, "pri_mem") == 0){
        tar_mem = 0;

    }else if (strcmp(arg2, "1") == 0){  // for nvdla default test scripts
        tar_mem = 0;

    }else if (strcmp(arg2, "sec_mem") == 0){
        tar_mem = 1;

    }else{
        vpi_printf(" Illegal memory name:%s\n", arg2);
        return 0;
    }

    s_addr = my_atoi(arg3);
    len = my_atoi(arg4) >> 2;  // in unit of 32-bit (4-byte) access
    crc_ref = my_atoi(arg5);

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

    if (tar_mem == 0){
        offset = (s_addr - PRI_MEM_ADDR) / byte_num;

    }else{
        offset = (s_addr - SEC_MEM_ADDR) / byte_num;
    }

vpi_printf("  tar_mem=%x, s_addr=%x, len=%x, crc_ref=%x\n", tar_mem, s_addr, len, crc_ref);

    curr_value.format = vpiIntVal;

    for (idx = 0; idx < len; idx++){  // 1 memory per loop

#if (NVDLA_PRIMARY_MEMIF_WIDTH == 64)
        if ((idx % 2) == 0){
            array_word = vpi_handle_by_index(mem_0_H, offset+(idx/2));
        }else{
            array_word = vpi_handle_by_index(mem_1_H, offset+(idx/2));
        }

#elif (NVDLA_PRIMARY_MEMIF_WIDTH == 256)
        if ((idx % 8) == 0){
            array_word = vpi_handle_by_index(mem_0_H, offset+(idx/8));
        }else if ((idx % 8) == 1){
            array_word = vpi_handle_by_index(mem_1_H, offset+(idx/8));
        }else if ((idx % 8) == 2){
            array_word = vpi_handle_by_index(mem_2_H, offset+(idx/8));
        }else if ((idx % 8) == 3){
            array_word = vpi_handle_by_index(mem_3_H, offset+(idx/8));
        }else if ((idx % 8) == 4){
            array_word = vpi_handle_by_index(mem_4_H, offset+(idx/8));
        }else if ((idx % 8) == 5){
            array_word = vpi_handle_by_index(mem_5_H, offset+(idx/8));
        }else if ((idx % 8) == 6){
            array_word = vpi_handle_by_index(mem_6_H, offset+(idx/8));
        }else if ((idx % 8) == 7){
            array_word = vpi_handle_by_index(mem_7_H, offset+(idx/8));
        }
#endif

        vpi_get_value(array_word, &curr_value);

        for (crc_idx = 0; crc_idx < 32; crc_idx += 8){
            crc_tmp = (curr_value.value.integer >> crc_idx) & 0xff;
            crc_result = (crc_result>>8) ^ crc32_table[(crc_result&0xff) ^ crc_tmp];
        }
    }

    crc_result = ~crc_result;
    vpi_printf("  calculated crc= %x\n", crc_result);

    if (crc_result == crc_ref){
        return 1;
    }else{
        return 0;
    }
}

int check_file(char *arg2, char *arg3, char *arg4, char *arg5)
{
    int tar_mem;
    int s_addr;
    int len;
    int byte_num;
    int offset;
    int idx;
    int i;
    int data_size;
    int pattern;
    int num_bytes;
    int mem_bank;
    int mem_addr;
    vpiHandle array_word;
    s_vpi_value curr_value;
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
    FILE *fp;
    char str[MAX_STRING_LEN];
    const char delim[] = "{}:, ";
    char *var;
    int fail_cnt = 0;
    int read_value;

    if (strcmp(arg2, "pri_mem") == 0){
        tar_mem = 0;

    }else if (strcmp(arg2, "sec_mem") == 0){
        tar_mem = 1;

    }else{
        vpi_printf(" Illegal memory name:%s\n", arg2);
        return 0;
    }

    s_addr = my_atoi(arg3);
    len = my_atoi(arg4);  // # bytes

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

    if (tar_mem == 0){
        offset = (s_addr - PRI_MEM_ADDR) / byte_num;

vpi_printf("  offset=%x, s_addr=%x, byte_num=%x\n", offset, s_addr, byte_num);
    }else{
        offset = (s_addr - SEC_MEM_ADDR) / byte_num;
    }

    fp = fopen(arg5, "r");

    if (fp == NULL){
        vpi_printf("file open fail!!\n");
        return 0;
    }

    curr_value.format = vpiIntVal;

//    for (idx = 0; idx < len; idx++){  // 1 output file line per loop
//    idx = 0;
    num_bytes = 0;
    while (num_bytes < len){

        // read data from file
        if (fgets(str, MAX_STRING_LEN, fp) == NULL){
            vpi_printf("   read file fail!!");
            return 0;
        }

        var = (char *)strtok(str, delim);

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
            num_bytes += data_size;
        }else{
            vpi_printf(" No \"size\" in mem init file\n");
            continue;
        }

        var = (char *)strtok(NULL, delim);
        if (strcmp(var, "payload") == 0){

            pattern = 0;
            for (i = 0; i < data_size; i++){

                var = (char *)strtok(NULL, delim);

                if (idx + i < len){  // pattern length > check length
                    pattern |= (my_atoi(var) << ((i%4)*8));
                }

                if ((i % 4) == 3){   // 3, 7, ...
/*
                    if ((((idx % byte_num) + i) / 4) == 0){   // mem_0
                        array_word = vpi_handle_by_index(mem_0_H, offset+(idx/byte_num));

//vpi_printf("   m0[%x]=%x, idx=%x, i=%x\n", offset+(idx/byte_num), pattern, idx, i);
                    }else if ((((idx % byte_num) + i) / 4) == 1){
                        array_word = vpi_handle_by_index(mem_1_H, offset+(idx/byte_num));
//vpi_printf("   m1[%x]=%x, idx=%x, i=%x\n", offset+(idx/byte_num), pattern, idx, i);
                    }
*/
                    mem_bank = ((idx % byte_num) + i) / 4;
#if (NVDLA_PRIMARY_MEMIF_WIDTH == 64)
                    mem_bank %= 2;
                    mem_addr = offset + (idx+i) / byte_num;

//vpi_printf("          mem_bank=%x, mem_addr=%x, num_bytes=%x, len=%x\n", mem_bank, mem_addr, num_bytes, len);
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
//vpi_printf("          mem_bank=%x, mem_addr=%x, offset=%x, num_bytes=%x, len=%x\n", mem_bank, mem_addr, offset, num_bytes, len);
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
                    vpi_get_value(array_word, &curr_value);

                    read_value = curr_value.value.integer;
//vpi_printf("          read_value=%x\n", read_value);

                    if (idx + i + 1 > len){  // pattern length > check length
                        if (idx + i + 1 - len == 1){
                            read_value &= 0x00ffffff;
                        }else if (idx + i + 1 - len == 2){
                            read_value &= 0x0000ffff;
                        }else if (idx + i + 1 - len == 3){
                            read_value &= 0x000000ff;
                        }else{
                            read_value = 0;
                        }
                    }

                    if (pattern != read_value){
                        vpi_printf("        =>idx=%x, i=%x, offset=%x, byte_num=%x  ",idx, i, offset, byte_num);
                        if (tar_mem == 0){
                            vpi_printf(" Data compare fail!! gold[%x]=%x, mem[%x]=%x\n",idx, pattern, (PRI_MEM_ADDR+offset*byte_num+idx), read_value);

                        }else{
                            vpi_printf(" Data compare fail!! gold[%x]=%x, mem[%x]=%x\n",idx, pattern, (SEC_MEM_ADDR+offset*byte_num+idx), read_value);
                        }
                        fail_cnt ++;
//                        return 0;
                    }

                    pattern = 0;
                }
            }
        }else{
            vpi_printf(" No \"payload\" in mem init file %s - %s\n", str, var);
            continue;
        }
    }

    fclose(fp);

    if (fail_cnt){
        vpi_printf(" Failure count = %d\n", fail_cnt);
        return 0;
    }else{
        return 1;
    }
}

void check_result()
{
    FILE *fp_check;
    vpiHandle tfH;
    vpiHandle argI;
    vpiHandle argH;
    s_vpi_value curr_value;
    int sync_id;
    char str[MAX_STRING_LEN];
    const char delim[] = "(,;) \"\n\r";
    char *cmd;
    char *arg1;
    char *arg2;
    char *arg3;
    char *arg4;
    char *arg5;
    int result;
int i;
    tfH = vpi_handle(vpiSysTfCall, NULL);

    if (!tfH){
        vpi_printf("Failure to get a task handle\n");
        return;
    }

    cmd = vpi_get_str(vpiName, tfH);
    if (!cmd){
        return;
    }

    argI = vpi_iterate(vpiArgument, tfH);
    argH = vpi_scan(argI);

    if (argI){
        curr_value.format = vpiDecStrVal;
        vpi_get_value(argH, &curr_value);
    }else{
        vpi_printf("No argument!!\n");
        return;
    }

    cmd = (char *)strtok(curr_value.value.str, delim);  // remove leading space
    sync_id = my_atoi(cmd);

    fp_check = fopen("trace_parser_check.log", "r");

    while (fgets(str, MAX_STRING_LEN, fp_check) != NULL){
        cmd = (char *)strtok(str, delim);

        if (cmd == NULL || (cmd[0] == '/' && cmd[1] == '/')){
            continue;
        }

        arg1 = (char *)strtok(NULL, delim);

        if (my_atoi(arg1) != sync_id){
            continue;
        }

        vpi_printf("check!! arg1=%s(%x), sync_id=%x\n", arg1, my_atoi(arg1), sync_id);

        arg2 = (char *)strtok(NULL, delim);
        arg3 = (char *)strtok(NULL, delim);
        arg4 = (char *)strtok(NULL, delim);
        arg5 = (char *)strtok(NULL, delim);

//      vpi_printf("  check: sync_id=%s, %x\n", curr_value.value.str, sync_id);

        if (strcmp(cmd, "check_crc") == 0){
            vpi_printf("  %s(%s, %s, %s, %s, %s)\n",cmd, arg1, arg2, arg3, arg4, arg5);
            result = check_crc(arg2, arg3, arg4, arg5);

        }else if (strcmp(cmd, "check_file") == 0){
            vpi_printf("  %s(%s, %s, %s, %s, %s)\n",cmd, arg1, arg2, arg3, arg4, arg5);
            result = check_file(arg2, arg3, arg4, arg5);

        }else{       // do nothing
            result = 3;
        }

        if (result == 0){
            vpi_printf(" %s fail!! sync_id=0x%x, %s, %s, %s, %s\n", cmd, sync_id, arg2, arg3, arg4, arg5);
            vpi_printf("FFFFF    A     IIIII  L\n");
            vpi_printf("F       A A      I    L\n");
            vpi_printf("FFFF   AAAAA     I    L\n");
            vpi_printf("F     A     A    I    L\n");
            vpi_printf("F     A     A  IIIII  LLLLL\n");

        }else if (result == 1){
            vpi_printf(" %s pass!! sync_id=0x%x, %s, %s, %s, %s\n", cmd, sync_id, arg2, arg3, arg4, arg5);
            vpi_printf("PPPP     A     SSSSS  SSSSS\n");
            vpi_printf("P   P   A A    S      S    \n");
            vpi_printf("PPPP   AAAAA   SSSSS  SSSSS\n");
            vpi_printf("P     A     A      S      S\n");
            vpi_printf("P     A     A  SSSSS  SSSSS\n");

        }else{
            vpi_printf(" %s sync_id=0x%x\n", cmd, sync_id);
        }
    }

    fclose(fp_check);
}

void register_check_systfs()
{
    s_vpi_systf_data task_data_s;
    p_vpi_systf_data task_data_p = &task_data_s;

    task_data_p->type = vpiSysTask;  //vpiSysTask - does not return a value, vpiSysFunc - can return a value
//  task_data_p->sysfuncttype =   // vpiSysFuncInt - int, vpiSysFuncReal - real, vpiSysFuncTime - time, vpiSysFuncSized - variable size
    task_data_p->tfname = "$check_result";  // start from $, used in verilog code
    task_data_p->calltf = (int(*)()) check_result;  // sim. call this routine when rtl call the function
    task_data_p->compiletf = 0;      // sim. calls once each time it compiles an instance of the function
//  task_data_p->sizetf = 64;           // size in bits of the return data type vpiSysFuncSized
//  task_data_p->user_data =         // pointer to optional data (by calling vpi_get_systf_info() )

    vpi_register_systf(task_data_p);
}

