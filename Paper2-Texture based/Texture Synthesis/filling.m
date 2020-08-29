function [YMD,sortedC_min,holesV]= filling(YMD,height,width,holesV)

   row1=0;
   row2=0;
   row3=0;
   row4=0;
   row5=0;
   col1=0;
   col2=0;
   col3=0;
   col4=0;
   col5=0;

 array(5,5)=double(zeros);
 array2(25,1)=double(zeros);
   cminVal = 0; %storing minimum value of  array C for cmin
   meanValue = 0;
   
   %inilizaating the size of cmin array by finding the size of holesV array
   %because we calcute the kmeans on the boundary of the holes .
 [u,v]=find(holesV==0);
cminArraysize=size(u);
Cmin(cminArraysize)= double(zeros);
counterForCmin=1;
 for i= 1:height
    for j= 1:width
       % if(YMD(i,j)==0) %find hole
        if(holesV(i,j)==0) %find hole
       
            row1=i-2;
          row2=i-1;
          row3=i;
          row4=i+1;
          row5=i+2;
          %taking previous value from hole and making 5x5 box on
          %boundary which is (j-1)
          col1=j-3;
          col2=j-2;
          col3=j-1; %boundary value
          col4=j;
          col5=j+1;
          if(row1>0 && row2>0 && row3>0 && row4>0 && row5>0 && col1>0 && col2>0 && col3>0 && col4>0 && col5>0)
            if(col1<width && col2<width && col3<width && col4<width && col4<width && row1<height && row2<height && row3<height && row4<height && row5<height) 
              array(1,1)=YMD(row1,col1);
              array(1,2)=YMD(row1,col2);
              array(1,3)=YMD(row1,col3);
              array(1,4)=YMD(row1,col4);
              array(1,5)=YMD(row1,col5);
              array(2,1)=YMD(row2,col1);
              array(2,2)=YMD(row2,col2);
              array(2,3)=YMD(row2,col3);
              array(2,4)=YMD(row2,col4);
              array(2,5)=YMD(row2,col5);
              array(3,1)=YMD(row3,col1);
              array(3,2)=YMD(row3,col2);
              array(3,3)=YMD(row3,col3); %boundary value
              array(3,4)=YMD(row3,col4);
              array(3,5)=YMD(row3,col5);
              array(4,1)=YMD(row4,col1);
              array(4,2)=YMD(row4,col2);
              array(4,3)=YMD(row4,col3);
              array(4,4)=YMD(row4,col4);
              array(4,5)=YMD(row4,col5);
              array(5,1)=YMD(row5,col1);
              array(5,2)=YMD(row5,col2); 
              array(5,3)=YMD(row5,col3);
              array(5,4)=YMD(row5,col4);
              array(5,5)=YMD(row5,col5);    
              
              
                WIDTH=5;
                HEIGHT=5;
              %converting in 1d array 
                for a=1:HEIGHT
                 for b=1:WIDTH
                    array2((a-1)*WIDTH + b) = array(a,b);
                 end 
                end
              
                y=1;
                z=0;
              for x=1:25 %eleminating zeros
                 if(array2(x)==0)
                    z=z+1;
                 else
                    array2(y)=array2(x);%copying array2(x) in array2(y) to save time, it can be copied in new array3
                    y=y+1;
                 end
              end
                 a=25-z;% "a" representing the number of values without zeros 
              array3=ones(a,1); %created an array having all values of array2 without zeros
              array3=array2(1:a);
              if(length(array3)<=2)
                minimum = 10000;%some big value to start
                for r=1:length(array3)
                   if(minimum>array3(r) && array3(r)~=0)
                      minimum=array3(r);
                   end
                   cminVal=minimum;
                   Cmin(counterForCmin)=cminVal;%storing the value of cmin in array for later purpose
                   counterForCmin=counterForCmin+1;
                end
              else
                 [idx,C] = kmeans(array3,2);
                 if(C(1,1) <= C(2,1))
                   cminVal = C(1,1);
                   Cmin(counterForCmin)=cminVal;%storing the value of cmin in array for later purpose
                   counterForCmin=counterForCmin+1;
                 else
                   cminVal = C(2,1);
                   Cmin(counterForCmin)=cminVal;%storing the value of cmin in array for later purpose
                   counterForCmin=counterForCmin+1;
                 end 
              end
              %equ(1) of paper2
              if (array(3,3)<=cminVal && array(3,3)~=0) %array(3,3) represents the boundary value of hole(Di)                                   
                  YMD(i,j) = array(3,3); 
                  holesV(i,j)=1;%update the holeV array because it is filed by di value
              else
                  YMD(i,j) = cminVal;
                  holesV(i,j)=1;%update the holeV array because it is filed by cminVal value
              end
%               %%%%%%%%%%%formulae for equ (2) 
%              meanValue = Cmin(i,j)* ((array(3,3)+1)/2); %if boundary is odd
%              meanValue = ((Cmin(i,j)* (array(3,3)/2))+(Cmin(i,j)* ((array(3,3)/2)+1)))/2;%if boundary is even
            end
          end
         end
    end 
 end
 sortedC_min = sort(Cmin);
end
   