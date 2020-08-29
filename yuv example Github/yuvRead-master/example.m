%% Sample use of yuvRead

clc; clear; close all;


% Set the video information
videoSequence = 'balloons_c_1.yuv';
width  = 1024;
height = 768;
nFrame = 300;


% Read the video sequence
[Y,U,V] = yuvRead(videoSequence, width, height ,nFrame); 


% Show sample frames\
figure;
c = 0;  % counter
test1= input ('Enter the frame # :  ');
    imshow(Y(:,:,test1));
    title(['frame #', num2str(test1)]);
% for iFrame = 1:1:test1
%     c = c + 1;
%    imshow(Y(:,:,iFrame));
%     title(['frame #', num2str(iFrame)]);
% end
