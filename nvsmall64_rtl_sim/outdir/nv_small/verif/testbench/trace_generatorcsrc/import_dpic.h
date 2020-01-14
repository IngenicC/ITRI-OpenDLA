
 extern int uvm_hdl_check_path(/* INPUT */const char* path);

 extern int uvm_hdl_deposit(/* INPUT */const char* path, const /* INPUT */svLogicVecVal *value);

 extern int uvm_hdl_force(/* INPUT */const char* path, const /* INPUT */svLogicVecVal *value);

 extern int uvm_hdl_release_and_read(/* INPUT */const char* path, /* INOUT */svLogicVecVal *value);

 extern int uvm_hdl_release(/* INPUT */const char* path);

 extern int uvm_hdl_read(/* INPUT */const char* path, /* OUTPUT */svLogicVecVal *value);

 extern SV_STRING uvm_dpi_get_next_arg_c(/* INPUT */int init);

 extern SV_STRING uvm_dpi_get_tool_name_c();

 extern SV_STRING uvm_dpi_get_tool_version_c();

 extern void* uvm_dpi_regcomp(/* INPUT */const char* regex);

 extern int uvm_dpi_regexec(/* INPUT */void* preg, /* INPUT */const char* str);

 extern void uvm_dpi_regfree(/* INPUT */void* preg);

 extern int uvm_re_match(/* INPUT */const char* re, /* INPUT */const char* str);

 extern void uvm_dump_re_cache();

 extern SV_STRING uvm_glob_to_re(/* INPUT */const char* glob);

 extern void* new_FP16();

 extern void* new_FP17();

 extern void* new_FP32();

 extern void set_FP16(/* INPUT */void* input_a, const /* INPUT */svBitVecVal *value);

 extern void get_FP16(/* INPUT */void* input_a, /* OUTPUT */svBitVecVal *value);

 extern void set_FP17(/* INPUT */void* input_a, const /* INPUT */svBitVecVal *value);

 extern void get_FP17(/* INPUT */void* input_a, /* OUTPUT */svBitVecVal *value);

 extern void set_FP32(/* INPUT */void* input_a, const /* INPUT */svBitVecVal *value);

 extern void get_FP32(/* INPUT */void* input_a, /* OUTPUT */svBitVecVal *value);

 extern void Fp16To17_ref(/* INPUT */void* input_a, /* INPUT */void* result_a);

 extern void FpMul_FP17_ref(/* INPUT */void* input_a, /* INPUT */void* input_b, /* INPUT */void* result_a);

 extern void FpAdd_FP32_ref(/* INPUT */void* input_a, /* INPUT */void* input_b, /* INPUT */void* result_a);

 extern void FpIntToFloat_ref(const /* INPUT */svBitVecVal *input_a, /* INPUT */void* result_a);
