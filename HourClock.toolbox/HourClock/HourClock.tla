----------------------------- MODULE HourClock -----------------------------
EXTENDS Naturals
VARIABLE hr

HCini == hr \in (1 .. 12)

HCnxt == hr' = IF hr # 12 THEN hr+1 ELSE 1
HC == HCini /\ [][HCnxt]_hr

THEOREM HC => []HCini 



=============================================================================
\* Modification History
\* Last modified Wed Nov 26 12:33:22 PST 2014 by svkodaka
\* Created Wed Nov 26 11:36:45 PST 2014 by svkodaka
