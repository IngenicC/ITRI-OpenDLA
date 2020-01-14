
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

 extern void UVMC_XL_CONV_SV2C_copy_c2sv_array(/* INPUT */unsigned int num_bytes, /* INPUT */unsigned long long src_c_array_chandle, const /* INOUT */svOpenArrayHandle dst_sv_array);

 extern void UVMC_XL_CONV_SV2C_copy_c2sv_int_array(/* INPUT */unsigned int num_bytes, /* INPUT */unsigned long long src_c_array_chandle, const /* INOUT */svOpenArrayHandle dst_sv_array);

 extern void UVMC_XL_CONV_SV2C_convert_array_ref_to_chandle(const /* INPUT */svOpenArrayHandle src_sv_array, /* INOUT */svBitVecVal *dst_c_array_chandle);

 extern void UVMC_XL_CONV_SV2C_convert_int_array_ref_to_chandle(const /* INPUT */svOpenArrayHandle src_sv_array, /* INOUT */svBitVecVal *dst_c_array_chandle);

 extern void UVMC_XL_CONV_SV2C_duplicate_array_ref_to_chandle(const /* INPUT */svOpenArrayHandle src_sv_array, /* INOUT */svBitVecVal *dst_c_array_chandle);

 extern void UVMC_XL_CONV_SV2C_duplicate_int_array_ref_to_chandle(const /* INPUT */svOpenArrayHandle src_sv_array, /* INOUT */svBitVecVal *dst_c_array_chandle);

 extern void UVMC_XL_CONV_SV2C_free_duplicated_storage(/* INPUT */unsigned long long c_array_chandle);

 extern void UVMC_CONV_SV2C_copy_c2sv_array(/* INPUT */unsigned int num_bytes, /* INPUT */unsigned long long src_c_array_chandle, const /* INOUT */svOpenArrayHandle dst_sv_array);

 extern void UVMC_CONV_SV2C_convert_array_ref_to_chandle(const /* INPUT */svOpenArrayHandle src_sv_array, /* INOUT */svBitVecVal *dst_c_array_chandle);

 extern void UVMC_CONV_SV2C_duplicate_array_ref_to_chandle(const /* INPUT */svOpenArrayHandle src_sv_array, /* INOUT */svBitVecVal *dst_c_array_chandle);

 extern void UVMC_CONV_SV2C_free_duplicated_storage(/* INPUT */unsigned long long c_array_chandle);

 extern unsigned char SV2C_blocking_req_done(/* INPUT */int m_x_id);

 extern unsigned char SV2C_blocking_rsp_done(/* INPUT */int m_x_id, const /* INPUT */unsigned int *bits, /* INPUT */unsigned long long delay);

 extern int SV2C_resolve_binding(/* INPUT */const char* sv_port_name, /* INPUT */const char* sv_target, /* INPUT */const char* sv_trans_type, /* INPUT */int dummy, /* INPUT */int sv_proxy_type, /* INPUT */int sv_mask, /* INPUT */int sv_id, /* OUTPUT */int *sc_id);

 extern unsigned char SV2C_put(/* INPUT */int x_id, const /* INPUT */unsigned int *bits);

 extern unsigned char SV2C_try_put(/* INPUT */int x_id, const /* INPUT */unsigned int *bits);

 extern unsigned char SV2C_can_put(/* INPUT */int x_id);

 extern unsigned char SV2C_get(/* INPUT */int x_id);

 extern unsigned char SV2C_try_get(/* INPUT */int x_id, /* OUTPUT */unsigned int *bits);

 extern unsigned char SV2C_can_get(/* INPUT */int x_id);

 extern unsigned char SV2C_peek(/* INPUT */int x_id);

 extern unsigned char SV2C_try_peek(/* INPUT */int x_id, /* OUTPUT */unsigned int *bits);

 extern unsigned char SV2C_can_peek(/* INPUT */int x_id);

 extern unsigned char SV2C_write(/* INPUT */int x_id, const /* INPUT */unsigned int *bits);

 extern unsigned char SV2C_transport(/* INPUT */int x_id, /* INOUT */unsigned int *bits);

 extern unsigned char SV2C_try_transport(/* INPUT */int x_id, /* INOUT */unsigned int *bits);

 extern int SV2C_nb_transport_fw(/* INPUT */int x_id, /* INOUT */unsigned int *bits, /* INOUT */unsigned int *phase, /* INOUT */unsigned long long *delay);

 extern int SV2C_nb_transport_bw(/* INPUT */int x_id, /* INOUT */unsigned int *bits, /* INOUT */unsigned int *phase, /* INOUT */unsigned long long *delay);

 extern unsigned char SV2C_b_transport(/* INPUT */int x_id, /* INOUT */unsigned int *bits, /* INPUT */unsigned long long delay);

 extern unsigned char SV2C_phase_notification(/* INPUT */int id);

 extern unsigned char SV2C_sv_ready();

 extern void parse_read_dma_transaction(const /* INOUT */svOpenArrayHandle tlm_gp_data_ptr, const /* INOUT */svOpenArrayHandle parsed_data_ptr);

 extern void parse_write_dma_transaction(const /* INOUT */svOpenArrayHandle tlm_gp_data_ptr, const /* INOUT */svOpenArrayHandle parsed_data_ptr);

 extern void parse_sc2mac_data_transaction(const /* INOUT */svOpenArrayHandle tlm_gp_data_ptr, const /* INOUT */svOpenArrayHandle parsed_data_ptr);

 extern void parse_sc2mac_weight_transaction(const /* INOUT */svOpenArrayHandle tlm_gp_data_ptr, const /* INOUT */svOpenArrayHandle parsed_data_ptr);

 extern void parse_mac2accu_transaction(const /* INOUT */svOpenArrayHandle tlm_gp_data_ptr, const /* INOUT */svOpenArrayHandle parsed_data_ptr);

 extern void parse_cacc2sdp_transaction(const /* INOUT */svOpenArrayHandle tlm_gp_data_ptr, const /* INOUT */svOpenArrayHandle parsed_data_ptr);

 extern void parse_sdp2pdp_transaction(const /* INOUT */svOpenArrayHandle tlm_gp_data_ptr, const /* INOUT */svOpenArrayHandle parsed_data_ptr);
