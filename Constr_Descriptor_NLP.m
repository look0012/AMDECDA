

for i = 1:size(circRNA_NLP,1)
    circRNA_NLP(i,:)=mapminmax(circRNA_NLP(i,:),0,1);
end


[aa,bb]=pca(circRNA_NLP);
cc=circRNA_NLP*aa(:,1:23);  
circRNA_NLP=cc;


data_DCT=[zeros(1478,1),data_DCT,zeros(1478,23)];
data_DCT_N=[zeros(65375,1),data_DCT_N,zeros(65375,23)];

for i=1:739  
    i
    data_DCT(i,1)=1;
    node_RNA=CircR2Disease_P{i,1};
    RNA_Num=Search_Node(node_RNA,'RNA',disease,circRNA);
    data_DCT(i,2:785)=[data_DCT(i,2:762),circRNA_NLP(RNA_Num,:)];
end

for i=740:1478  
    i
    data_DCT(i,1)=-1;
    node_RNA=CircR2Disease_N{i-739,1};
    RNA_Num=Search_Node(node_RNA,'RNA',disease,circRNA);
    data_DCT(i,2:785)=[data_DCT(i,2:762),circRNA_NLP(RNA_Num,:)];
end


for i=1:65374  
    i
    data_DCT_N(i,1)=-1;
    node_RNA=CircR2Disease_ALL_N{i,1};
    RNA_Num=Search_Node(node_RNA,'RNA',disease,circRNA);
    data_DCT_N(i,2:785)=[data_DCT_N(i,2:762),circRNA_NLP(RNA_Num,:)];
end



