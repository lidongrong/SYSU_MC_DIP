function image=LowFreRecon(f,scale)
%example:
%c=fft2(lena)
%ori=LowFreRecon(c)
%imshow(real(ori),[])

e=exp(1);

s=size(f);
i_height=s(1);
i_width=s(2);

f(1:scale/2,1:scale/2)=0;
f(i_height-scale/2:i_height,1:scale/2)=0;
f(1:scale/2,i_width-scale/2:i_width)=0;
f(i_height-scale/2,i_width-scale/2:i_width)=0;

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