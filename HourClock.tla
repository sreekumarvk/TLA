\* This module defines an hour clock. It is a counter which will increment from 1 to 12 and then reverts back to 1.
\* This also allows stturing, ie., the clock can reach a state say 11 and remain in that state forever.
----------------------------- MODULE HourClock -----------------------------
EXTENDS Naturals
VARIABLE hr


\* This is the initial condition of the clock
HCini == hr \in (1 .. 12)

\* We define the next state in two different ways. One using IF THEN ELSE condition and the other using MOD operator
\* Note that individually HCnxt and HCnxt2 are not equivalent. This is because in HCnxt, hr' will become 1 only when hr is 12, 
\* while in HCnxt2, hr' will become 1 when hr is a multiple of 12.  
\* Lets assume that hr is set to 15. Then hr' will be 16 in HCnxt while in HCnxt2 it will be 15%12 which is 3.
HCnxt == hr' = IF hr # 12 THEN hr+1 ELSE 1
HCnxt2 == hr' = (hr % 12) + 1

\* But when HCnxt and HCnxt2 taken together with HCini, the two statements are equivalent. Here HC and HC2 is the statement 
\* that defined HCnxt and HCnxt2 taken together with HCini respectively. Hence HC and HC2 are equivalent and is a theorem
HC == HCini /\ [][HCnxt]_hr
HC2 == HCini /\ [][HCnxt2]_hr

THEOREM HC => []HCini 
THEOREM HC2 => []HCini
\*THEOREM HC == HC2

=============================================================================
\* Modification History
\* Last modified Wed Nov 26 13:11:10 PST 2014 by svkodaka
\* Created Wed Nov 26 11:36:45 PST 2014 by svkodaka
