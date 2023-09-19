    
option.N=62500;  
option.C=2^5;   
option.Scale=2^(7);  
option.Scalemode=1;  
option.bias=1;   
option.link=1;   

[predictions_f1,TrainingAccuracy_f1,TestingAccuracy_f1]=RVFL_train_val...
    (Yeast_f1_train_feature,Yeast_f1_train_label,Yeast_f1_test_feature,Yeast_f1_test_label,option);
% % 
%fold-2
[predictions_f2,TrainingAccuracy_f1,TestingAccuracy_f1]=RVFL_train_val...
    (Yeast_f2_train_feature,Yeast_f2_train_label,Yeast_f2_test_feature,Yeast_f2_test_label,option);

%fold-3
[predictions_f3,TrainingAccuracy_f1,TestingAccuracy_f1]=RVFL_train_val...
    (Yeast_f3_train_feature,Yeast_f3_train_label,Yeast_f3_test_feature,Yeast_f3_test_label,option);

%fold-4
[predictions_f4,TrainingAccuracy_f1,TestingAccuracy_f1]=RVFL_train_val...
    (Yeast_f4_train_feature,Yeast_f4_train_label,Yeast_f4_test_feature,Yeast_f4_test_label,option);

%fold-5
[predictions_f5,TrainingAccuracy_f1,TestingAccuracy_f1]=RVFL_train_val...
    (Yeast_f5_train_feature,Yeast_f5_train_label,Yeast_f5_test_feature,Yeast_f5_test_label,option);

[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f1,Yeast_f1_test_label);
aa = [ACC,SN,SP,PPV,NPV,F1,MCC];
[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f2,Yeast_f2_test_label);
bb = [ACC,SN,SP,PPV,NPV,F1,MCC];
[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f3,Yeast_f3_test_label);
cc = [ACC,SN,SP,PPV,NPV,F1,MCC];
[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f4,Yeast_f4_test_label);
dd = [ACC,SN,SP,PPV,NPV,F1,MCC];
[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f5,Yeast_f5_test_label);
ee = [ACC,SN,SP,PPV,NPV,F1,MCC];
R=[];
R=[aa;bb;cc;dd;ee];  
  