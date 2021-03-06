%hw4_2auto.m
clear
k=5;
theta=2*pi/k;
c=cos(theta);
s=sin(theta);
gama=cot(theta);
rot=[c -s;s c];
m=2;
n=2*k;
A=zeros(m,n); c=zeros(n,1); b=zeros(m,1);
A(:,1)=[1 ; 0];
A(:,2)=[0 ; gama];
for i=3:n
%generate A
    if (mod(i,2)==0)
        A(:,i)=rot^((i-2)/2)*A(:,2);
    else 
        A(:,i)=rot^((i-1)/2)*A(:,1);
    end    
end
for i=1:n
%generate c
    c(i)=1-A(1,i)-A(2,i)/gama;
end

beta=zeros(1,m);
res=zeros(n,6);

%automatically find next basis
maxfs=n*(n-1)/2;
res=zeros(n,6);
pastbeta=zeros(maxfs,2);
pbsize=0;
findcycle=0;
for i=1:n-1
    for j=i+1:n
        beta=[i j];
        [fc,res]=searchCycle(1,beta,n,A,c,res,pastbeta,pbsize);     
        if (fc==1)
            fc
            res
            findcycle=1;
            break;
        end
    end
    if findcycle==1
        break;
    end
end
