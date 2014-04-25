# ex8_7.mod
#
param n integer > 0; # NUMBER OF COLUMNS
set COLS := {1..n}; # DEFINING THE SET OF COLUMNS INDICES

param employeenum; 
param restaurantnum; 
param wage0; 
param profit {COLS}; 
param wage {COLS}; 
param employeenumperrestaurant {COLS}; 

var x {j in COLS} >= 0; # DEFINING THE (NONNEGATIVE) VARIABLES

maximize totalprofit:  
sum {j in COLS} (profit[j] * x [j] - wage[j]*x[j]*employeenumperrestaurant[j]) -  (employeenum - sum {j in COLS} x[j])*wage0; 

subject to Constraints_resnum: 
sum {j in COLS} x[j] <= restaurantnum;


subject to Constraints_empnum: 
sum {j in COLS} employeenumperrestaurant[j] * x[j] <= employeenum;

