function image=LowRecon(f,scale)
%example:
%c=fft2(lena)
%c=fftshift(c)
%ori=LowRecon(c)
%imshow(real(ori),[])

e=exp(1);

s=size(f);
i_height=s(1);
i_width=s(2);

tmp=f(i_height/2-scale/2:i_height/2+scale/2,i_width/2-scale/2:i_width/2+scale/2);
f=f-f;
f(i_height/2-scale/2:i_height/2+scale/2,i_width/2-scale/2:i_width/2+scale/2)=tmp;

G3=zeros(i_height,i_height);
G4=zeros(i_width,i_width);

for k=1:i_height
    for j=1:i_width
        G3(k,j)=e^(i*2*pi*(k-1)*(j-1)/i_height);
        G4(k,j)=e^(i*2*pi*(k-1)*(j-1)/i_width);
    end
end

image=G3*f*G4;
end