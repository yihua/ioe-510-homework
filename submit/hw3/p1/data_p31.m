% pivot_input.m // Jon Lee
% data for problem 3.1

A = [1 -1 0 -1 0 0; 0 -4 2 2 0 0; 0 -9 0 6 3 0; 0 -16 0 -4 0 4];
c = [6 7 -2 0 4 4.5]';
b = [1 2 18 -8]';
beta = [1,3,5,6];
[m,n] = size(A);
eta = setdiff(1:n,beta); % lazy eta initialization