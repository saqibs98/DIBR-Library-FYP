function [Cmin,Cmax,YMD] = filling_Disocclusion_Depth_Map(YMD,holesV)
M=5;
N=5;
checkup=2;
checklow=2;
[u,v]=find(holesV==0);
k=size(u);
for i=1:k
  x=u(i);
  if((v(i)-1)<1)
      o=v(i);
  else
      o=v(i)-1;
      if(x-checkup>=1 && o-checklow>=1 && x+checkup<=768 && o+checklow<=1024)
    
     [Cmin,Cmax]=kmeanClustingMxN(YMD,x,o);
     value=1024-o;
     index=Cmin(value);
         if(YMD(x,o)<=index)
           YMD(x,o+1)=YMD(x,o);
         else
          YMD(x,o+1)=index;   
         end  
     holesV(x,o+1)=1;
      end
  
  
    
   end  
    
end          
11,11------11,15
15,11------15,15

end

