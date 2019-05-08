function image=DCTHighRecon(f,scale)

s=size(f);
i_height=s(1);
i_width=s(2);

f(1:scale,1:scale)=0;

G1=zeros(i_height,i_height);
G2=zeros(i_width,i_width);

    function y=c(u,n)
        if u==0
            y=sqrt(1/n);
        else
            y=sqrt(2/n);
        end
    end

for k=1:i_height
    for j=1:i_height
        G1(k,j)=c(j-1,i_height)*cos((2*k-1)*pi*j/(2*i_height));
    end
end

for k=1:i_width
    for j=1:i_width
        G2(k,j)=c(k-1,i_width)*cos((2*j-1)*pi*k/(2*i_width));
    end
end

image=G1*f*G2;

end
