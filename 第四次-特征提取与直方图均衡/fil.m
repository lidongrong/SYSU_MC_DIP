function output=fil(image,f)

image=im2double(image);

[height,width]=size(image);

output=zeros(height,width);

background=zeros(height+2,width+2);

background(2:height+1,2:width+1)=image;

for i=1:height
    for j=1:width
        neighbour=background(i:i+2,j:j+2);
        %neighbour
        output(i,j)=Convolute(f,neighbour);
        
    end
end

end