#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#include <stdio.h>
#include <dlfcn.h>
#include "svdpi.h"

#ifdef __cplusplus
extern "C" {
#endif

/* VCS error reporting routine */
extern void vcsMsgReport1(const char *, const char *, int, void *, void*, const char *);

#ifndef _VC_TYPES_
#define _VC_TYPES_
/* common definitions shared with DirectC.h */

typedef unsigned int U;
typedef unsigned char UB;
typedef unsigned char scalar;
typedef struct { U c; U d;} vec32;

#define scalar_0 0
#define scalar_1 1
#define scalar_z 2
#define scalar_x 3

extern long long int ConvUP2LLI(U* a);
extern void ConvLLI2UP(long long int a1, U* a2);
extern long long int GetLLIresult();
extern void StoreLLIresult(const unsigned int* data);
typedef struct VeriC_Descriptor *vc_handle;

#ifndef SV_3_COMPATIBILITY
#define SV_STRING const char*
#else
#define SV_STRING char*
#endif

#endif /* _VC_TYPES_ */

#ifndef __VCS_IMPORT_DPI_STUB_uvm_hdl_check_path
#define __VCS_IMPORT_DPI_STUB_uvm_hdl_check_path
__attribute__((weak)) int uvm_hdl_check_path(/* INPUT */const char* A_1)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)(/* INPUT */const char* A_1) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)(const char* A_1)) dlsym(RTLD_NEXT, "uvm_hdl_check_path");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "uvm_hdl_check_path");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_uvm_hdl_check_path */

#ifndef __VCS_IMPORT_DPI_STUB_uvm_hdl_deposit
#define __VCS_IMPORT_DPI_STUB_uvm_hdl_deposit
__attribute__((weak)) int uvm_hdl_deposit(/* INPUT */const char* A_1, const /* INPUT */svLogicVecVal *A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)(/* INPUT */const char* A_1, const /* INPUT */svLogicVecVal *A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)(const char* A_1, const svLogicVecVal* A_2)) dlsym(RTLD_NEXT, "uvm_hdl_deposit");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "uvm_hdl_deposit");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_uvm_hdl_deposit */

#ifndef __VCS_IMPORT_DPI_STUB_uvm_hdl_force
#define __VCS_IMPORT_DPI_STUB_uvm_hdl_force
__attribute__((weak)) int uvm_hdl_force(/* INPUT */const char* A_1, const /* INPUT */svLogicVecVal *A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)(/* INPUT */const char* A_1, const /* INPUT */svLogicVecVal *A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)(const char* A_1, const svLogicVecVal* A_2)) dlsym(RTLD_NEXT, "uvm_hdl_force");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "uvm_hdl_force");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_uvm_hdl_force */

#ifndef __VCS_IMPORT_DPI_STUB_uvm_hdl_release_and_read
#define __VCS_IMPORT_DPI_STUB_uvm_hdl_release_and_read
__attribute__((weak)) int uvm_hdl_release_and_read(/* INPUT */const char* A_1, /* INOUT */svLogicVecVal *A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)(/* INPUT */const char* A_1, /* INOUT */svLogicVecVal *A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)(const char* A_1, svLogicVecVal* A_2)) dlsym(RTLD_NEXT, "uvm_hdl_release_and_read");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "uvm_hdl_release_and_read");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_uvm_hdl_release_and_read */

#ifndef __VCS_IMPORT_DPI_STUB_uvm_hdl_release
#define __VCS_IMPORT_DPI_STUB_uvm_hdl_release
__attribute__((weak)) int uvm_hdl_release(/* INPUT */const char* A_1)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)(/* INPUT */const char* A_1) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)(const char* A_1)) dlsym(RTLD_NEXT, "uvm_hdl_release");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "uvm_hdl_release");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_uvm_hdl_release */

#ifndef __VCS_IMPORT_DPI_STUB_uvm_hdl_read
#define __VCS_IMPORT_DPI_STUB_uvm_hdl_read
__attribute__((weak)) int uvm_hdl_read(/* INPUT */const char* A_1, /* OUTPUT */svLogicVecVal *A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)(/* INPUT */const char* A_1, /* OUTPUT */svLogicVecVal *A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)(const char* A_1, svLogicVecVal* A_2)) dlsym(RTLD_NEXT, "uvm_hdl_read");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "uvm_hdl_read");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_uvm_hdl_read */

#ifndef __VCS_IMPORT_DPI_STUB_uvm_dpi_get_next_arg_c
#define __VCS_IMPORT_DPI_STUB_uvm_dpi_get_next_arg_c
__attribute__((weak)) SV_STRING uvm_dpi_get_next_arg_c(/* INPUT */int A_1)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static SV_STRING (*_vcs_dpi_fp_)(/* INPUT */int A_1) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (SV_STRING (*)(int A_1)) dlsym(RTLD_NEXT, "uvm_dpi_get_next_arg_c");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "uvm_dpi_get_next_arg_c");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_uvm_dpi_get_next_arg_c */

