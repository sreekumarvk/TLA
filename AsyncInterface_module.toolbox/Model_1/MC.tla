---- MODULE MC ----
EXTENDS AsyncInterface_module, TLC

\* CONSTANT definitions @modelParameterConstants:0Data
const_141711928064411000 == 
2
----

\* INIT definition @modelBehaviorNoSpec:0
init_141711928065412000 ==
FALSE/\chan = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_141711928066413000 ==
FALSE/\chan' = chan
----
=============================================================================
\* Modification History
\* Created Thu Nov 27 12:14:40 PST 2014 by svkodaka
