# ex2.5.mod
#
param T integer>0;
param k integer>0;
param p >=0;

set PERIODS:={1..T};
set VEHICLES:={1..k};


param v {VEHICLES,PERIODS,PERIODS};

param inflow {PERIODS};

var invest {PERIODS, VEHICLES} >=0;
var leftinv {PERIODS} >=0;
var overallcash {PERIODS} >=0;

maximize cashAfterT:
(sum {i in VEHICLES} (sum{t in PERIODS} v[i,t,T]*invest[t,i])) + leftinv[T]*(1+p/100); 

subject to invest_constraint1 {i in PERIODS}: 
(sum {j in VEHICLES} invest[i,j] + leftinv[i]) = overallcash[i];

subject to invest_constraint2 {i in 2..T}:
 (sum {j in VEHICLES} (sum{t in 1..i-1} v[j,t,i-1]*invest[t,j])+leftinv[i-1]*(1+p/100)+inflow[i])=overallcash[i];

subject to invest_constraint3 :
 inflow[1] = overallcash[1];

