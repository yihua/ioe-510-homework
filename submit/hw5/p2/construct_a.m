format rat

A = [1 -1 0 -1 0; 0 -4 2 2 0; 0 -9 0 6 3];
c = [16 7 20 10 4]';
b = [1 2 18]';
beta = [1,4,5];
eta = [2,3]

A
A_beta = A(:,beta)
A_beta_inv = inv(A_beta)
c_bar = c'- c(beta)'*A_beta_inv*A
A_eta = A(:,eta)

line_1 = A_beta_inv * A_eta
line_2 = A_beta_inv * b

line_1_new = [line_1; -1 -1]
line_2_new = [line_2; 0]

A_beta_inv_new = [1 1/2 0 0; 0 1/2 0 0; 0 -1 1/3 0; 0 0 0 1]
A_beta_new = inv(A_beta_inv_new)
A_eta_new = A_beta_new * line_1_new
b_new = A_beta_new * line_2_new

A_new = [1 -1 0 -1 0 0; 0 -4 2 2 0 0; 0 -9 0 6 3 0;0 -1 -1 0 0 1];
c_new = [c; 0]
c_bar_new  = c_new'-c_new([1,4,5,6])'*A_beta_inv_new*A_new

d_new = [c; 1];
y_unf = (d_new([1,4,5,6])'*A_beta_inv_new)'
x_opt = [2;0;0;1;4;0]
obj1 = c_new'* x_opt
obj2 = y_unf'* b_new
y_unf'*A_new - c_new'