
CircR2Disease_ALL_N=cell(65361,2); 
k=1;
for i=1:100
   for j=1:661
       Test=A(i,j);
       if Test==0
           CircR2Disease_ALL_N(k,2)=disease(i,1);
           CircR2Disease_ALL_N(k,1)=circRNA(j,1);
           k=k+1;
       end
   end
end



data_DCT=zeros(65374,401);
for i=1:65374 
    i
    data_DCT(i,1)=-1;
    node_Dis=CircR2Disease_ALL_N{i,2};
    node_RNA=CircR2Disease_ALL_N{i,1};
    Dis_Num=Search_Node(node_Dis,'Dis',disease,circRNA);
    RNA_Num=Search_Node(node_RNA,'RNA',disease,circRNA);
    
    data_DCT(i,2:401)=[SD(Dis_Num,:),SC(RNA_Num,:)];
end