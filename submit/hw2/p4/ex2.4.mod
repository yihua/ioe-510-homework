# ex2.4.mod 
#
param n integer>0;

set NODES:={0..n+1};

set ARCS within NODES cross NODES;

param duration {ARCS};

var t {i in NODES} >=0;

minimize finishtime:
t[n+1];

subject to duration_constraint {(i,j) in ARCS}: 
(t[i]+duration[i,j]) <= t[j]; 

subject to init_constraint : 
t[0]=0;
