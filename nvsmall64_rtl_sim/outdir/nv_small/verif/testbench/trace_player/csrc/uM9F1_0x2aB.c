#include "svdpi.h"
#include "DirectC.h"
#ifdef __cplusplus
extern "C" {
#endif
extern void C2SV_blocking_rsp_done_0x2a(const int A0, const U* A1, const U* A2);
#ifdef __cplusplus
} /*extern "C" */
#endif
#ifndef _DPI_WRAPPER_C2SV_blocking_rsp_done_0x2a
#define _DPI_WRAPPER_C2SV_blocking_rsp_done_0x2a
#ifdef __cplusplus
extern "C" {
#endif
void  C2SV_blocking_rsp_done(int A0,const unsigned int* A1,long long int  A2)
{
U A2_u2[2];

ConvLLI2UP(A2, A2_u2);

 C2SV_blocking_rsp_done_0x2a(A0,A1,A2_u2);



}
#ifdef __cplusplus
} /*extern "C" */
#endif
#endif
#include "svdpi.h"
#include "DirectC.h"
#ifdef __cplusplus
extern "C" {
#endif
extern void C2SV_b_transport_0x2a(const int A0, U* A1, const U* A2);
#ifdef __cplusplus
} /*extern "C" */
#endif
#ifndef _DPI_WRAPPER_C2SV_b_transport_0x2a
#define _DPI_WRAPPER_C2SV_b_transport_0x2a
#ifdef __cplusplus
extern "C" {
#endif
void  C2SV_b_transport(int A0,unsigned int* A1,long long int  A2)
{
U A2_u2[2];

ConvLLI2UP(A2, A2_u2);

 C2SV_b_transport_0x2a(A0,A1,A2_u2);



}
#ifdef __cplusplus
} /*extern "C" */
#endif
#endif
#include "svdpi.h"
#include "DirectC.h"
#ifdef __cplusplus
extern "C" {
#endif
extern void UVMC_set_config_int_0x2a(const char* A0, const char* A1, const char* A2, const U* A3);
#ifdef __cplusplus
} /*extern "C" */
#endif
#ifndef _DPI_WRAPPER_UVMC_set_config_int_0x2a
#define _DPI_WRAPPER_UVMC_set_config_int_0x2a
#ifdef __cplusplus
extern "C" {
#endif
void  UVMC_set_config_int(const char* A0,const char* A1,const char* A2,long long int  A3)
{
U A3_u2[2];

ConvLLI2UP(A3, A3_u2);

 UVMC_set_config_int_0x2a(A0,A1,A2,A3_u2);



}
#ifdef __cplusplus
} /*extern "C" */
#endif
#endif
