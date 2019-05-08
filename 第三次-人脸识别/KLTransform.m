function [Projector,Coordinates]=KLTransform(Train,k,People_Num)
%Return the projection matrix and coordinates of samples after projecting
%Train is the trainning set
%k is the number of eigen vectors we would like to preserve

if nargin<3
    People_Num=9;
end

%count the sample mean
t=Train';
Avg=mean(t);
Avg=Avg';


s=size(Train);
col=s(2);
row=s(1);

Avg=repmat(Avg,1,col);

%Calculate the covariance Matrix
Sigma=Train*(Train');
Conver=((Train-Avg)')*(Train-Avg);

%eigen vectors and eigen values
[vectors,values]=eig(Conver);

vectors=Train*vectors;
values=diag(values);

%initialize the projector,put the k largest eigen vectors into the
%Projection matrix
Projector=zeros(row,k);
for i=1:k
    lambda=max(values);
    index=find(values==lambda);
    Projector(:,i)=vectors(:,index);
    values(index)=0;
    Projector(:,i)=Projector(:,i)/norm(Projector(:,i));
end

%Return the Coordinates after projection into low-dimension spaces
Coordinates=(Projector)'*Train;


end

