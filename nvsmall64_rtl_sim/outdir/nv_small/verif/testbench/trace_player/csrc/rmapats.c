// file = 0; split type = patterns; threshold = 100000; total count = 0.
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include "rmapats.h"

scalar dummyScalar;
scalar fScalarIsForced=0;
scalar fScalarIsReleased=0;
scalar fScalarHasChanged=0;
scalar fForceFromNonRoot=0;
scalar fNettypeIsForced=0;
scalar fNettypeIsReleased=0;
void  hsG_0__0 (struct dummyq_struct * I1107, EBLK  * I1108, U  I657);
void  hsG_0__0 (struct dummyq_struct * I1107, EBLK  * I1108, U  I657)
{
    U  I1351;
    U  I1352;
    U  I1353;
    struct futq * I1354;
    I1351 = ((U )vcs_clocks) + I657;
    I1353 = I1351 & ((1 << fHashTableSize) - 1);
    I1108->I703 = (EBLK  *)(-1);
    I1108->I707 = I1351;
    if (I1351 < (U )vcs_clocks) {
        I1352 = ((U  *)&vcs_clocks)[1];
        sched_millenium(I1107, I1108, I1352 + 1, I1351);
    }
    else if ((peblkFutQ1Head != ((void *)0)) && (I657 == 1)) {
        I1108->I708 = (struct eblk *)peblkFutQ1Tail;
        peblkFutQ1Tail->I703 = I1108;
        peblkFutQ1Tail = I1108;
    }
    else if ((I1354 = I1107->I1066[I1353].I720)) {
        I1108->I708 = (struct eblk *)I1354->I719;
        I1354->I719->I703 = (RP )I1108;
        I1354->I719 = (RmaEblk  *)I1108;
    }
    else {
        sched_hsopt(I1107, I1108, I1351);
    }
}
void  hs_0_M_171_0__simv_daidir (UB  * pcode, vec32  * I936, U  I857)
{
    UB  * I1412;
    typedef
    UB
     * TermTypePtr;
    U  I1196;
    U  I1152;
    TermTypePtr  I1155;
    U  I1194;
    vec32  * I1188;
    I1155 = (TermTypePtr )pcode;
    I1196 = *I1155;
    I1155 -= I1196;
    I1152 = 2U;
    pcode = (UB  *)(I1155 + I1152);
    pcode = (UB  *)(((UP )(pcode + 0) + 3U) & ~3LU);
    I1194 = (1 + (((I857) - 1) / 32));
    I1188 = (vec32  *)(pcode + 0);
    {
        U  I1142;
        vec32  * I1157 = I1188 + I1196 * I1194;
        I1142 = 0;
        for (; I1142 < I1194; I1142++) {
            if (I936[I1142].I1 != I1157[I1142].I1 || I936[I1142].I2 != I1157[I1142].I2) {
                break ;
            }
        }
        if (I1142 == I1194) {
            return  ;
        }
        for (; I1142 < I1194; I1142++) {
            I1157[I1142].I1 = I936[I1142].I1;
            I1157[I1142].I2 = I936[I1142].I2;
        }
    }
    I936 = (vec32  *)(I1188 + I1152 * I1194);
    rmaEvalWunionW(I936, I1188, I857, I1152);
    pcode += ((I1152 + 1) * I1194 * sizeof(vec32 ));
    pcode = (UB  *)(((UP )(pcode + 0) + 7U) & ~7LU);
    I857 = *(U  *)((pcode + 0));
    {
        struct dummyq_struct * I1107;
        EBLK  * I1108;
        I1107 = (struct dummyq_struct *)&vcs_clocks;
        {
            RmaEblk  * I1108 = (RmaEblk  *)(pcode + 8);
            vec32  * I1369 = (vec32  *)((pcode + 48));
            if (rmaChangeCheckAndUpdateW(I1369, I936, I857)) {
                if (!(I1108->I703)) {
                    I1107->I1061->I703 = (EBLK  *)I1108;
                    I1107->I1061 = (EBLK  *)I1108;
                }
            }
        }
    }
}
void  hs_0_M_171_9__simv_daidir (UB  * pcode, vec32  * I936)
{
    U  I857;
    I857 = *(U  *)((pcode + 0) - sizeof(RP ));
    I936 = (vec32  *)(pcode + 40);
    pcode = ((UB  *)I936) + sizeof(vec32 ) * (1 + (((I857) - 1) / 32));
    pcode = (UB  *)(((UP )(pcode + 0) + 7U) & ~7LU);
    U  I1220;
    vec32  * I1199 = 0;
    {
        U  I1194 = (1 + (((I857) - 1) / 32));
        I1199 = (vec32  *)((pcode + 0));
        pcode += (I1194 * sizeof(vec32 ));
        rmaUpdateW(I1199, I936, I857);
    }
    {
        pcode = (UB  *)((((RP )pcode + 0) + 7) & (~7));
        ((void)0);
        {
            RP  * I697 = (RP  *)(pcode + 0);
            RP  I1288;
            I1288 = *I697;
            if (I1288) {
                hsimDispatchCbkMemOptNoDynElabVector(I697, I936, 2, I857);
            }
        }
    }
    {
        RP  * I1276;
        I1276 = (RP  *)(pcode + 8);
        Wsvvar_callback_virt_intf(I1276);
    }
    pcode = (UB  *)((((RP )pcode + 16) + 7) & (~7));
    ((FPV )(((RmaIbfIp  *)(pcode + 0))->I934))((void *)((RmaIbfIp  *)(pcode + 0))->I705, (UB  *)I936);
}
#ifdef __cplusplus
extern "C" {
#endif
void SinitHsimPats(void);
#ifdef __cplusplus
}
#endif