#ifndef __VCS_IMPORT_DPI_STUB_uvm_dpi_get_tool_name_c
#define __VCS_IMPORT_DPI_STUB_uvm_dpi_get_tool_name_c
__attribute__((weak)) SV_STRING uvm_dpi_get_tool_name_c()
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static SV_STRING (*_vcs_dpi_fp_)() = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (SV_STRING (*)()) dlsym(RTLD_NEXT, "uvm_dpi_get_tool_name_c");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_();
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "uvm_dpi_get_tool_name_c");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_uvm_dpi_get_tool_name_c */

#ifndef __VCS_IMPORT_DPI_STUB_uvm_dpi_get_tool_version_c
#define __VCS_IMPORT_DPI_STUB_uvm_dpi_get_tool_version_c
__attribute__((weak)) SV_STRING uvm_dpi_get_tool_version_c()
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static SV_STRING (*_vcs_dpi_fp_)() = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (SV_STRING (*)()) dlsym(RTLD_NEXT, "uvm_dpi_get_tool_version_c");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_();
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "uvm_dpi_get_tool_version_c");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_uvm_dpi_get_tool_version_c */

#ifndef __VCS_IMPORT_DPI_STUB_uvm_dpi_regcomp
#define __VCS_IMPORT_DPI_STUB_uvm_dpi_regcomp
__attribute__((weak)) void* uvm_dpi_regcomp(/* INPUT */const char* A_1)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void* (*_vcs_dpi_fp_)(/* INPUT */const char* A_1) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void* (*)(const char* A_1)) dlsym(RTLD_NEXT, "uvm_dpi_regcomp");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "uvm_dpi_regcomp");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_uvm_dpi_regcomp */

#ifndef __VCS_IMPORT_DPI_STUB_uvm_dpi_regexec
#define __VCS_IMPORT_DPI_STUB_uvm_dpi_regexec
__attribute__((weak)) int uvm_dpi_regexec(/* INPUT */void* A_1, /* INPUT */const char* A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)(/* INPUT */void* A_1, /* INPUT */const char* A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)(void* A_1, const char* A_2)) dlsym(RTLD_NEXT, "uvm_dpi_regexec");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "uvm_dpi_regexec");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_uvm_dpi_regexec */

#ifndef __VCS_IMPORT_DPI_STUB_uvm_dpi_regfree
#define __VCS_IMPORT_DPI_STUB_uvm_dpi_regfree
__attribute__((weak)) void uvm_dpi_regfree(/* INPUT */void* A_1)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(/* INPUT */void* A_1) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(void* A_1)) dlsym(RTLD_NEXT, "uvm_dpi_regfree");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "uvm_dpi_regfree");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_uvm_dpi_regfree */

#ifndef __VCS_IMPORT_DPI_STUB_uvm_re_match
#define __VCS_IMPORT_DPI_STUB_uvm_re_match
__attribute__((weak)) int uvm_re_match(/* INPUT */const char* A_1, /* INPUT */const char* A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)(/* INPUT */const char* A_1, /* INPUT */const char* A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)(const char* A_1, const char* A_2)) dlsym(RTLD_NEXT, "uvm_re_match");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "uvm_re_match");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_uvm_re_match */

#ifndef __VCS_IMPORT_DPI_STUB_uvm_dump_re_cache
#define __VCS_IMPORT_DPI_STUB_uvm_dump_re_cache
__attribute__((weak)) void uvm_dump_re_cache()
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)() = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)()) dlsym(RTLD_NEXT, "uvm_dump_re_cache");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_();
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "uvm_dump_re_cache");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_uvm_dump_re_cache */

#ifndef __VCS_IMPORT_DPI_STUB_uvm_glob_to_re
#define __VCS_IMPORT_DPI_STUB_uvm_glob_to_re
__attribute__((weak)) SV_STRING uvm_glob_to_re(/* INPUT */const char* A_1)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static SV_STRING (*_vcs_dpi_fp_)(/* INPUT */const char* A_1) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (SV_STRING (*)(const char* A_1)) dlsym(RTLD_NEXT, "uvm_glob_to_re");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "uvm_glob_to_re");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_uvm_glob_to_re */

#ifndef __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_copy_c2sv_array
#define __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_copy_c2sv_array
__attribute__((weak)) void UVMC_XL_CONV_SV2C_copy_c2sv_array(/* INPUT */unsigned int A_1, /* INPUT */unsigned long long A_2, const /* INOUT */svOpenArrayHandle A_3)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(/* INPUT */unsigned int A_1, /* INPUT */unsigned long long A_2, const /* INOUT */svOpenArrayHandle A_3) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(unsigned int A_1, unsigned long long A_2, const svOpenArrayHandle A_3)) dlsym(RTLD_NEXT, "UVMC_XL_CONV_SV2C_copy_c2sv_array");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1, A_2, A_3);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "UVMC_XL_CONV_SV2C_copy_c2sv_array");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_copy_c2sv_array */

