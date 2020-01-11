function sum_divergence = Stein_Divergence(X1,X2,beta)
%Calculates the Stein Kernel
l1 = size(X1,2);
l2 = size(X2,2);

col=sqrt(size(X1,1));

outS = zeros(l1,l2);
for tmpC1 = 1:l1
    for tmpC2 = 1:l2
        X = vec2mat(X1(:,tmpC1),col);
        Y = vec2mat(X2(:,tmpC2),col);
       
        S = log(det(0.5*(X+Y))) -   0.5*log(det(X*Y));
        S=exp(-beta*S);
        
        real_flag = isreal(S);
        if real_flag
            outS(tmpC1,tmpC2) = S;
        else
            outS(tmpC1,tmpC2) = real(S);
        end
        
        if  (outS(tmpC1,tmpC2) < 1e-10)            
            outS(tmpC1,tmpC2) = 0.0;
        end
    end
end
sum_divergence=sum(outS)/l1;
end