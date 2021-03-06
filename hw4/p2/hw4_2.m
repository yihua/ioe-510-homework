%hw4_2.m
clear
k=5;
theta=2*pi/k;
c=cos(theta);
s=sin(theta);
gama=cot(theta);
rot=[c -s;s c];
m=2; n=2*k;
A=zeros(m,n); c=zeros(n,1); b=zeros(m,1);
A(:,1)=[1;0];
A(:,2)=[0;gama];
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
%find basis follow the chain in the textbook
for i=1:n
    beta=[i i+1];
    incoming=mod(i+1,n)+1;
    outgoing=1;
    if (i==n)
        beta=[n 1];
    end
    yita=setdiff([1:n],beta);
    Abeta=A(:, beta);
    Ayita=A(:, yita);
    cba=(c'-c(beta)'*inv(Abeta)*A)';
    res(i,1:2)=beta;
    res(i,3)=incoming;
    res(i,4)=outgoing;
    res(i,5)=cba(incoming);
    Aba=inv(Abeta)*A;
    res(i,6)=Aba(outgoing,incoming);   
end
