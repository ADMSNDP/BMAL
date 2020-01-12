This repository contains the matlab code for performing batch mode active learning over the Riemannian manifold. Active learning technique in the batch-mode framework, adaptively identifies the apt batch size along with the batch of instances to be queried, following a submodular optimization framework. Samples for annotation are selected considering the diversity and redundancy between the pair of samples, based on the kernelized Riemannian distance measures. After selecting the batch of samples, it is appended with the training set and the model is retrained. The class labels for the selected sample batch is predicted using the TRAnsductive Multi-Label learning (TRAM) proposed by X. Kong, M. K. Ng, Z. H. Zhou [1].To run the code invoke the function 'mainpgm.m'.

Requirements:

1. Keep the dataset within a folder named 'Data'. The dataset can be downloaded from https://mitos-atypia-14.grand-challenge.org/home/

2. Requires installing the Manopt toolbox[2], which can be downloaded from https://www.manopt.org

3. The TRAnsductive Multi-Label learning (TRAM) can be downloaded from the link: http://www.lamda.nju.edu.cn/code_TRAM.ashx

References:

[1] X. Kong, M. K. Ng, Z. H. Zhou, Transductive multilabel learning via label set propagation, IEEE Transactions on Knowledge and Data Engineering  25 (3) (2013) 704–719.

[2] N. Boumal, B. Mishra, P.-A. Absil, R. Sepulchre, Manopt, a matlab toolbox for optimization on manifolds, The Journal of Machine Learning Research 15 (1) (2014) 1455–1459.
