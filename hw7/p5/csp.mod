
# csp.mod // Jon Lee
# 

param W > 0;                  # width of stock rolls
param K > 0;                  # number of blade
param m >0;                   # number of widths
set WIDTHS:={1..m};           # set of widths to be cut
param d{WIDTHS} > 0;          # number of each width to be cut
param w {WIDTHS} > 0;         # actual widths

param nPAT integer >= 0;      # number of patterns
set PATTERNS := 1..nPAT;      # set of patterns

param A {WIDTHS,PATTERNS} integer >= 0;

var X {PATTERNS} integer >= 0;
                              # rolls cut using each pattern
minimize RollsUsed:           # minimize rolls used
   sum {j in PATTERNS} X[j];

subj to FillDemand {i in WIDTHS}:
   sum {j in PATTERNS} A[i,j] * X[j]>= d[i];

# ----------------------------------------
# KNAPSACK SUBPROBLEM FOR CUTTING STOCK EQ
# ----------------------------------------

param price {WIDTHS} default 0.0;

var Use {WIDTHS} integer >= 0;

minimize Reduced_Cost_EQ:
   1 - sum {i in WIDTHS} price[i] * Use[i];

subj to Width_Limit_EQ:
   sum {i in WIDTHS} w[i] * Use[i] = W;

subj to BLADE_Limit_EQ:
   sum {i in WIDTHS} Use[i] <= K+1;

# ----------------------------------------
# KNAPSACK SUBPROBLEM FOR CUTTING STOCK LEQ
# ----------------------------------------
param price1 {WIDTHS} default 0.0;

var Use1 {WIDTHS} integer >= 0;

minimize Reduced_Cost_LEQ:
   1 - sum {i in WIDTHS} price1[i] * Use1[i];

subj to Width_Limit_LEQ:
   sum {i in WIDTHS} w[i] * Use1[i] < W;

subj to BLADE_Limit_LEQ:
   sum {i in WIDTHS} Use1[i] <= K;
