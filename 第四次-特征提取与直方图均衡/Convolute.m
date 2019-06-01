function c=Convolute(x,y)

x=x(:);
y=y(:);
x=flip(x);

c=x'*y;

if c<0
    c=0;
end


end