expNo=11;
[LC,RC,LD,RD,width,height,totF,baseline,zN,zF,f,zNr,zFr,virtual_View_Sequence_Name]=loadData(expNo);
 %% calling inverse wrapping
 %%where LC is the Left camera view 
 %%RC is the Right camera view
 %%LD is the Left Depth of the Left camera view
 %%RD is the RIGHT Depth of the RIGHT camera view
 %%TotF is the Total nummbers of frames in the video 
 %%zN,zF is the zNear and zFar of the video and for the videos having zNearLeft,zFarLeft,zNearRight,zFarRight
 %%the value will recieve in zN,zF,zNr,zNf respectively
 %So,if the Sequence donot have these parameter ,it will by defualt assign
 %%it zero and will only use zN and zF

 %Warpping(LC,RC,LD,RD,width,height,totF,baseline,zN,zF,f,zNr,zFr,virtual_View_Sequence_Name);

 
  %% calling peaksnr Function 
  %%the final value of peakSnr for each frame will be received in array
  %%called "peak" starting from first index to Total number of frames
   
  virtual_View='D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\GTF\GT_Fly_v_5_1920x1088.yuv';
  orginal_View='D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\GTF\GT_Fly_c_5_1920x1088.yuv';
  
%  [peak]=peakFunc(totF,height,width,virtual_View,orginal_View);
  [psnr]=MetrixCal(totF,height,width,virtual_View,orginal_View);
  %[wsnr]=MetrixCal(totF,height,width,virtual_View,orginal_View,'wsnr');
  %[vif]=MetrixCal(totF,height,width,virtual_View,orginal_View,'vif'); 

