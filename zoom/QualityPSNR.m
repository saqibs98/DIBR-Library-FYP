expNo=4;
[VirtualView,OriginalView,width,height,totF]=loadData(expNo);
PSNRval(totF)= double(zeros);
err(totF)=zeros;
 for i=1:10
%%%% ------------ extracting single frame from a video
[Yv,Uv,Vv] =  yuv_import(VirtualView,[width height],1,i-1);
 Yv=Yv{1};
[Yo,Uo,Vo] =  yuv_import(OriginalView,[width height],1,i-1);
 Yo=Yo{1};
%err(i) = immse(uint8(Yv),uint8(Yo));
%PSNRval(i) =snr(uint8(Yv),uint8(Yo));
PSNRval(i)= metrix_mux(uint8(Yv),uint8(Yo),'vif' );

end