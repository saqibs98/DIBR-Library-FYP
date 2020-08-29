expNo=8;
[LC,RC,LD,RD,width,height,totF,baseline,zN,zF,f,Merge_View_Sequence_Name,MergeDepth_View_Sequence_Name,Line_Wise_Filling]=loadData(expNo);

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
%% computing right virtual view
          [VrY,VrU,VrV,VrD,shiftR,holesR] = rightVirtualView(Yr{1},Ur{1},Vr{1},f,baseline,depthRight,width,height);
           %yuv_export(VrY',VrU',VrV',filenameR,1);
%  % computing merge view
          [YM,UM,VM,depthMerge,holesV] = merge(VlY,VlU,VlV,VrY,VrU,VrV,VlD,VrD,height,width,holesL,holesR);
       %   yuv_export(YM',UM',VM',Merge_View_Sequence_Name,1);
       %   YMD=1./(zN-zF)*(255./depthMerge)-(255*zF);
       %   yuv_export(YMD',Urd,Urd,MergeDepth_View_Sequence_Name,1);
       
       %importing merge video and depth
      %merge
       [YM,UM,VM] =  yuv_import(Merge_View_Sequence_Name,[width height],1,i);   %i,1
       %depth
       [YMD,UMD,VMD]=yuv_import(MergeDepth_View_Sequence_Name,[width height],1,i);
       
        YMD=YMD{1};
        UMD=UMD{1};%we need this in future
        VMD=VMD{1};%we need this in future
        
        %line wise filling
        [YMD,sortedC_min,holesV]= filling(YMD,height,width,holesV);
        %sprite upate
        [YMD,boundaryC] = sprite_update(YMD,UM,VM,depthMerge,holesV,sortedC_min,height,width);
        %[boundaryC]=boundary(YM,UM,VM,depthMerge,holesV,height,width);
        %yuv_export(YMD',UMD,VMD,Line_Wise_Filling,1);   

%         im = yuv2rgb(YMD,UMD,VMD);
%                 figure, imshow(im)
%          


                
       %Texture_Synthesis(Line_Wise_Filling,Merge_View_Sequence_Name,MergeDepth_View_Sequence_Name,width,height,holesV,totF);
%       ...................................................
end          

