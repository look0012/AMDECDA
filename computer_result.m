
R=[];
 
[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(final_f1,IC_f1_test_label );
aa = [ACC,SN,SP,PPV,NPV,F1,MCC];
[auc1,x,y] = plot_roc2(final_f1,IC_f1_test_label);
R=[R;aa,auc1];  
  
[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(final_f2,IC_f2_test_label );
bb = [ACC,SN,SP,PPV,NPV,F1,MCC];
[auc2,x,y] = plot_roc2(final_f2,IC_f2_test_label);
R=[R;bb,auc2];  

[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(final_f3,IC_f3_test_label );
cc = [ACC,SN,SP,PPV,NPV,F1,MCC];
[auc3,x,y] = plot_roc2(final_f3,IC_f3_test_label);
R=[R;cc,auc3];  

[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(final_f4,IC_f4_test_label );
dd = [ACC,SN,SP,PPV,NPV,F1,MCC];
[auc4,x,y] = plot_roc2(final_f4,IC_f4_test_label);
R=[R;dd,auc4];  

[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(final_f5,IC_f5_test_label );
ee = [ACC,SN,SP,PPV,NPV,F1,MCC];
[auc5,x,y] = plot_roc2(final_f5,IC_f5_test_label);
R=[R;ee,auc5];  