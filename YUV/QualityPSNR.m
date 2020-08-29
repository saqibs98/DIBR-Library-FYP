expNo=7;
[VirtualView,OriginalView,width,height,totF]=loadData(expNo);

% val1(totF)= double(zeros);
% val2(totF)= double(zeros);
% val3(totF)= double(zeros);
% val4(totF)= double(zeros);
% val5(totF)= double(zeros);
% val6(totF)= double(zeros);
% val7(totF)= double(zeros);
% val8(totF)= double(zeros);
% val9(totF)= double(zeros);
val10(totF)= double(zeros);

 for i=1:totF
%%%% ------------ extracting single frame from a video
[Yv,Uv,Vv] =  yuv_import(VirtualView,[width height],1,i-1);
 Yv=Yv{1};
[Yo,Uo,Vo] =  yuv_import(OriginalView,[width height],1,i-1);
 Yo=Yo{1};
%err(i) = immse(uint8(Yv),uint8(Yo));
%PSNRval(i) =snr(uint8(Yv),uint8(Yo));
%PSNRval(i)= vifp_mscale(Yo,Yv);
%PSNRval(i)= ifcvec(Yo,Yv);
%  val1(i)= metrix_mux((Yo),(Yv),'PSNR' );
%  val2(i)= metrix_mux((Yo),(Yv),'NQM' );
%  val3(i)= metrix_mux((Yo),(Yv),'SNR' );
%  val4(i)= metrix_mux((Yo),(Yv),'SSIM' );
%  val5(i)= metrix_mux((Yo),(Yv),'VSNR' );
%  val6(i)= metrix_mux((Yo),(Yv),'UQI' );
%  val7(i)= metrix_mux((Yo),(Yv),'WSNR' );
%  val8(i)= metrix_mux((Yo),(Yv),'IFC' );
%  val9(i)= metrix_mux((Yo),(Yv),'MSSIM' );
 val10(i)= metrix_mux((Yo),(Yv),'VIF' );
 
 %PSNRval(i)= mssim_index(Yo,Yv );
 
 end
% val1=val1.';
% val2=val2.';
% val3=val3.';
% val4=val4.';
% val5=val5.';
% val6=val6.';
% val7=val7.';
% val8=val8.';
% val9=val9.';
val10=val10.';