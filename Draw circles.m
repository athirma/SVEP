
width =1000;
height = 1000;
% The number of circles
% circleNumber = length(Huayuan);
circleNumber = length(Huayuan);

paras = zeros(circleNumber, 3);
num = 0;
hold on
while num < circleNumber
num=num+1;
 %r = log(Huayuan(num,1));
    r = Huayuan(num,1)/2;
 %  r = 1;

    xPos = rand*(width-2*r) + r;
    yPos = rand*(height-2*r) + r;
    paras(num,:) = [xPos, yPos, r];
    if num >= 1
        xs = paras(1:num - 1, 1);
        ys = paras(1:num - 1, 2);
        rs = paras(1:num - 1, 3);
        dist1 = sqrt((xPos - xs).^2 + (yPos - ys).^2);
        dist2 = abs(r + rs);
        if all(dist1 > dist2)
         rectangle('Position', [xPos-r, yPos-r, 2*r, 2*r], 'Curvature', [1 1],'facecolor',Huayuan(num,2:4));
   
                   axis equal
                   
        else

            temp = 0;
            maxTry = 1000;
            while any(dist1 <= dist2) && temp < maxTry
                temp = temp + 1;
                    r = Huayuan(num,1)/2;

               % r=1;
                xPos = rand*(width-2*r) + r;
                yPos = rand*(height-2*r) + r;
                paras(num,:) = [xPos,yPos,r];
                
                dist1 = sqrt((xPos - xs).^2 + (yPos - ys).^2);
                dist2 = abs(r + rs);
            end
            

            if all(dist1 > dist2)
           rectangle('Position', [xPos-r, yPos-r, 2*r, 2*r], 'Curvature', [1 1],'facecolor',Huayuan(num,2:4));

                axis equal
            end
        end
    end
   
     set(gca,'LineWidth',2);
     set(gca,'XTick',[0:200:1000]);
     set(gca,'XLim',[0 1000]);
     set(gca,'YTick',[0:200:1000]);
     set(gca,'YLim',[0 1000]);
     set(gca,'FontName','Arial','FontSize',15)

end
box on
hold on