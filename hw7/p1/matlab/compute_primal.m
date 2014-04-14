%format rat
A = [14     9    13     2     5    12;     15     1     7     7     9    10];
%A = [1 -1 0  0 ; 0 -4 2  0 ; 0 -9 0 3 ; 0 -16 0  0 ];
%A_eta = [ -1  0;  2  0;  6  0; -4  4];
b = [27 20]';
%-inv(A)*A_eta;
%inv(A)*b;
beta = [1 2];
c = [5 4 8 2 10 3]';
for i = 1:5
    for j=i+1:6
                beta = [i j]
                eta = []
                for m=1:6
                    if sum(ismember(beta,m)) == 0
                        eta = [eta m];
                    end
                end
                eta
                A_eta = A(:,eta);
                A_beta = A(:, beta);
                c_beta = c(beta);
                x_bar = inv(A_beta)*b
                A_etaj_bar = inv(A_beta)*A_eta
                c_beta'*x_bar
    end
end