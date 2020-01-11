function S=objectivefun(B_temp,TrainSet,W,B,lambda1,lambda2,beta)
%Calculates the objective function


outR=Stein_Divergence(TrainSet.X,B_temp,beta);


E=lambda1*myentropy(B_temp,W); 

outD = lambda2*min_Stein_Divergence(B.X,B_temp,beta);

S=sum(outR+E+outD);


end