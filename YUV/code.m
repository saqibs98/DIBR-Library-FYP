expNo=1;
[IM,cam3,width,height,totF]=loadData(expNo);
PSNRval(totF)= double(zeros);
err(totF)=zeros;
for i=0:totF-1
    %read c3
     [Yl,Ul,Vl] =  yuv_import(cam3,[width height],1,i); 
     %read inverse maming
     [YM,UM,VM] =  yuv_import(IM,[width height],1,i);%i,1

       ref = yuv2rgb(Yl{1},Ul{1},Vl{1});
       A = yuv2rgb(YM{1},UM{1},VM{1});
     %  imshow(A);

     err(i+1) = immse(A,ref);
     PSNRval(i+1) = psnr(A,ref);
 
end