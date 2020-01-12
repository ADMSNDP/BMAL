
clear all;
%Give the path of the 'Data' folder
filelist = dir(fullfile('....\Data\A*.tiff'))';

  p=1;
for file = filelist
   filename =strcat('....\Data\', file.name);

     [mydata] =  imread(filename);

[gmRCx20(:,:,p)]=GetgmRC(mydata);

      p
      p=p+1;
end


for i=1:p-1
    vec=gmRCx20(:,:,i);
gmRC(:,i)=vec(:)';
end

filelist = dir(fullfile('....\cnascoredata\A*_cna_score_decision.csv'))';
numfiles=size(filelist,2);
cna = ones(numfiles,1);
   k=1;
for file = filelist
    filename =strcat('......\cnascoredata\', file.name);
    cna_score(k,1) =  csvread(filename);
    k=k+1;
end

main_submodular(gmRC,cna);