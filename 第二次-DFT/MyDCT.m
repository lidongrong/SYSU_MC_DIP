function output=MyDCT(image)

e=exp(1);

s=size(image);
if size(s)>2
    image=rgb2gray(image);
end

image=im2double(image);

s=size(image);
i_height=s(1);
i_width=s(2);

    function y=c(u,n)
        if u==0
            y=sqrt(1/n);
        else
            y=sqrt(2/n);
        end
    end

G1=zeros(i_height,i_height);
G2=zeros(i_width,i_width);

for k=1:i_height
    for j=1:i_height
        G1(k,j)=c(k-1,i_height)*cos(((2*j-1)*pi/(2*i_height))*(k-1));
    end
end

for k=1:i_width
    for j=1:i_width
        G2(k,j)=c(j-1,i_width)*cos(((2*k-1)*pi/(2*i_width))*(j-1));
    end
end

output=G1*image*G2;

end