#ifndef __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_copy_c2sv_int_array
#define __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_copy_c2sv_int_array
__attribute__((weak)) void UVMC_XL_CONV_SV2C_copy_c2sv_int_array(/* INPUT */unsigned int A_1, /* INPUT */unsigned long long A_2, const /* INOUT */svOpenArrayHandle A_3)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(/* INPUT */unsigned int A_1, /* INPUT */unsigned long long A_2, const /* INOUT */svOpenArrayHandle A_3) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(unsigned int A_1, unsigned long long A_2, const svOpenArrayHandle A_3)) dlsym(RTLD_NEXT, "UVMC_XL_CONV_SV2C_copy_c2sv_int_array");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1, A_2, A_3);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "UVMC_XL_CONV_SV2C_copy_c2sv_int_array");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_copy_c2sv_int_array */

#ifndef __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_convert_array_ref_to_chandle
#define __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_convert_array_ref_to_chandle
__attribute__((weak)) void UVMC_XL_CONV_SV2C_convert_array_ref_to_chandle(const /* INPUT */svOpenArrayHandle A_1, /* INOUT */svBitVecVal *A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(const /* INPUT */svOpenArrayHandle A_1, /* INOUT */svBitVecVal *A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(const svOpenArrayHandle A_1, svBitVecVal* A_2)) dlsym(RTLD_NEXT, "UVMC_XL_CONV_SV2C_convert_array_ref_to_chandle");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "UVMC_XL_CONV_SV2C_convert_array_ref_to_chandle");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_convert_array_ref_to_chandle */

#ifndef __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_convert_int_array_ref_to_chandle
#define __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_convert_int_array_ref_to_chandle
__attribute__((weak)) void UVMC_XL_CONV_SV2C_convert_int_array_ref_to_chandle(const /* INPUT */svOpenArrayHandle A_1, /* INOUT */svBitVecVal *A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(const /* INPUT */svOpenArrayHandle A_1, /* INOUT */svBitVecVal *A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(const svOpenArrayHandle A_1, svBitVecVal* A_2)) dlsym(RTLD_NEXT, "UVMC_XL_CONV_SV2C_convert_int_array_ref_to_chandle");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "UVMC_XL_CONV_SV2C_convert_int_array_ref_to_chandle");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_convert_int_array_ref_to_chandle */

#ifndef __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_duplicate_array_ref_to_chandle
#define __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_duplicate_array_ref_to_chandle
__attribute__((weak)) void UVMC_XL_CONV_SV2C_duplicate_array_ref_to_chandle(const /* INPUT */svOpenArrayHandle A_1, /* INOUT */svBitVecVal *A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(const /* INPUT */svOpenArrayHandle A_1, /* INOUT */svBitVecVal *A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(const svOpenArrayHandle A_1, svBitVecVal* A_2)) dlsym(RTLD_NEXT, "UVMC_XL_CONV_SV2C_duplicate_array_ref_to_chandle");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "UVMC_XL_CONV_SV2C_duplicate_array_ref_to_chandle");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_duplicate_array_ref_to_chandle */

#ifndef __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_duplicate_int_array_ref_to_chandle
#define __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_duplicate_int_array_ref_to_chandle
__attribute__((weak)) void UVMC_XL_CONV_SV2C_duplicate_int_array_ref_to_chandle(const /* INPUT */svOpenArrayHandle A_1, /* INOUT */svBitVecVal *A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(const /* INPUT */svOpenArrayHandle A_1, /* INOUT */svBitVecVal *A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(const svOpenArrayHandle A_1, svBitVecVal* A_2)) dlsym(RTLD_NEXT, "UVMC_XL_CONV_SV2C_duplicate_int_array_ref_to_chandle");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "UVMC_XL_CONV_SV2C_duplicate_int_array_ref_to_chandle");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_duplicate_int_array_ref_to_chandle */

#ifndef __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_free_duplicated_storage
#define __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_free_duplicated_storage
__attribute__((weak)) void UVMC_XL_CONV_SV2C_free_duplicated_storage(/* INPUT */unsigned long long A_1)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(/* INPUT */unsigned long long A_1) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(unsigned long long A_1)) dlsym(RTLD_NEXT, "UVMC_XL_CONV_SV2C_free_duplicated_storage");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "UVMC_XL_CONV_SV2C_free_duplicated_storage");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_UVMC_XL_CONV_SV2C_free_duplicated_storage */

#ifndef __VCS_IMPORT_DPI_STUB_UVMC_CONV_SV2C_copy_c2sv_array
#define __VCS_IMPORT_DPI_STUB_UVMC_CONV_SV2C_copy_c2sv_array
__attribute__((weak)) void UVMC_CONV_SV2C_copy_c2sv_array(/* INPUT */unsigned int A_1, /* INPUT */unsigned long long A_2, const /* INOUT */svOpenArrayHandle A_3)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(/* INPUT */unsigned int A_1, /* INPUT */unsigned long long A_2, const /* INOUT */svOpenArrayHandle A_3) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(unsigned int A_1, unsigned long long A_2, const svOpenArrayHandle A_3)) dlsym(RTLD_NEXT, "UVMC_CONV_SV2C_copy_c2sv_array");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1, A_2, A_3);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "UVMC_CONV_SV2C_copy_c2sv_array");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_UVMC_CONV_SV2C_copy_c2sv_array */

