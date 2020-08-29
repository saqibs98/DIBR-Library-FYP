
clc; clear; close all;


% Set the video information
% a = 'balloons_c_1.yuv';
width  = 1024;
height = 768;
%get the total no of frames
noFrames =  seq_frames('balloons_c_1.yuv',[1024 768],'YUV420_8');
filename = 'Baloons_ex.yuv';

% Read the video sequence and save it with a new name
for i=1:noFrames
    [Y,U,V] =  yuv_import('balloons_c_1.yuv',[1024 768],1,i);
     im = yuv2rgb(Y,U,V);
    yuv_export(Y,U,V,filename,1);
end

%%%% ------------ extracting single frame from a video
% [Y,U,V] =  yuv_import('balloons_c_1.yuv',[1024 768],275,274);
% Y=Y{1};
% U=U{1};
% V=V{1};
% im = yuv2rgb(Y,U,V);
% figure, imshow(im)

% title(['frame #', num2str('275')]);
% C = save_yuvframe('balloons_c_1.yuv',[1024 768],275,'275frame.png');



