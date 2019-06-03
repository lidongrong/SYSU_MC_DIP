
image=im2double(image);
[u,v]=meshgrid(-10:0.04:10,0:0.04:10);
w=u.^2+v.^2;

for i=1:length(u(1,:))
    for j=1:length(v(:,1))
        if u(1,i).^2+v(j,1).^2<10 | u(1,i).^2+v(j,1).^2>100
            w(j,i)=nan;
        end
    end
end

R=length(u(1,:))/2;

[m,n,k]=size(rose);

colormap=zeros(length(v(:,1)),length(u(1,:)),3);

for i=1:n
    for j=1:m
        x=i;
        y=j;
 
        r=sqrt(R)+(y/(m))*(R-sqrt(R));
        theta=pi*x/(n);
        ux=r*cos(theta);
        vy=r*sin(theta);
        

        ux=R+ux;
        vy=vy;
        
        ux=round(ux)+1;
        vy=round(vy)+1;
        
        ux
        vy
        
        colormap(vy,ux,1)=rose(j,i,1);
        colormap(vy,ux,2)=rose(j,i,2);
        colormap(vy,ux,3)=rose(j,i,3);
        
    end
end

for i=1:3
    colormap(:,:,i)=colormap(:,:,i)/max(max(colormap(:,:,i)));
    
end

colormap=colormap(1:251,1:501,:);


%edge
[h,g,at]=size(colormap);

background=zeros(h+2,g+2,3);

background(2:h+1,2:g+1,:)=colormap;

for i=2:h+1
    for j=2:g+1
        r=((i-1)^2+(j-1-R)^2);
        if r>=R & r<=R^2
            tmp=background(i,j,:);
            if sum(tmp)<0.01
                background(i,j,1)=sortfilter(background(i-1:i+1,j-1:j+1,1));
                background(i,j,2)=sortfilter(background(i-1:i+1,j-1:j+1,2));
                background(i,j,3)=sortfilter(background(i-1:i+1,j-1:j+1,3));
            end
            
        end
    end
end

colormap=background(2:h+1,2:g+1,:);






% % for i=1:length(x(1,:))
% %     for j=1:length(y(:,1))
% %         i
% %         j
% %         if x(1,i).^2+y(j,1).^2<10 | x(1,i).^2+y(j,1).^2>100
% %             z(j,i)=nan;
% %         end
% %     end
% % end


