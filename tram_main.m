

function [P_labels]=tram_main(train_data,train_label,test_data)
nClasses = max(train_label);
nPoints = length(train_label);

 Y = -1*ones(nClasses,nPoints);

 Y(sub2ind([nClasses,nPoints], train_label',1:nPoints)) = 1;

  [ Confidence, Pre_Labels] = tram(train_data,test_data,Y,7);
  [~,P_labels]=max(Pre_Labels);
  P_labels=P_labels';
end
