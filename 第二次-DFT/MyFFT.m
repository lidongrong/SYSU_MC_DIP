function [r,im,phi,ang,output]=MyFFT(image)

%example:
%[a,b,c]=MyFFT(lena);
%imshow(log(1+c),[])

e=exp(1);

s=size(image);
if size(s)>2
    image=rgb2gray(image);
end

image=im2double(image);

s=size(image);
i_height=s(1);
i_width=s(2);

G1=zeros(i_height,i_height);
G2=zeros(i_width,i_width);

for k=1:i_height
    for j=1:i_width
        image(k,j)=image(k,j)*((-1)^(k+j-2));
    end
end

for k=1:i_height
    for j=1:i_width
        G1(k,j)=e^(-i*2*pi*(k-1)*(j-1)/i_height);
        G2(k,j)=e^(-i*2*pi*(k-1)*(j-1)/i_width);
    end
end

output=G1*image*G2;
size(output);

r=real(output);
im=imag(output);
phi=abs(output);
ang=angle(output);

end

