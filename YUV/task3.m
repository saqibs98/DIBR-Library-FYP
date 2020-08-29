expNo=8;
[LC,RC,LD,RD,width,height,totF,baseline,zN,zF,f]=loadData(expNo);
% filenameL  = "B_Left_Virtual_View.yuv";
% filenameR  = "B_Right_Virtual_View.yuv";
filenameM  = "Newspaper_vM_4_1024x768.yuv";
filenameD  = "Newspaper_vDM_4_1024x768.yuv";


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
Uld=Uld{1};
Vld=Vld{1};

Yrd=Yrd{1};
Urd=Urd{1};
Vrd=Vrd{1};


 %computing depth
depthLeft = 1./(Yld/255*(zN - zF) + zF);

depthRight = 1./(Yrd/255*(zN - zF) + zF);

%% computing left virtual view
           [VlY,VlU,VlV,VlD,shiftL,holesL] = leftVirtualView(Yl{1},Ul{1},Vl{1},f,baseline,depthLeft,width,height);
%            im = yuv2rgb(VlY,VlU,VlV);
%            figure, imshow(im);
           %yuv_export(VlY',VlU',VlV',filenameL,1);
%% computing right virtual view
          [VrY,VrU,VrV,VrD,shiftR,holesR] = rightVirtualView(Yr{1},Ur{1},Vr{1},f,baseline,depthRight,width,height);
           %yuv_export(VrY',VrU',VrV',filenameR,1);
%  % computing merge view
          [YM,UM,VM,depthMerge,holesV] = merge(VlY,VlU,VlV,VrY,VrU,VrV,VlD,VrD,height,width,holesL,holesR);
%           yuv_export(YM',UM',VM',filenameM,1);
          YMD=1./(zN-zF)*(255./depthMerge)-(255*zF);
%           yuv_export(YMD',Urd,Urd,filenameD,1);
 % holes filling
%           zInvL=1./depthLeft;
%           zInvR=1./depthRight;
%           [YM,UM,VM] = InverseMapping(Yl{1,1},Ul{1,1},Vl{1,1},Yr{1,1},Ur{1,1},Vr{1,1},YM,UM,VM,Yld,Yrd,VMD,holesV,shiftL,shiftR,zInvL,zInvR,f,baseline,height,width);
%           yuv_export(YM',UM',VM',filenameH,1);
%            
end          

