function lab=Recognize(image,Train,Train_Label,k)
image=im2double(image);
image=image(:);

[P,C]=KLTransform(Train,k);
lab=Classification(image,Train_Label,P,C);

% Projected=P'*image;
% 
% d=pdist2(C,Projected);
%     
%     
%     m=min(d);
%     
%     index=find(d==m);
%     index;
%     Labels(i)=Train_Label(index(1));
end