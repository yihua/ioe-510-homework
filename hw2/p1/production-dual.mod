
# production-dual.mod
# 

param m integer > 0;     # NUMBER OF ROWS
param n integer > 0;     # NUMBER OF COLUMNS
set ROWS := {1..m};      # DEFINING THE SET OF ROW INDICES
set COLS := {1..n};      # DEFINING THE SET OF COLUMNS INDICES

param b {ROWS};          # RIGHT-HAND SIDE DATA
param c {COLS};          # OBJECTIVE-FUNCTION DATA
param a {ROWS,COLS};     # CONSTRAINT-MATRIX DATA

var y {j in ROWS} >= 0;  # DEFINING THE (NONNEGATIVE) VARIABLES

minimize z:              # CHOOSE MAX/MIN AND NAME THE OBJ. FUNCTION
   sum {j in ROWS} y[j] * b[j];  # DEFINING THE OBJECTIVE FUNCTION

subject to Constraints {i in COLS}: # DEFINING THE CONSTRAINT INDICES
   sum {j in ROWS} y[j] * a[j,i] >= c[i]; # DEFINING THE CONSTRAINTS
