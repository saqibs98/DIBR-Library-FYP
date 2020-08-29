
clc; clear; close all;


% Set the video information
% a = 'balloons_c_1.yuv';
width  = 1024;
height = 768;
%get the total no of frames
noFrames =  seq_frames('balloons_c_1.yuv',[1024 768],'YUV420_8');

filename  =  'Baloons_c1.yuv';
filename1 = 'Baloons_c5.yuv';
filename3 = 'Baloons_d1.yuv'; 
filename4 = 'Baloons_d5.yuv';

% Read the video sequence
for i=0:noFrames-1
    [Y,U,V] =  yuv_import('balloons_c_1.yuv',[1024 768],1,i);
     yuv_export(Y,U,V,filename,1);
     
    [Y,U,V] =  yuv_import('balloons_c_5_1024x768.yuv',[1024 768],1,i);
        yuv_export(Y,U,V,filename1,1);

    [Y,U,V] =  yuv_import('balloons_d_1_1024x768.yuv',[1024 768],1,i);
        yuv_export(Y,U,V,filename3,1);

    [Y,U,V] =  yuv_import('balloons_d_5_1024x768.yuv',[1024 768],1,i);
    %     im = yuv2rgb(Y,U,V);
   
    yuv_export(Y,U,V,filename4,1);
end


% % disp(frames);
% % test1 = input('Enter the frame # :');
% % %C = save_yuvframe('balloons_c_1.yuv',[1024 768],1,'lalalala_1stframe.png');
% % imshow(Y(3,4,test1));
% % title(['frame #', num2str(test1)]);
% % y=uint(test1);
% % for iFrame = 1:25:300
% %    imshow(Y(:,:,iFrame));
% %     title(['frame #', num2str(iFrame)]);
% % end
