--------------------------- MODULE AsyncInterface ---------------------------
EXTENDS Naturals
CONSTANT Data
VARIABLES val, rdy, ack

\* We first define the type invariant. ie., the invariant that should be satisfied 
\* by the spec at all times and that defines what the legal values can be for the 
\* variables in the Spec. Here we define val to be some value in the set Data, rdy 
\* and ack can be either 0 or 1. It cannot have any other value.
TypeInvariant == /\ (val \in Data) 
                 /\ (rdy \in {0,1}) 
                 /\ (ack \in {0,1})
                 
\* Initially, val can be any Data, rdy and ack are the same value and can be either 0 or 1.                 
Init == /\ (val \in Data)
        /\ (rdy \in {0,1})
        /\ (ack = rdy)

\* We can either send or receive data in the next step
\* Next == Send \/ Recv                 

\* Send -> For send to happen, initially rdy and ack should be the same. 
\* The next state of rdy should change to !rdy and ack should remain the same
\* Ofcourse, val is now the data that we want to send and it will be something from set Data

Send == /\ rdy = ack
        /\ val' \in Data
        /\ rdy' = 1-rdy
        /\ UNCHANGED ack

Recv == /\ rdy # ack
        /\ ack' = 1-ack
        /\ UNCHANGED <<val, rdy >>
        
Next == Send \/ Recv

Spec == Init /\ [][Next]_<<val,ack,rdy>>   

THEOREM Spec => []TypeInvariant     
=============================================================================
\* Modification History
\* Last modified Thu Nov 27 11:03:58 PST 2014 by svkodaka
\* Created Thu Nov 27 10:14:42 PST 2014 by svkodaka
