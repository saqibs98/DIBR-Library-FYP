% left_virtual_view
function [leftvirtualviewY,leftvirtualviewU,leftvirtualviewV,leftvirtualviewLD,shiftL,holesL] = leftVirtualView(Yl,Ul,Vl,f,baseline,depthLeft,width,height)

 leftvirtualviewY(height,width)= double(zeros);
 leftvirtualviewLD(height,width)= double(zeros);
 [Hu,Wu]= size(Ul);
 %[Hu,Wu]= size(Vl);
  
 leftvirtualviewU(Hu,Wu)= double(zeros);
 leftvirtualviewV(Hu,Wu)= double(zeros);
 
 shiftL(height,width)= double(zeros);
 holesL(height,width)= double(zeros);

 for k = 1: height
	for j = 1:width
        shiftLeft = (f*baseline)./depthLeft(k,j);     % computing shift
       	index = round(j-shiftLeft);
        if ((index < width) && (index > 0))
            leftvirtualviewY(k,index)=Yl(k,j);
            holesL(k,index)=1; % holes filling

            % computing depth
            leftvirtualviewLD(k,index)=depthLeft(k,j);
           
            a=round(k/2);
            b=round(j/2);
            leftvirtualviewU(a,round(index/2))=Ul(a,b);
            leftvirtualviewV(a,round(index/2))=Vl(a,b);
            
            shiftL(k,index)=j; % shift
        end
    end
 end

end