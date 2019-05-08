function Labeled=Classification(Test,Train_Label,Projector,Coordinates,People_Num)
%label the test set with the training label, projector and coordinates

if nargin<5
    People_Num=9;
end

s=size(Test);
T_row=s(1);
T_col=s(2);

s1=size(Projector);
Pro_dim=s1(2);
Pro_Num=s1(1);



%Calculate the projected vectors of the test set
Projected=(Projector')*Test;

%initialize the labels
Labels=zeros(T_col,1);

%use the nearst neighbourhood method to label the test set
for i=1:T_col
    d=pdist2(Coordinates',Projected(:,i)');
    
    
    m=min(d);
    
    index=find(d==m);
    index;
    Labels(i)=Train_Label(index(1));
end

Labeled=Labels;

end
