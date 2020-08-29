function [] = sprite_update(C_min,height,width)

for i=1:height
  for j=1:width 
          arr((i-1)*width + j) = C_min(i,j);
  end 
end
y=1;
z=0;
for x=1:length(arr) %eleminating zeros
    if(arr(x)==-1)
      z=z+1;
    else
      arr(y)=arr(x);%copying array in array to save time, it can be copied in new array
      y=y+1;
    end
end
a=length(arr)-z;% "a" representing the number of values without -1 
arr2=ones(a,1); %created an array having all values of array2 without -1
arr2=arr(1:a);

sortedC_min = sort(arr2);

end
