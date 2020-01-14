ACTIVE = @


BUILD_SYSC::
-include /home/kcchang/nvdla_master/hw/outdir/nv_small/verif/testbench/trace_player/csrc/sysc/info.sysc.make.t

-include /home/kcchang/nvdla_master/hw/outdir/nv_small/verif/testbench/trace_player/csrc/sysc/info.sysc.make.shared

-include /home/kcchang/nvdla_master/hw/outdir/nv_small/verif/testbench/trace_player/csrc/sysc/modellist

-include /home/kcchang/nvdla_master/hw/outdir/nv_small/verif/testbench/trace_player/csrc/sysc/stublist

#FORCE TARGET
FORCE:
SYSC_FILES += $(addprefix /home/kcchang/nvdla_master/hw/outdir/nv_small/verif/testbench/trace_player/csrc/sysc/,$(MODELS))

SYSC_STUBS += $(addprefix /home/kcchang/nvdla_master/hw/outdir/nv_small/verif/testbench/trace_player/csrc/sysc/,$(STUBLIB))
SYSC_STUB_LIB = $(addprefix /home/kcchang/nvdla_master/hw/outdir/nv_small/verif/testbench/trace_player/csrc/sysc/,$(STUBLIB))

SYSC_OBJS := $(SYSC_OBJS) $(addsuffix .o,$(SYSC_FILES)) $(SYSC_STUBS)
/home/kcchang/nvdla_master/hw/outdir/nv_small/verif/testbench/trace_player/csrc/sysc/sysc_globals.o:	/home/kcchang/nvdla_master/hw/outdir/nv_small/verif/testbench/trace_player/csrc/sysc/sysc_globals.cpp
	@/home/kcchang/gcc-4.8.3/DEST/bin/g++ -o $@ -c $^  -m64 -fPIC   -pipe -DVCSMX -I/home/kcchang/nvdla_master/hw/cmod/include -I/home/kcchang/nvdla_master/hw/cmod/include/nvdla_ness_header -I/home/kcchang/nvdla_master/hw/outdir/nv_small/spec/defs -O -I/cadtools/synopsys/vcs_mx/L-2016.06-SP2-6/include  -I/home/kcchang/nvdla_master/hw/cmod/include -I/home/kcchang/nvdla_master/hw/cmod/include/nvdla_ness_header -I/home/kcchang/nvdla_master/hw/outdir/nv_small/spec/defs 
$(SYSC_STUB_LIB):
	$(MAKE) -C /home/kcchang/nvdla_master/hw/outdir/nv_small/verif/testbench/trace_player/csrc/sysc -f Makefile_shared stubs

/home/kcchang/nvdla_master/hw/outdir/nv_small/verif/testbench/trace_player/csrc/sysc/systemc_stub.o:	/home/kcchang/nvdla_master/hw/outdir/nv_small/verif/testbench/trace_player/csrc/sysc/systemc_stub.c
	@$(VCS_CC)  -o $@ -c $^  -m64 -fPIC 
/home/kcchang/nvdla_master/hw/outdir/nv_small/verif/testbench/trace_player/csrc/sysc/simv/simv.o:	/home/kcchang/nvdla_master/hw/outdir/nv_small/verif/testbench/trace_player/csrc/sysc/simv/simv.c
	@$(VCS_CC) -o $@ -c -I$(VCS_HOME)/include -I/cadtools/synopsys/vcs_mx/L-2016.06-SP2-6/linux64/lib $^  -m64 -fPIC  
