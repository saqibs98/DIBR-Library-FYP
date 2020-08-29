function [Yv,Uv,Vv,Ydv,holesV] = merge(ylv,ulv,vlv,yrv,urv,vrv,vld,vrd,height,width,holesL,holesR)
   Yv(height,width)=double(zeros);
   Ydv(height,width)=double(zeros);
     [Hu,Wu]= size(ulv);
   Uv(Hu,Wu)= double(zeros);
   Vv(Hu,Wu)= double(zeros);
   % holes
   holesV(height,width)= double(zeros);
    for i=1:height
         for j=1:width
              a=round(i/2);
              b=round(j/2);
             if (holesL(i,j) == 0  && holesR(i,j) ~=0 )
                   Yv(i,j) = yrv(i,j);
                   Ydv(i,j) = vrd(i,j);
                   Uv(a,b) = urv(a,b);
                   Vv(a,b) = vrv(a,b);
                   holesV(i,j)=1; % holes filling
             elseif (holesL(i,j) ~=0 && holesR(i,j) ==0)
                   Yv(i,j) = ylv(i,j);
                   Ydv(i,j) = vld(i,j);
                   Uv(a,b) = ulv(a,b);
                   Vv(a,b) = vlv(a,b);
                   holesV(i,j)=1; % holes filling


             elseif (holesL(i,j)~= 0 && holesR(i,j)~=0 )
                   Yv(i,j) = 0.5 *(ylv(i,j) + yrv(i,j));
                   Ydv(i,j) = 0.5 *(vld(i,j) + vrd(i,j));
                   Uv(a,b) = 0.5 *(ulv(a,b) + urv(a,b));
                   Vv(a,b) = 0.5 *(vlv(a,b) + vrv(a,b));
                   holesV(i,j)=1; % holes filling
             else
                 
             end
         end
         
    end
end