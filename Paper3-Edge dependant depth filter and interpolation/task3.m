expNo=8;
[LC,RC,LD,RD,width,height,totF,baseline,zN,zF,f]=loadData(expNo);
% filenameL  = "B_Left_Virtual_View.yuv";
% filenameR  = "B_Right_Virtual_View.yuv";
filenameM  = "Newspaper_vM_4_1024x768.yuv";
filenameD  = "Newspaper_vDM_4_1024x768.yuv";


for i=0:totF-1
    %read merge view
[Ym,Um,Vm] =  yuv_import(MC,[width height],1,i);   %i,1
    %read merge depth
[Ymd,Umd,Vmd] =  yuv_import(MD,[width height],1,i);


Ynd=Ymd{1};
Umd=Umd{1};
Vmd=Vmd{1};


 %computing depth
depthMerge = 1./(Ymd/255*(zN - zF) + zF);


%% generating left virtual view
           [VlY,VlU,VlV,VlD,shiftL,holesL] = leftVirtualView(Ym{1},Um{1},Vm{1},f,baseline,depthMerge,width,height);
%            im = yuv2rgb(VmY,VmU,VmV);
%            figure, imshow(im);
           %yuv_export(VlY',VlU',VlV',filenameL,1);
%% computing right virtual view
          [VrY,VrU,VrV,VrD,shiftR,holesR] = rightVirtualView(Ym{1},Um{1},Vm{1},f,baseline,depthMerge,width,height);
           %yuv_export(VrY',VrU',VrV',filenameR,1);
%           yuv_export(YMD',Urd,Urd,filenameD,1);
 % holes filling
%           zInvL=1./depthLeft;
%           zInvR=1./depthRight;
%           [YM,UM,VM] = InverseMapping(Yl{1,1},Ul{1,1},Vl{1,1},Yr{1,1},Ur{1,1},Vr{1,1},YM,UM,VM,Yld,Yrd,VMD,holesV,shiftL,shiftR,zInvL,zInvR,f,baseline,height,width);
%           yuv_export(YM',UM',VM',filenameH,1);
%            
end          