#ifndef __VCS_IMPORT_DPI_STUB_UVMC_CONV_SV2C_convert_array_ref_to_chandle
#define __VCS_IMPORT_DPI_STUB_UVMC_CONV_SV2C_convert_array_ref_to_chandle
__attribute__((weak)) void UVMC_CONV_SV2C_convert_array_ref_to_chandle(const /* INPUT */svOpenArrayHandle A_1, /* INOUT */svBitVecVal *A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(const /* INPUT */svOpenArrayHandle A_1, /* INOUT */svBitVecVal *A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(const svOpenArrayHandle A_1, svBitVecVal* A_2)) dlsym(RTLD_NEXT, "UVMC_CONV_SV2C_convert_array_ref_to_chandle");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "UVMC_CONV_SV2C_convert_array_ref_to_chandle");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_UVMC_CONV_SV2C_convert_array_ref_to_chandle */

#ifndef __VCS_IMPORT_DPI_STUB_UVMC_CONV_SV2C_duplicate_array_ref_to_chandle
#define __VCS_IMPORT_DPI_STUB_UVMC_CONV_SV2C_duplicate_array_ref_to_chandle
__attribute__((weak)) void UVMC_CONV_SV2C_duplicate_array_ref_to_chandle(const /* INPUT */svOpenArrayHandle A_1, /* INOUT */svBitVecVal *A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(const /* INPUT */svOpenArrayHandle A_1, /* INOUT */svBitVecVal *A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(const svOpenArrayHandle A_1, svBitVecVal* A_2)) dlsym(RTLD_NEXT, "UVMC_CONV_SV2C_duplicate_array_ref_to_chandle");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "UVMC_CONV_SV2C_duplicate_array_ref_to_chandle");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_UVMC_CONV_SV2C_duplicate_array_ref_to_chandle */

