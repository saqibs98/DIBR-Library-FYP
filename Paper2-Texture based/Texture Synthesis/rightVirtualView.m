% left_virtual_view
function [rightvirtualviewY,rightvirtualviewU,rightvirtualviewV,rightvirtualviewRD,shiftR,holesR] = rightVirtualView(Yr,Ur,Vr,f,baseline,depthRight,width,height)

 rightvirtualviewY(height,width)= double(zeros); 
 rightvirtualviewRD(height,width)= double(zeros);

 [Hu,Wu]= size(Ur);
 rightvirtualviewU(Hu,Wu)= double(zeros);
 rightvirtualviewV(Hu,Wu)= double(zeros);
 
   shiftR(height,width)= double(zeros);
   holesR(height,width)= double(zeros);

             
 for k = 1: height
	for j = width: -1: 1
   % for j = 1:width
        shiftRight = (f*baseline)./depthRight(k,j);
       	index = round(j+shiftRight);
        if (index  < width) && (index > 0)

            rightvirtualviewY(k,index)=Yr(k,j);
            rightvirtualviewRD(k,index)=depthRight(k,j);
            holesR(k,index)=1; % holes filling

            %end
            a=ceil(k/2);
            b=ceil(j/2);
            rightvirtualviewU(a,round(index/2))=Ur(a,b);
            rightvirtualviewV(a,round(index/2))=Vr(a,b);  
            
            shiftR(k,index)=j; % shift

        end
    end
 end

end
