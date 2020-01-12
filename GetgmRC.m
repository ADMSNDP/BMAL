  
 function gmRC=GetgmRC(I_org)

  Lab = RGB2Lab(I_org);
  I=rgb2gray(I_org);
  
R=double(I_org(:,:,1));
G=double(I_org(:,:,2));
B=double(I_org(:,:,3));

 BR=((100 * B)./(1+R+G)).* (256./(1+B+R+G)); % formula for conversion
  

[row, col,dim]=size(I);
tile_size=192;
k=1;
J=cell(1,10);
featvec=cell(1,10);
 
for i=1:tile_size:row-tile_size
    for j=1:tile_size:col-tile_size
        
J=imcrop(I,[j i tile_size-1 tile_size-1]);

featvec{1,k} = MR8computation(J);

 
Labcut=imcrop(Lab,[j i tile_size-1 tile_size-1]);


vec=Labcut(:,:,1);
featvec{1,k}(9,:)=vec(:);

vec=Labcut(:,:,2);
featvec{1,k}(10,:)=vec(:);

vec=Labcut(:,:,3);
featvec{1,k}(11,:)=vec(:);


BRcut=imcrop(BR,[j i tile_size-1 tile_size-1]);

featvec{1,k}(12,:)=double(BRcut(:));

RC_descriptor(:,:,k)=cov(featvec{1,k}');

k=k+1;
end 
end

  gmRC = positive_definite_karcher_mean(double(RC_descriptor));


 end 


