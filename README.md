This repository contains the matlab code for performing batch mode active learning over the Riemannian manifold. Active learning technique in the batch-mode framework, adaptively identifies the apt batch size along with the batch of instances to be queried, following a submodular optimization framework. Samples for annotation are selected considering the diversity and redundancy between the pair of samples, based on the kernelized Riemannian distance measures. After selecting the batch of samples, it is appended with the training set and the model is retrained. The class labels for the selected sample batch is predicted using the TRAnsductive Multi-Label learning (TRAM) proposed X. Kong, M. K. Ng, Z. H. Zhou [1], which needs to be downloaded from the link: 'http://www.lamda.nju.edu.cn/code_TRAM.ashx'

To run the code invoke the function main_submodular(gmRC,cna)with the inputs 
gmRC - the input samples which are vectorized SPD matrices with size mxn, m being the feature size and n being the number of samples 
cna - the class labels

Reference:
[1] X. Kong, M. K. Ng, Z. H. Zhou, Transductive multilabel learning via label set propagation, IEEE Transactions on Knowledge and Data Engineering  25 (3) (2013) 704–719.
