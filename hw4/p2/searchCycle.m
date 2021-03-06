%searchCycle.m
function [fc,res]=searchCycle(i,beta,n,A,c,res1,pastbeta,pbsize)
    maxfs=n*(n-1)/2;
    fc=0;
    res=res1;
    for j=1:pbsize
        if ((pastbeta(j,1)==beta(1) && pastbeta(j,2)==beta(2)) ...
            ||(pastbeta(j,1)==beta(2) && pastbeta(j,2)==beta(1)))
         % find cycle!
            fc=1;
            res(i,1:2)=beta;    
            return;
        end
    end
    %no cycle
    pbsize=pbsize+1;
    pastbeta(pbsize,:)=beta;
    
    yita=setdiff([1:n],beta);
    Abeta=A(:, beta);
    Ayita=A(:, yita);
    cba=(c'-c(beta)'*inv(Abeta)*A)';
    Aba=inv(Abeta)*A;
    if (cba > ones(n,1)*(-1e-8))
        return;
    end
    lt0=find(cba<-1e-8);
    sizelt0=size(lt0,1);
    for lt0i=1:sizelt0
        incoming=lt0(lt0i);    
        gt0=find(Aba(:,incoming)>1e-8);
        sizegt0=size(gt0,1);
        for gt0i=1:sizegt0
            outgoing=gt0(gt0i);
            res(i,1:2)=beta;    
            res(i,3)=incoming;
            res(i,4)=outgoing;
            res(i,5)=cba(incoming);    
            res(i,6)=Aba(outgoing,incoming);   
            dbeta=setdiff(beta,beta(outgoing));
            newbeta=[dbeta incoming];
            [rt res2]=searchCycle(i+1,newbeta,n,A,c,res,pastbeta,pbsize);
            if (rt==1)
                fc=1;
                res=res2;
                return;
            end
        end
    end
    res=res1;
    return;
end