#ifndef __VCS_IMPORT_DPI_STUB_UVMC_CONV_SV2C_free_duplicated_storage
#define __VCS_IMPORT_DPI_STUB_UVMC_CONV_SV2C_free_duplicated_storage
__attribute__((weak)) void UVMC_CONV_SV2C_free_duplicated_storage(/* INPUT */unsigned long long A_1)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(/* INPUT */unsigned long long A_1) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(unsigned long long A_1)) dlsym(RTLD_NEXT, "UVMC_CONV_SV2C_free_duplicated_storage");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "UVMC_CONV_SV2C_free_duplicated_storage");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_UVMC_CONV_SV2C_free_duplicated_storage */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_blocking_req_done
#define __VCS_IMPORT_DPI_STUB_SV2C_blocking_req_done
__attribute__((weak)) unsigned char SV2C_blocking_req_done(/* INPUT */int A_1)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static unsigned char (*_vcs_dpi_fp_)(/* INPUT */int A_1) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (unsigned char (*)(int A_1)) dlsym(RTLD_NEXT, "SV2C_blocking_req_done");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_blocking_req_done");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_blocking_req_done */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_blocking_rsp_done
#define __VCS_IMPORT_DPI_STUB_SV2C_blocking_rsp_done
__attribute__((weak)) unsigned char SV2C_blocking_rsp_done(/* INPUT */int A_1, const /* INPUT */unsigned int *A_2, /* INPUT */unsigned long long A_3)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static unsigned char (*_vcs_dpi_fp_)(/* INPUT */int A_1, const /* INPUT */unsigned int *A_2, /* INPUT */unsigned long long A_3) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (unsigned char (*)(int A_1, const unsigned int* A_2, unsigned long long A_3)) dlsym(RTLD_NEXT, "SV2C_blocking_rsp_done");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2, A_3);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_blocking_rsp_done");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_blocking_rsp_done */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_resolve_binding
#define __VCS_IMPORT_DPI_STUB_SV2C_resolve_binding
__attribute__((weak)) int SV2C_resolve_binding(/* INPUT */const char* A_1, /* INPUT */const char* A_2, /* INPUT */const char* A_3, /* INPUT */int A_4, /* INPUT */int A_5, /* INPUT */int A_6, /* INPUT */int A_7, /* OUTPUT */int *A_8)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)(/* INPUT */const char* A_1, /* INPUT */const char* A_2, /* INPUT */const char* A_3, /* INPUT */int A_4, /* INPUT */int A_5, /* INPUT */int A_6, /* INPUT */int A_7, /* OUTPUT */int *A_8) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)(const char* A_1, const char* A_2, const char* A_3, int A_4, int A_5, int A_6, int A_7, int* A_8)) dlsym(RTLD_NEXT, "SV2C_resolve_binding");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_resolve_binding");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_resolve_binding */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_put
#define __VCS_IMPORT_DPI_STUB_SV2C_put
__attribute__((weak)) unsigned char SV2C_put(/* INPUT */int A_1, const /* INPUT */unsigned int *A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static unsigned char (*_vcs_dpi_fp_)(/* INPUT */int A_1, const /* INPUT */unsigned int *A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (unsigned char (*)(int A_1, const unsigned int* A_2)) dlsym(RTLD_NEXT, "SV2C_put");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_put");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_put */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_try_put
#define __VCS_IMPORT_DPI_STUB_SV2C_try_put
__attribute__((weak)) unsigned char SV2C_try_put(/* INPUT */int A_1, const /* INPUT */unsigned int *A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static unsigned char (*_vcs_dpi_fp_)(/* INPUT */int A_1, const /* INPUT */unsigned int *A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (unsigned char (*)(int A_1, const unsigned int* A_2)) dlsym(RTLD_NEXT, "SV2C_try_put");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_try_put");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_try_put */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_can_put
#define __VCS_IMPORT_DPI_STUB_SV2C_can_put
__attribute__((weak)) unsigned char SV2C_can_put(/* INPUT */int A_1)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static unsigned char (*_vcs_dpi_fp_)(/* INPUT */int A_1) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (unsigned char (*)(int A_1)) dlsym(RTLD_NEXT, "SV2C_can_put");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_can_put");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_can_put */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_get
#define __VCS_IMPORT_DPI_STUB_SV2C_get
__attribute__((weak)) unsigned char SV2C_get(/* INPUT */int A_1)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static unsigned char (*_vcs_dpi_fp_)(/* INPUT */int A_1) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (unsigned char (*)(int A_1)) dlsym(RTLD_NEXT, "SV2C_get");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_get");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_get */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_try_get
#define __VCS_IMPORT_DPI_STUB_SV2C_try_get
__attribute__((weak)) unsigned char SV2C_try_get(/* INPUT */int A_1, /* OUTPUT */unsigned int *A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static unsigned char (*_vcs_dpi_fp_)(/* INPUT */int A_1, /* OUTPUT */unsigned int *A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (unsigned char (*)(int A_1, unsigned int* A_2)) dlsym(RTLD_NEXT, "SV2C_try_get");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_try_get");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_try_get */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_can_get
#define __VCS_IMPORT_DPI_STUB_SV2C_can_get
__attribute__((weak)) unsigned char SV2C_can_get(/* INPUT */int A_1)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static unsigned char (*_vcs_dpi_fp_)(/* INPUT */int A_1) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (unsigned char (*)(int A_1)) dlsym(RTLD_NEXT, "SV2C_can_get");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_can_get");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_can_get */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_peek
#define __VCS_IMPORT_DPI_STUB_SV2C_peek
__attribute__((weak)) unsigned char SV2C_peek(/* INPUT */int A_1)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static unsigned char (*_vcs_dpi_fp_)(/* INPUT */int A_1) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (unsigned char (*)(int A_1)) dlsym(RTLD_NEXT, "SV2C_peek");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_peek");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_peek */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_try_peek
#define __VCS_IMPORT_DPI_STUB_SV2C_try_peek
__attribute__((weak)) unsigned char SV2C_try_peek(/* INPUT */int A_1, /* OUTPUT */unsigned int *A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static unsigned char (*_vcs_dpi_fp_)(/* INPUT */int A_1, /* OUTPUT */unsigned int *A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (unsigned char (*)(int A_1, unsigned int* A_2)) dlsym(RTLD_NEXT, "SV2C_try_peek");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_try_peek");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_try_peek */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_can_peek
#define __VCS_IMPORT_DPI_STUB_SV2C_can_peek
__attribute__((weak)) unsigned char SV2C_can_peek(/* INPUT */int A_1)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static unsigned char (*_vcs_dpi_fp_)(/* INPUT */int A_1) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (unsigned char (*)(int A_1)) dlsym(RTLD_NEXT, "SV2C_can_peek");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_can_peek");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_can_peek */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_write
#define __VCS_IMPORT_DPI_STUB_SV2C_write
__attribute__((weak)) unsigned char SV2C_write(/* INPUT */int A_1, const /* INPUT */unsigned int *A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static unsigned char (*_vcs_dpi_fp_)(/* INPUT */int A_1, const /* INPUT */unsigned int *A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (unsigned char (*)(int A_1, const unsigned int* A_2)) dlsym(RTLD_NEXT, "SV2C_write");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_write");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_write */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_transport
#define __VCS_IMPORT_DPI_STUB_SV2C_transport
__attribute__((weak)) unsigned char SV2C_transport(/* INPUT */int A_1, /* INOUT */unsigned int *A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static unsigned char (*_vcs_dpi_fp_)(/* INPUT */int A_1, /* INOUT */unsigned int *A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (unsigned char (*)(int A_1, unsigned int* A_2)) dlsym(RTLD_NEXT, "SV2C_transport");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_transport");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_transport */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_try_transport
#define __VCS_IMPORT_DPI_STUB_SV2C_try_transport
__attribute__((weak)) unsigned char SV2C_try_transport(/* INPUT */int A_1, /* INOUT */unsigned int *A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static unsigned char (*_vcs_dpi_fp_)(/* INPUT */int A_1, /* INOUT */unsigned int *A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (unsigned char (*)(int A_1, unsigned int* A_2)) dlsym(RTLD_NEXT, "SV2C_try_transport");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_try_transport");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_try_transport */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_nb_transport_fw
#define __VCS_IMPORT_DPI_STUB_SV2C_nb_transport_fw
__attribute__((weak)) int SV2C_nb_transport_fw(/* INPUT */int A_1, /* INOUT */unsigned int *A_2, /* INOUT */unsigned int *A_3, /* INOUT */unsigned long long *A_4)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)(/* INPUT */int A_1, /* INOUT */unsigned int *A_2, /* INOUT */unsigned int *A_3, /* INOUT */unsigned long long *A_4) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)(int A_1, unsigned int* A_2, unsigned int* A_3, unsigned long long* A_4)) dlsym(RTLD_NEXT, "SV2C_nb_transport_fw");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2, A_3, A_4);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_nb_transport_fw");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_nb_transport_fw */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_nb_transport_bw
#define __VCS_IMPORT_DPI_STUB_SV2C_nb_transport_bw
__attribute__((weak)) int SV2C_nb_transport_bw(/* INPUT */int A_1, /* INOUT */unsigned int *A_2, /* INOUT */unsigned int *A_3, /* INOUT */unsigned long long *A_4)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)(/* INPUT */int A_1, /* INOUT */unsigned int *A_2, /* INOUT */unsigned int *A_3, /* INOUT */unsigned long long *A_4) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)(int A_1, unsigned int* A_2, unsigned int* A_3, unsigned long long* A_4)) dlsym(RTLD_NEXT, "SV2C_nb_transport_bw");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2, A_3, A_4);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_nb_transport_bw");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_nb_transport_bw */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_b_transport
#define __VCS_IMPORT_DPI_STUB_SV2C_b_transport
__attribute__((weak)) unsigned char SV2C_b_transport(/* INPUT */int A_1, /* INOUT */unsigned int *A_2, /* INPUT */unsigned long long A_3)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static unsigned char (*_vcs_dpi_fp_)(/* INPUT */int A_1, /* INOUT */unsigned int *A_2, /* INPUT */unsigned long long A_3) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (unsigned char (*)(int A_1, unsigned int* A_2, unsigned long long A_3)) dlsym(RTLD_NEXT, "SV2C_b_transport");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2, A_3);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_b_transport");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_b_transport */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_phase_notification
#define __VCS_IMPORT_DPI_STUB_SV2C_phase_notification
__attribute__((weak)) unsigned char SV2C_phase_notification(/* INPUT */int A_1)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static unsigned char (*_vcs_dpi_fp_)(/* INPUT */int A_1) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (unsigned char (*)(int A_1)) dlsym(RTLD_NEXT, "SV2C_phase_notification");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_phase_notification");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_phase_notification */

#ifndef __VCS_IMPORT_DPI_STUB_SV2C_sv_ready
#define __VCS_IMPORT_DPI_STUB_SV2C_sv_ready
__attribute__((weak)) unsigned char SV2C_sv_ready()
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static unsigned char (*_vcs_dpi_fp_)() = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (unsigned char (*)()) dlsym(RTLD_NEXT, "SV2C_sv_ready");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_();
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "SV2C_sv_ready");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_SV2C_sv_ready */

#ifndef __VCS_IMPORT_DPI_STUB_parse_read_dma_transaction
#define __VCS_IMPORT_DPI_STUB_parse_read_dma_transaction
__attribute__((weak)) void parse_read_dma_transaction(const /* INOUT */svOpenArrayHandle A_1, const /* INOUT */svOpenArrayHandle A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(const /* INOUT */svOpenArrayHandle A_1, const /* INOUT */svOpenArrayHandle A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(const svOpenArrayHandle A_1, const svOpenArrayHandle A_2)) dlsym(RTLD_NEXT, "parse_read_dma_transaction");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "parse_read_dma_transaction");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_parse_read_dma_transaction */

#ifndef __VCS_IMPORT_DPI_STUB_parse_write_dma_transaction
#define __VCS_IMPORT_DPI_STUB_parse_write_dma_transaction
__attribute__((weak)) void parse_write_dma_transaction(const /* INOUT */svOpenArrayHandle A_1, const /* INOUT */svOpenArrayHandle A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(const /* INOUT */svOpenArrayHandle A_1, const /* INOUT */svOpenArrayHandle A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(const svOpenArrayHandle A_1, const svOpenArrayHandle A_2)) dlsym(RTLD_NEXT, "parse_write_dma_transaction");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "parse_write_dma_transaction");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_parse_write_dma_transaction */

#ifndef __VCS_IMPORT_DPI_STUB_parse_sc2mac_data_transaction
#define __VCS_IMPORT_DPI_STUB_parse_sc2mac_data_transaction
__attribute__((weak)) void parse_sc2mac_data_transaction(const /* INOUT */svOpenArrayHandle A_1, const /* INOUT */svOpenArrayHandle A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(const /* INOUT */svOpenArrayHandle A_1, const /* INOUT */svOpenArrayHandle A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(const svOpenArrayHandle A_1, const svOpenArrayHandle A_2)) dlsym(RTLD_NEXT, "parse_sc2mac_data_transaction");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "parse_sc2mac_data_transaction");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_parse_sc2mac_data_transaction */

#ifndef __VCS_IMPORT_DPI_STUB_parse_sc2mac_weight_transaction
#define __VCS_IMPORT_DPI_STUB_parse_sc2mac_weight_transaction
__attribute__((weak)) void parse_sc2mac_weight_transaction(const /* INOUT */svOpenArrayHandle A_1, const /* INOUT */svOpenArrayHandle A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(const /* INOUT */svOpenArrayHandle A_1, const /* INOUT */svOpenArrayHandle A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(const svOpenArrayHandle A_1, const svOpenArrayHandle A_2)) dlsym(RTLD_NEXT, "parse_sc2mac_weight_transaction");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "parse_sc2mac_weight_transaction");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_parse_sc2mac_weight_transaction */

#ifndef __VCS_IMPORT_DPI_STUB_parse_mac2accu_transaction
#define __VCS_IMPORT_DPI_STUB_parse_mac2accu_transaction
__attribute__((weak)) void parse_mac2accu_transaction(const /* INOUT */svOpenArrayHandle A_1, const /* INOUT */svOpenArrayHandle A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(const /* INOUT */svOpenArrayHandle A_1, const /* INOUT */svOpenArrayHandle A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(const svOpenArrayHandle A_1, const svOpenArrayHandle A_2)) dlsym(RTLD_NEXT, "parse_mac2accu_transaction");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "parse_mac2accu_transaction");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_parse_mac2accu_transaction */

#ifndef __VCS_IMPORT_DPI_STUB_parse_cacc2sdp_transaction
#define __VCS_IMPORT_DPI_STUB_parse_cacc2sdp_transaction
__attribute__((weak)) void parse_cacc2sdp_transaction(const /* INOUT */svOpenArrayHandle A_1, const /* INOUT */svOpenArrayHandle A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(const /* INOUT */svOpenArrayHandle A_1, const /* INOUT */svOpenArrayHandle A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(const svOpenArrayHandle A_1, const svOpenArrayHandle A_2)) dlsym(RTLD_NEXT, "parse_cacc2sdp_transaction");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "parse_cacc2sdp_transaction");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_parse_cacc2sdp_transaction */

#ifndef __VCS_IMPORT_DPI_STUB_parse_sdp2pdp_transaction
#define __VCS_IMPORT_DPI_STUB_parse_sdp2pdp_transaction
__attribute__((weak)) void parse_sdp2pdp_transaction(const /* INOUT */svOpenArrayHandle A_1, const /* INOUT */svOpenArrayHandle A_2)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static void (*_vcs_dpi_fp_)(const /* INOUT */svOpenArrayHandle A_1, const /* INOUT */svOpenArrayHandle A_2) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (void (*)(const svOpenArrayHandle A_1, const svOpenArrayHandle A_2)) dlsym(RTLD_NEXT, "parse_sdp2pdp_transaction");
    }
    if (_vcs_dpi_fp_) {
        _vcs_dpi_fp_(A_1, A_2);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "parse_sdp2pdp_transaction");
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_parse_sdp2pdp_transaction */

#ifndef __VCS_EXPORT_DPI_DUMMY_REFERENCES__
#define __VCS_EXPORT_DPI_DUMMY_REFERENCES__
/* Dummy references to those export DPI routines.
 * The symbols will be then exported, so the
 * import DPI routines in another shared
 * libraries can call.
 */
void __vcs_export_dpi_dummy_references__();
void __vcs_export_dpi_dummy_references__()
{
    extern void m__uvm_report_dpi(void);
    void (*fp0)(void) = (void (*)(void)) m__uvm_report_dpi;
    fp0 = fp0;
    extern void C2SV_blocking_rsp_done(void);
    void (*fp1)(void) = (void (*)(void)) C2SV_blocking_rsp_done;
    fp1 = fp1;
    extern void C2SV_blocking_req_done(void);
    void (*fp2)(void) = (void (*)(void)) C2SV_blocking_req_done;
    fp2 = fp2;
    extern void C2SV_put(void);
    void (*fp3)(void) = (void (*)(void)) C2SV_put;
    fp3 = fp3;
    extern void C2SV_try_put(void);
    void (*fp4)(void) = (void (*)(void)) C2SV_try_put;
    fp4 = fp4;
    extern void C2SV_can_put(void);
    void (*fp5)(void) = (void (*)(void)) C2SV_can_put;
    fp5 = fp5;
    extern void C2SV_get(void);
    void (*fp6)(void) = (void (*)(void)) C2SV_get;
    fp6 = fp6;
    extern void C2SV_try_get(void);
    void (*fp7)(void) = (void (*)(void)) C2SV_try_get;
    fp7 = fp7;
    extern void C2SV_can_get(void);
    void (*fp8)(void) = (void (*)(void)) C2SV_can_get;
    fp8 = fp8;
    extern void C2SV_peek(void);
    void (*fp9)(void) = (void (*)(void)) C2SV_peek;
    fp9 = fp9;
    extern void C2SV_try_peek(void);
    void (*fp10)(void) = (void (*)(void)) C2SV_try_peek;
    fp10 = fp10;
    extern void C2SV_can_peek(void);
    void (*fp11)(void) = (void (*)(void)) C2SV_can_peek;
    fp11 = fp11;
    extern void C2SV_write(void);
    void (*fp12)(void) = (void (*)(void)) C2SV_write;
    fp12 = fp12;
    extern void C2SV_transport(void);
    void (*fp13)(void) = (void (*)(void)) C2SV_transport;
    fp13 = fp13;
    extern void C2SV_try_transport(void);
    void (*fp14)(void) = (void (*)(void)) C2SV_try_transport;
    fp14 = fp14;
    extern void C2SV_nb_transport_fw(void);
    void (*fp15)(void) = (void (*)(void)) C2SV_nb_transport_fw;
    fp15 = fp15;
    extern void C2SV_nb_transport_bw(void);
    void (*fp16)(void) = (void (*)(void)) C2SV_nb_transport_bw;
    fp16 = fp16;
    extern void C2SV_b_transport(void);
    void (*fp17)(void) = (void (*)(void)) C2SV_b_transport;
    fp17 = fp17;
    extern void UVMC_wait_for_phase_request(void);
    void (*fp18)(void) = (void (*)(void)) UVMC_wait_for_phase_request;
    fp18 = fp18;
    extern void UVMC_get_uvm_version(void);
    void (*fp19)(void) = (void (*)(void)) UVMC_get_uvm_version;
    fp19 = fp19;
    extern void UVMC_raise_objection(void);
    void (*fp20)(void) = (void (*)(void)) UVMC_raise_objection;
    fp20 = fp20;
    extern void UVMC_drop_objection(void);
    void (*fp21)(void) = (void (*)(void)) UVMC_drop_objection;
    fp21 = fp21;
    extern void UVMC_global_stop_request(void);
    void (*fp22)(void) = (void (*)(void)) UVMC_global_stop_request;
    fp22 = fp22;
    extern void UVMC_print_topology(void);
    void (*fp23)(void) = (void (*)(void)) UVMC_print_topology;
    fp23 = fp23;
    extern void UVMC_report_enabled(void);
    void (*fp24)(void) = (void (*)(void)) UVMC_report_enabled;
    fp24 = fp24;
    extern void UVMC_report(void);
    void (*fp25)(void) = (void (*)(void)) UVMC_report;
    fp25 = fp25;
    extern void UVMC_set_report_verbosity(void);
    void (*fp26)(void) = (void (*)(void)) UVMC_set_report_verbosity;
    fp26 = fp26;
    extern void UVMC_set_config_int(void);
    void (*fp27)(void) = (void (*)(void)) UVMC_set_config_int;
    fp27 = fp27;
    extern void UVMC_set_config_string(void);
    void (*fp28)(void) = (void (*)(void)) UVMC_set_config_string;
    fp28 = fp28;
    extern void UVMC_set_config_object(void);
    void (*fp29)(void) = (void (*)(void)) UVMC_set_config_object;
    fp29 = fp29;
    extern void UVMC_get_config_int(void);
    void (*fp30)(void) = (void (*)(void)) UVMC_get_config_int;
    fp30 = fp30;
    extern void UVMC_get_config_string(void);
    void (*fp31)(void) = (void (*)(void)) UVMC_get_config_string;
    fp31 = fp31;
    extern void UVMC_get_config_object(void);
    void (*fp32)(void) = (void (*)(void)) UVMC_get_config_object;
    fp32 = fp32;
    extern void UVMC_print_factory(void);
    void (*fp33)(void) = (void (*)(void)) UVMC_print_factory;
    fp33 = fp33;
    extern void UVMC_set_factory_inst_override(void);
    void (*fp34)(void) = (void (*)(void)) UVMC_set_factory_inst_override;
    fp34 = fp34;
    extern void UVMC_set_factory_type_override(void);
    void (*fp35)(void) = (void (*)(void)) UVMC_set_factory_type_override;
    fp35 = fp35;
    extern void UVMC_debug_factory_create(void);
    void (*fp36)(void) = (void (*)(void)) UVMC_debug_factory_create;
    fp36 = fp36;
    extern void UVMC_find_factory_override(void);
    void (*fp37)(void) = (void (*)(void)) UVMC_find_factory_override;
    fp37 = fp37;
}
#endif /* __VCS_EXPORT_DPI_DUMMY_REFERENCES_ */

#ifdef __cplusplus
}
#endif

