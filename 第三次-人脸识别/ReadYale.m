%function [train,label,test]=ReadYale()
People_Num=15;
People_Type=11;
%15people included, and each has 11 images

%initialize Face,Train,Test,Train_Label,Test_Label
Face=zeros(128,128,People_Num*People_Type);
Train=zeros(128*128,People_Num*People_Type);
Test=zeros(128*128,30);
Train_Label=zeros(People_Num*People_Type,1);
Test_Label=zeros(30,1);

%Read the faces, and also record their labels
for i=1:People_Num
    for j=1:11
        if i<10
            if j<10
                char=['C:\Users\a\Desktop\yale\00',int2str(i),'0',int2str(j),'.bmp'];
            else
                char=['C:\users\a\desktop\yale\00',int2str(i),int2str(j),'.bmp'];
            end
        else
            if j<10
                char=['C:\Users\a\Desktop\yale\0',int2str(i),'0',int2str(j),'.bmp'];  
            else
                cahr=['c:\users\a\desktop\yale\0',int2str(i),int2str(j),'.bmp'];
            end
        end
        temp=imread(char);
        Face(:,:,People_Type*(i-1)+j)=temp;
        Train_Label(People_Type*(i-1)+j)=i;
    end   
end


Face=im2double(Face);

%vectorize the faces, firstly put all vectors into the Trainning set
for i=1:People_Num*People_Type
    tmp=Face(:,:,i);
    Train(:,i)=tmp(:);
end

Cancellation=zeros(30,1);

%Randomly delete some columns of the trainning set and put the 
%deleted data into the test set
for i=1:15
    random_1=unidrnd(11);
    random_2=unidrnd(11);
    while random_1==random_2
        random_1=unidrnd(11);
        random_2=unidrnd(11);
    end
    Test(:,2*(i-1)+1)=Train(:,11*(i-1)+random_1);
    Test(:,2*(i-1)+2)=Train(:,11*(i-1)+random_2);
    Test_Label(2*(i-1)+1)=Train_Label(11*(i-1)+random_1);
    Test_Label(2*(i-1)+2)=Train_Label(11*(i-1)+random_2);
    Cancellation(2*(i-1)+1)=11*(i-1)+random_1;
    Cancellation(2*(i-1)+2)=11*(i-1)+random_2;
    
end


Train(:,Cancellation)=[];
Train_Label(Cancellation)=[];



