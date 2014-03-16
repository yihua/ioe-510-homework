# ex2.3.mod 
#
param n integer>0;

set BLOODTYPES:={1..n};

set ARCS within BLOODTYPES cross BLOODTYPES;

param sv {BLOODTYPES};

param dv {BLOODTYPES};

param w {BLOODTYPES};

param c {ARCS};

var x {(i,j) in ARCS} >=0;

maximize resblood:
sum {i in BLOODTYPES} w[i] * (sv[i] -  sum {j in BLOODTYPES} c[i,j]*x[i,j] ); 

subject to flow_constraint1 {i in BLOODTYPES}: 
sum {j in BLOODTYPES} x[i,j]*c[i,j] <= sv[i];

subject to flow_constraint2 {j in BLOODTYPES}: 
sum {i in BLOODTYPES} x[i,j]*c[i,j] = dv[j];

