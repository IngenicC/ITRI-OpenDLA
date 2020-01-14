# NV_small RTL Simulation Set
This simulation set is requested by [**TSRI**](https://www.tsri.org.tw/main.jsp) for research purpose. 
  
## File structure
- itri_tb: test bench
- outdir: generated DLA RTL code
- small_rams: SRAM model used by DLA
- verif: nvdla native test bench & test scripts
- run_nv_small

## Pre-requirement
EDA tools:
- ncverilog
- PLI 2.0 (included in verdi)


Path setting for EDA tools:

**nvdla_hw_sim/itri_tb/run_nv_small.f**

      +loadpli1=(VERDI_PATH)/share/PLI/IUS/LINUX/boot/debpli.so:novas_pli_boot

## Simulation

nvdla_hw_sim>**cd run_small**

nvdla_hw_sim/run_small>**source ../itri_tb/run_itri_test nv_small *TEST_SCRIPT***

## List of test scripts
Test scripts are placed under the following directory:

**nvdla_hw_sim/verif/tests/trace_tests/nv_small/**

ITRI generative example scripts
----------------------------
- 1xN_DirectConvTest_inception_v3_1x7conv_blk6_u2b1c2_nv64
- MergeGen_conv_28x28x256_3x3s1p1_28x28x128_nv64
- tiny-yolo-v1-conv5-nv64


Native nvdla scripts
----------------------------
- dc_13x15x64_5x3x64x16_int8_0
- dc_14x7x49_3x4x49x32_int8_0
- dc_1x1x8_1x1x8x1_int8_0
- dc_24x33x55_5x5x55x25_int8_0
- dc_24x44x14_5x3x14x41_int8_0
- dc_32x26x76_6x3x76x16_int8_0
- dc_32x26x76_6x3x76x270_int8_0
- dc_35x22x54_6x8x54x29_int8_0
- dc_4x1x8192_1x1x8192x1_int8_0
- dc_6x8x192_3x3x192x32_int8_0
- dc_8192x1x1_2x3x1x41_int8_0
- dc_8x16x128_3x3x128x32_int8
- dc_8x8x36_4x4x36x16_dilation_int8_0
- ...



