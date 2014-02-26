format rat
A = [1 -1 0 -1 0 0; 0 -4 2 2 0 0; 0 -9 0 6 3 0; 0 -16 0 -4 0 4];
%A = [1 -1 0  0 ; 0 -4 2  0 ; 0 -9 0 3 ; 0 -16 0  0 ];
A_eta = [ -1  0;  2  0;  6  0; -4  4];
b = [1 2 18 -8]';
%-inv(A)*A_eta;
%inv(A)*b;
beta = [1 2 3 4];
c = [16 7 20 10 4 6]';
for i = 1:3
    for j=i+1:4
        for k=j+1:5
            for l=k+1:6
                beta = [i j k l]
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
                -inv(A_beta)*A_eta
                c_beta'*x_bar
            end
        end
    end
end