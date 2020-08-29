expNo=8;
[LC,RC,LD,RD,width,height,totF,baseline,zN,zF,f,MergeView,MergeViewDepth]=loadData(expNo);
% filenameL  = "B_Left_Virtual_View.yuv";
% filenameR  = "Newspaper_vR_4_1024x768.yuv";
% filenameM  = "Newspaper_vM_4_1024x768.yuv";
% filenameD  = "Newspaper_vDM_4_1024x768.yuv";
% filenameLD  = "Newspaper_vLDM_4_1024x768.yuv";
% filenameRD  = "Newspaper_vRDM_4_1024x768.yuv";

 filenameP  = "Newspaper_vDM_4_Filling_finalAttempt1_1024x768.yuv";

%filenameR  = "Newspaper_vR_4_1024x768.yuv";
%holesV(768,1024)
for i=0:totF-1
    %read left view
[YM,UM,VM] =  yuv_import(MergeView,[width height],1,i);   %i,1
[YMD,UMD,VMD]=yuv_import(MergeViewDepth,[width height],1,i);


YMD=YMD{1};
UMD=UMD{1};
VMD=VMD{1};
%[C_min,YMD]= Filling_Discocclusions(YMD,height,width);
[C_min,YMD]= filling(YMD,height,width);
sprite_update(C_min,height,width);
%yuv_export(YMD',UMD,VMD,filenameP,1);   
end

% for i=0:totF
%     
% end

%  %computing depth
% depthLeft = 1./(Yld/255*(zN - zF) + zF);
% 
% depthRight = 1./(Yrd/255*(zN - zF) + zF);
% 
% %% computing left virtual view
%             [VlY,VlU,VlV,VlD,shiftL,holesL] = leftVirtualView(Yl{1},Ul{1},Vl{1},f,baseline,depthLeft,width,height);
%            % yuv_export(VlD,Urd,Urd,filenameLD,1);
% 
%             % %            im = yuv2rgb(VlY,VlU,VlV);
% % %            figure, imshow(im);
% %            yuv_export(VlY',VlU',VlV',filenameL,1);
% %% computing right virtual view
%            [VrY,VrU,VrV,VrD,shiftR,holesR] = rightVirtualView(Yr{1},Ur{1},Vr{1},f,baseline,depthRight,width,height);
% %            %yuv_export(VrY',VrU',VrV',filenameR,1);
% %           yuv_export(VrD,0,0,filenameRD,1);
% % 
% %  % computing merge view
%           [YM,UM,VM,depthMerge,holesV] = merge(VlY,VlU,VlV,VrY,VrU,VrV,VlD,VrD,height,width,holesL,holesR);
%           yuv_export(YM',UM',VM',filenameM,1);
%           YMD=1./(zN-zF)*(255./depthMerge)-(255*zF);
%           yuv_export(YMD',Urd,Urd,filenameD,1);
% 
%  % holes filling
% %           zInvL=1./depthLeft;
% %           zInvR=1./depthRight;
% %           [YM,UM,VM] = InverseMapping(Yl{1,1},Ul{1,1},Vl{1,1},Yr{1,1},Ur{1,1},Vr{1,1},YM,UM,VM,Yld,Yrd,VMD,holesV,shiftL,shiftR,zInvL,zInvR,f,baseline,height,width);
% %           yuv_export(YM',UM',VM',filenameH,1);
% %            
% end          
