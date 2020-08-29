function [YMD,boundaryC] = sprite_update(YMD,UM,VM,depthMerge,holesV,sortedC_min,height,width)


sizeOFCmin = length(sortedC_min);
checkEvenOrOdd=mod(sizeOFCmin,2);
if (checkEvenOrOdd==1)
    cMedian=sortedC_min((sizeOFCmin+1)/2);
else
   cMedian=(sortedC_min(sizeOFCmin/2)+sortedC_min((sizeOFCmin/2)+1))/2;
end
% creating boundary 
boundaryC=boundary(YM,UM,VM,depthMerge,holesV,height,width,cMedian);

for i=1:height
    for j=1:width
        if(YMD(i,j)<cMedian)
            YMD(i,j)=1;
        end
    end
 end
end
