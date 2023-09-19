import numpy as np
import time
import numpy.matlib
from function import *
from l2_weights import *
from majorityVoting import *
from model import model as mod


def MRVFLtrain(trainX,trainY,option):
    
    rand_seed= np.random.RandomState(option.seed)

    [Nsample,Nfea] = trainX.shape
    N = option.N
    L = option.L
    C = option.C
    s = option.scale   #scaling factor


    A=[]
    beta=[]
    weights = []
    biases = []
    mu = []
    sigma = []
    ProbScores=[]


    A_input= trainX


    time_start=time.time()


    for i in range(L):

        if i==0:
            w = s*2*rand_seed.rand(Nfea,N)-1

        else:
            w = s*2*rand_seed.rand(Nfea+N,N)-1

        b = s*rand_seed.rand(1,N)
        weights.append(w)
        biases.append(b)

        A1 = np.matmul(A_input,w)
        # layer normalization
        A1_mean = np.mean(A1,axis=0)
        A1_std = np.std(A1,axis=0)
        A1 = (A1-A1_mean)/A1_std
        mu.append(A1_mean)
        sigma.append(A1_std)

        A1 = A1+np.matlib.repmat(b,Nsample,1)
        A1 = relu(A1)
        A1_temp1 = np.concatenate([A_input,A1,np.ones((Nsample,1))],axis=1)
        beta1=l2_weights(A1_temp1,trainY,C,Nsample)

        A.append(A1_temp1)
        beta.append(beta1)

        #clear A1 A1_temp1 A1_temp2 beta1
        A_input = np.concatenate([trainX,A1],axis=1)


    time_end = time.time()
    Training_time = time_end-time_start


    ## Calculate the training accuracy
    pred_idx=np.array([Nsample,L])
    for i in range(L):
        A_temp=A[i]
        beta_temp=beta[i]
        trainY_temp=np.matmul(A_temp,beta_temp)
        indx=np.argmax(trainY_temp,axis=1)
        indx=indx.reshape(Nsample,1)
        if i==0:
            pred_idx=indx
        else:
            pred_idx=np.concatenate([pred_idx,indx],axis=1)


    TrainingAccuracy = majorityVoting(trainY,pred_idx)


    model = mod(L,weights,biases,beta,mu,sigma)
        
    return model,TrainingAccuracy,Training_time

