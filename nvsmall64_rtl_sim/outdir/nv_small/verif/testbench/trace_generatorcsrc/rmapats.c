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
#ifdef __cplusplus
extern "C" {
#endif
void SinitHsimPats(void);
#ifdef __cplusplus
}
#endif
