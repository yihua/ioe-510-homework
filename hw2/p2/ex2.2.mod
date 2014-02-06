# ex2.2.mod 
#
param m integer > 0; # NUMBER OF ROWS
param n integer > 0; # NUMBER OF COLUMNS
set ROWS :={1..m} ;
set COLS :={1..n};

param b {ROWS}; # RIGHT−HAND SIDE DATA
param a {ROWS,COLS}; # CONSTRAINT−MATRIX DATA

var x {j in COLS} ; 
var t {j in COLS} ; 

minimize sumt:  # CHOOSE MAX/MIN AND NAME THE OBJ. FUNCTION
sum {j in COLS} t[j]; # DEFINING THE OBJECTIVE FUNCTION


subject to norm_constraint1 {j in COLS}: 
t[j] - x[j] >= 0; 

subject to norm_constraint2 {j in COLS}: 
t[j] + x[j] >= 0; 

subject to linear_system_constraint  {i in ROWS}: 
sum {j in COLS} a[i,j] * x[j] = b[i]; 

