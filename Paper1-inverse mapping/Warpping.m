function [] = Warpping(LC,RC,LD,RD,width,height,totF,baseline,zN,zF,f,zNrr,zFrr,filenameH)
if nargin > 11
  zNr = zNrr;
  zFr = zFrr;
else
    zNr = 0;
    zFr = 0;
end

for i=0:totF-1
    %read left view
[Yl,Ul,Vl] =  yuv_import(LC,[width height],1,i);   %i,1
    %read right view
[Yr,Ur,Vr] =  yuv_import(RC,[width height],1,i);
    %read left depth
[Yld,Uld,Vld] =  yuv_import(LD,[width height],1,i);
    %read right depth
[Yrd,Urd,Vrd] =  yuv_import(RD,[width height],1,i);
Yld=Yld{1};
Yrd=Yrd{1};

%% Checking either the incoming zN is array or just a single value
[r,c] = size(zN);
if (r > 1) || (c > 1)
    xscalar = 0;
else
    xscalar = 1;
end
   if(xscalar==1)   
%% for simple sequences 
    %computing depth
    depthLeft = 1./(Yld/255*(zN - zF) + zF);

    depthRight = 1./(Yrd/255*(zN - zF) + zF);

    %% computing left virtual view
           [VlY,VlU,VlV,VlD,shiftL,holesL] = leftVirtualView(Yl{1},Ul{1},Vl{1},f,baseline,depthLeft,width,height);
    %% computing right virtual view
          [VrY,VrU,VrV,VrD,shiftR,holesR] = rightVirtualView(Yr{1},Ur{1},Vr{1},f,baseline,depthRight,width,height);
    %% computing merge view
          [YM,UM,VM,VMD,holesV] = merge(VlY,VlU,VlV,VrY,VrU,VrV,VlD,VrD,height,width,holesL,holesR);
    %% holes filling
          zInvL=1./depthLeft;
          zInvR=1./depthRight;
          [YMM,UMM,VMM,finalholes] = InverseMapping(Yl{1,1},Ul{1,1},Vl{1,1},Yr{1,1},Ur{1,1},Vr{1,1},YM,UM,VM,Yld,Yrd,VMD,holesV,shiftL,shiftR,zInvL,zInvR,f,baseline,height,width);
          yuv_export(YMM',UMM',VMM',filenameH,1);
   else
   %% for dancer and GTF
   zNearL=1./zN(i+1);
   zFarL=1./zF(i+1);
   zNearR=1./zNr(i+1);
   zFarR=1./zFr(i+1);
    %computing depth
    depthLeft = 1./(Yld/255*(zNearL - zFarL) + zFarL);
    depthRight = 1./(Yrd/255*(zNearR - zFarR) + zFarR);
    %% computing left virtual view
           [VlY,VlU,VlV,VlD,shiftL,holesL] = leftVirtualView(Yl{1},Ul{1},Vl{1},f,baseline(i+1),depthLeft,width,height);
    %% computing right virtual view
          [VrY,VrU,VrV,VrD,shiftR,holesR] = rightVirtualView(Yr{1},Ur{1},Vr{1},f,baseline(i+1),depthRight,width,height);
    %% computing merge view
          [YM,UM,VM,VMD,holesV] = merge(VlY,VlU,VlV,VrY,VrU,VrV,VlD,VrD,height,width,holesL,holesR);
    %% holes filling
          zInvL=1./depthLeft;
          zInvR=1./depthRight;
          [YMM,UMM,VMM,finalholes] = InverseMapping(Yl{1,1},Ul{1,1},Vl{1,1},Yr{1,1},Ur{1,1},Vr{1,1},YM,UM,VM,Yld,Yrd,VMD,holesV,shiftL,shiftR,zInvL,zInvR,f,baseline(i+1),height,width);
          yuv_export(YMM',UMM',VMM',filenameH,1);
   end                    
end
end

