function [Cmin,YMD]= FillDiscocclusions(YMD,height,width)
 Cmin(height,width)= double(zeros);
%    boundary=0;
   row1=0;
   row2=0;
   row3=0;
   row4=0;
   row5=0;
   col1=0;
   col2=0;
 array(5,2)=double(zeros);
 cminVal = 0;%storing minimum value of  array C for cmin
  for i= 1:height
    for j= 1:width
             if(YMD(i,j)==0) %find hole
%                  boundary=YMD(i,j-1);   % go 1 col behind i.e boundary
                 row1=i-2;
                 row2=i-1;
                 row3=i;
                 row4=i+1;
                 row5=i+2;
                 %taking previous value from hole
                 col2=j-1;
                 col1=j-2;
                 if(row1>0 && row2>0 && row3>0 && row4>0 && row5>0 && col1>0 && col2>0)
                    if(col1<width && col2<width && row1<768 && row2<768 && row3<768 && row4<768 && row5<768) 
                         array(1,1)=YMD(row1,col1);
                         array(1,2)=YMD(row1,col2);
                         array(2,1)=YMD(row2,col1);
                         array(2,2)=YMD(row2,col2);
                         array(3,1)=YMD(row3,col1);
                         array(3,2)=YMD(row3,col2);
                         array(4,1)=YMD(row4,col1);
                         array(4,2)=YMD(row4,col2);
                         array(5,1)=YMD(row5,col1);
                         array(5,2)=YMD(row5,col2);   

                         [idx,C] = kmeans(array,2);
                         
                         if(C(1,1) == 0)
                               cminVal = C(2,1);
                               
                         elseif(C(1,1) < C(2,1) && C(1,1) ~= 0 )
                             
                               cminVal = C(1,1);
                               
                         elseif(C(2,1) == 0)
                             
                               cminVal = C(1,1);
                               
                         elseif(C(2,1) < C(1,1) && C(2,1) ~= 0 )
                             
                               cminVal = C(2,1);
                         end
                         
                          if (cminVal<= array(3,2))  %array(3,2) represents the boundary value of hole
                              YMD(i,j) = array(3,2);
                              Cmin(i,j)= array(3,2);
                          else
                              YMD(i,j) = cminVal;
                              Cmin(i,j)= cminVal;
                          end
                    end
                 end
             
             else
                 if(col1<width && col2<width && row1<768 && row2<768 && row3<768 && row4<768 && row5<768)
                    Cmin(i,j)=1;
                 end
             end
    end 
  end
end
