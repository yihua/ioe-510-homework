A_beta = [1 0 0 0; 0 2 0 0; 0 0 3 0; 0 0 0 4];
Abar = [-1 -1; -2 1; -3 2; -4 -1];
A_eta = A_beta * Abar

A = [1 -1 0 -1 0 0; 0 -4 2 2 0 0; 0 -9 0 6 3 0; 0 -16 0 -4 0 4];
x = [1;0;1;0;2;3];
A*x
b = [1 2 6 12]';
A_beta*[1 1 6 -2]'
