% SubgradientOpt.m // Jon Lee
% 
% Apply Subgradient Optimization to 
%   z = min c'x
%        Ex  = h
%        Ax  = b
%         x >= 0
%
% NOTE: WE ONLY HANDLE PROBLEMS WITH BOUNDED SUBPROBLEM LPs.
%       IF WE ENCOUNTER AN UNBOUNDED SUBPROBLEM, THEN WE QUIT.

% generate a random example
n = 100; % number of variables
m1 = 25; % number of equations to relax
m2 = 10; % number of equations to keep

rng('default');
rng(1);  % set seed
E = rand(m1,n);  % random m1-by-n matrix
A = rand(m2,n);  % random m2-by-n matrix

w = rand(n,1);     % generate rhs's so problem is feasible
h = E*w;
b = A*w;

c = rand(n,1);     % generate random objective
% first we will calculate the optimal value z of the original LP, just to
% compare later
disp('Optimizing the original LP without Lagrangian relaxation');
[x,z,exitflag] = linprog(c,[],[],[E; A],[h; b],zeros(n,1),[]);
if (exitflag < 1)
     disp('fail 1: original LP (without using LR) did not solve correctly');
     return;
end;

disp('Optimal value of the original LP:');
z

disp('Starting Subgradient Optimization');

MAXIT = 100; % number of iterations

results1 = zeros(MAXIT,1);
results2 = zeros(MAXIT,1);

fresults1 = zeros(MAXIT,1);
fresults2 = zeros(MAXIT,1);
fresnum=0;

k = 1; % iteration counter
y = zeros(m1,1); % initialize y as you like
bestlb = -Inf;
while k <= MAXIT 
   % solve the Lagrangian
   k
   [x,subval,exitflag,output,dualsol] = linprog((c'-y'*E)',[],[],A,b,zeros(n,1),[]); 
   dualfeasi=y'*E+(-dualsol.eqlin)'*A-c';

   v = h'*y + (c'-y'*E)*x;  % calculate the value of the Lagrangian
   disp(v);
   if (dualfeasi>=0)
       fresults1(k)=k;
       fresults2(k)=v;
       fresnum=fresnum+1;
   else
       fresults1(k)=0;
   end
   bestlb = max(bestlb,v);
   results1(k)=k;
   results2(k)=v;
   g = h - E*x; % calculate the subgradient
   stepsize = 1/(k); % calculate the step size
   y = y + stepsize*g; % take a step in the direction of the subgradient
   k = k + 1; % increment the iteration counter
end

bestlb

z

fres1 = zeros(fresnum,1);
fres2 = zeros(fresnum,1);
ind=0;
for k=1:MAXIT
    if (fresults1(k)==k)
        ind=ind+1;
        fres1(ind)=k;
        fres2(ind)=fresults2(k);
    end
end

clf;  % clear figure
% plot the sequence of MAXIT lower bounds
plot(results1,results2,'k--.','MarkerSize',15); 
%hold on;
%plot(fres1,fres2,'k.','MarkerSize',30,'Color','green'); 
hold on;
% plot a horizontal line at height z
plot([1,MAXIT],[ z z ], 'r-','LineWidth',2.5) 
axis tight;
xlabel('Iteration');
ylabel('Lagrangian lower bound');
legend('Lagrangian LB','z','Location','SouthEast');
%legend('Lagrangian LB','Feasible Point','z','Location','SouthEast');

print -djpeg SubgradientOpt.jpeg;

% Next, if y really solved the Lagrangian dual, and pi is the 
% optimal solution to the Lagrangian subproblem corresponding to y,
% then y and pi should be an optimal dual solution to the given problem.
% 
% Let's first see if y and pi are nearly dual feasible.

pi = - dualsol.eqlin;
Total_Dual_Infeasibility = norm(min(c' - y'*E - pi'*A,zeros(1,n)))





