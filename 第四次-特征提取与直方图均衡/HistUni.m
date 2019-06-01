function output=HistUni(image)

imax=max(max(image));
imin=min(min(image));

[height,width]=size(image);

probability=zeros(256,1);

for i=1:height
    for j=1:width
        probability(image(i,j)+1)=probability(image(i,j)+1)+1;
    end
end

probability=probability/(height*width);

output=zeros(height,width);

for i=1:height
    for j=1:width
    output(i,j)=(255)*(sum(probability(1:image(i,j))));
    end
end

output=im2double(output);
output=output/255;

end