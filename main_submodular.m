

 function main_submodular(gmRC,cna)
%gmRC must be vectorized covariance SPD matrices
 
 
%Dividing Test Samples
[trainInd,unlabInd,testInd] = dividerand(size(gmRC,2),0.8,0.0,0.2);%60
TT=gmRC(:,trainInd);
%Dividing Training and Unlabeled Samples
[trainInd,unlabInd] = dividerand(size(TT,2),0.25,0.75,0);%60

TrainSet.X=gmRC(:,trainInd);

TrainSet.y=cna(trainInd);
TrainUnlabel.X=gmRC(:,unlabInd);

TestSet.X=gmRC(:,testInd);
TestSet.y=cna(testInd);


prompt = 'Input the parameters alpha1, alpha2, alpha3, beta and zeta within square brackets values ';
[lambda] = input(prompt);
lambda1=lambda(1);
lambda2=lambda(2);
lambda3=lambda(3);
beta=lambda(4);
zeta=lambda(5);

scX_train=TrainSet.X;
scX_test=TestSet.X;
nClasses = max(TrainSet.y);
nPoints = length(TrainSet.y);
L = zeros(nClasses,nPoints);
L(sub2ind([nClasses,nPoints], TrainSet.y', 1:nPoints)) = 1;


 big_alpha = scX_train*scX_train' + zeta*eye(size(TrainSet.X,1));
 big_v = L*scX_train';
 W = big_v/big_alpha;
 
 [~,y_hat] = max(W*scX_test);
 accuracy(1) = sum(y_hat == TestSet.y')/length(y_hat);
 max_value=accuracy(1);
trainsamples(1)=size(TrainSet.X,2);
BS=0;

 m=size(TrainUnlabel.X,2);

Unlabel.X=TrainUnlabel.X;

  k=1;
  
 %BMAL
 while ~isempty(TrainUnlabel.X)
fprintf('Iteration No.: %f\n No. of samples in the batch: %f\n Training Samples: %f\n Recognition rate: %f\n', k,BS, trainsamples(k), accuracy(k));
 m=size(TrainUnlabel.X,2);
B.X=[];
 
B_temp=[];
 Unlabel.X=TrainUnlabel.X;
SnewB=zeros(1,m);
PX=[];
Py=[];

 for j=1:m
    j
 S=zeros(1,size(Unlabel.X,2));
for i=1:size(Unlabel.X,2)
    B_temp=[B.X,Unlabel.X(:,i)];

    S(i)=objectivefun(B_temp,TrainSet,W,B,lambda1,lambda2,beta);
end
% 
  [~,ind]=max(S);
 last=B;
B.X=[B.X,Unlabel.X(:,ind)];

Unlabel.X(:,[ind])=[];

 SB=objectivefun(B.X,TrainSet,W,last,lambda1,lambda2,beta);

SnewB(j)=SB-lambda3*size(B.X,2);

 end
 [~,BS]=max(SnewB);
 PX=B.X(:,1:BS);

Py=tram_main(TrainSet.X,TrainSet.y,PX);
TrainSet.X=[TrainSet.X,PX];
TrainSet.y=[TrainSet.y;Py];
[TrainUnlabel.X,in]=setdiff(TrainUnlabel.X',PX','rows');
TrainUnlabel.X=TrainUnlabel.X';

k=k+1;



scX_train=TrainSet.X;
scX_test=TestSet.X;
 nClasses = max(TrainSet.y);
 nPoints = length(TrainSet.y);
 L = zeros(nClasses,nPoints);
 L(sub2ind([nClasses,nPoints], TrainSet.y', 1:nPoints)) = 1;



 big_alpha = scX_train*scX_train' + zeta*eye(size(TrainSet.X,1));
 big_v = L*scX_train';
 W = big_v/big_alpha;
 
 [~,y_hat] = max(W*scX_test);
 accuracy(k) = sum(y_hat == TestSet.y')/length(y_hat);
trainsamples(k)=trainsamples(k-1)+BS;
if accuracy(k)>max_value
    max_value=accuracy(k);
    cc=k;
end

end
   Result
  TrS=TrainSet.X(:,1:trainsamples(cc));
  Try=TrainSet.y(1:trainsamples(cc));
  scX_train=TrainSet.X(:,1:trainsamples(cc));
  scX_test=TestSet.X;
 nClasses = max(Try);
  nPoints = length(Try);
  L = zeros(nClasses,nPoints);
  L(sub2ind([nClasses,nPoints], Try', 1:nPoints)) = 1;


 big_alpha = scX_train*scX_train' + zeta*eye(size(TrS,1));
  big_v = L*scX_train';
  W = big_v/big_alpha;
  
  [~,y_hat] = max(W*scX_test);
  acc= sum(y_hat == TestSet.y')/length(y_hat);
  fprintf('Accuracy on Test Samples %f\n', acc);
