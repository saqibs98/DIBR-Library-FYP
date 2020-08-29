%function [virtualView3, originalView3,width, height,totalFrames] = loadData(expNo)
function [camFileNameLeft, camFileNameRight, depFileNameLeft, depFileNameRight, width, height,totalFrames,b, zN, zF, f,Merge_View_Sequence_Name,MergeDepth_View_Sequence_Name,Line_Wise_Filling] = loadData(expNo)
%
if expNo == 1
    %Balloons
    totalFrames = 300;
    camFileNameLeft = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\Balloons\balloons_c_1_1024x768.yuv";
    camFileNameRight = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\Balloons\balloons_c_5_1024x768.yuv";
    depFileNameLeft = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\Balloons\balloons_d_1_1024x768.yuv";
    depFileNameRight = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\Balloons\balloons_d_5_1024x768.yuv";
    
    virtualView3 = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\Balloons\balloons_v_3_1024x768.yuv";
    originalView3 = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\Balloons\balloons_c_3_1024x768.yuv";
    
    virtual_View_Sequence_Name = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\Balloons\balloons_v_3_1024x768.yuv";

    %virtualDepth = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\Balloons\balloons_c_1_1024x768.yuv";
       
   
    
    width = 1024;
    height = 768;
    zNear = 448.251214;
    zFar = 11206.280350;
    zN = 1/zNear;
    zF = 1/zFar;
    
    % Left Camera Parameters
    fL = [2241.25607 0.0        701.5
        0.0     2241.25607  514.5
        0.0     0.0         1.0 ];
    
    % Right Camera Parameters
    fR = [2241.25607 0.0        701.5
        0.0     2241.25607  514.5
        0.0     0.0         1.0 ];
    
    pL = 5;
    pR = 25;
    
    % Baseline spacing
    b = (pR - pL)/2;
    f = fL(2,2);
    zNr=0;
    zFr=0;
% elseif expNo == 2
%     %expName = strcat('BookArrival_c_9_1024x768' );
%     totalFrames = 100;
%     camFileNameLeft = "E:\University_data\MSCS\3rdSemester\research\data\3DV\BookArrival\BookArrival_c_10_1024x768.yuv";
%     camFileNameRight = "E:\University_data\MSCS\3rdSemester\research\data\3DV\BookArrival\BookArrival_c_8_1024x768.yuv";    
%     depFileNameLeft = "E:\University_data\MSCS\3rdSemester\research\data\3DV\BookArrival\BookArrival_d_10_1024x768.yuv";
%     depFileNameRight = "E:\University_data\MSCS\3rdSemester\research\data\3DV\BookArrival\BookArrival_d_8_1024x768.yuv";
%     virtualView = "E:\University_data\MSCS\MphilResearch\code\results\BookArrival\BookArrival_vc_9_1024x768.yuv";
%     virtualDepth = "E:\University_data\MSCS\MphilResearch\code\results\BookArrival\BookArrival_vd_9_1024x768.yuv";
%             
%     width = 1024;
%     height = 768;    
%     zNear = 23.175928;
%     zFar = 54.077165;
%     zN = 1/zNear;
%     zF = 1/zFar;
%     
%     % Camera Parameters
%     fL = [1399.466666666666	0.000000	512
%         0.000000	1399.466666666666	384
%         0.000000	0.000000	1.000000];
%        
%     fR = [1399.466666666666	0.000000	512
%         0.000000	1399.466666666666	384
%         0.000000	0.000000	1.000000];
%         
%     pL = -5.205949;
%     pR = -4.046711;
%     
%     % Baseline spacing
%     b = (pR - pL)/2;
%     f = fL(2,2);
% 
% elseif expNo == 3
%     %expName = 'Dancer';
%     totalFrames = 250;    
%     camFileNameLeft = 'C:\3DV\SEQUENCES\Dancer\UndoDancer_c_1_1920x1088.yuv';
%     camFileNameRight = 'C:\3DV\SEQUENCES\Dancer\UndoDancer_c_9_1920x1088.yuv';    
%     depFileNameLeft = 'C:\3DV\SEQUENCES\Dancer\UndoDancer_d_1_960x544.yuv';
%     depFileNameRight = 'C:\3DV\SEQUENCES\Dancer\UndoDancer_d_9_960x544.yuv';
%     
%     width = 1920;
%     height = 1088;
%     zNear = 2289;
%     zFar = 213500;
%     zN = 1/zNear;
%     zF = 1/zFar;
%     
%     fL = [2302.852541609168 0.0               960.0
%         0.0               2302.852541609168   540.0
%         0.0               0.0                 1.0 ];
%     pL = -80;
%     
%     fM = [2302.852541609168 0.0               960.0
%         0.0               2302.852541609168   540.0
%         0.0               0.0                 1.0 ];
%     pM = 0;
%     
%     fR = [2302.852541609168     0.0               960.0
%         0.0                   2302.852541609168   540.0
%         0.0                   0.0                 1.0 ];
%     pR = 80;
%     
%     b = (pR - pL)/2;
%     f = fL(2,2);
%     
 elseif expNo == 4
%     %Kendo
    totalFrames = 300;    
    camFileNameLeft = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\kendo\kendo_c_1_1024x768.yuv";
    camFileNameRight = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\kendo\kendo_c_5_1024x768.yuv";
    depFileNameLeft = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\kendo\kendo_d_1_1024x768.yuv";
    depFileNameRight = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\kendo\kendo_d_5_1024x768.yuv";
%     virtualView = "E:\University_data\MSCS\MphilResearch\code\results\kendo\kendo_vc_3_1024x768.yuv";
%     virtualDepth = "E:\University_data\MSCS\MphilResearch\code\results\kendo\kendo_vd_3_1024x768.yuv";
% 
    virtualView3 = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\kendo\kendo_v_3_1024x768.yuv";
    originalView3 = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\kendo\kendo_c_3_1024x768.yuv";
    
    virtual_View_Sequence_Name = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\kendo\kendo_v_3_1024x768.yuv";

    %totalFrames = 400;
    width = 1024;
    height = 768;
    zNear = 448.251214;
    zFar = 11206.280350;
    zN = 1/zNear;
    zF = 1/zFar;
    zNr=0;
    zFr=0;
    fL = [2241.25607 0.0 701.5
        0.0 2241.25607 514.5
        0.0 0.0 1.0  ];
    pL = 5;
    
    fR = [2241.25607 0.0 701.5
        0.0 2241.25607 514.5
        0.0 0.0 1.0  ];
    
    pR = 25;    
    % Baseline spacing
    b = (pR - pL)/2;
    f = fL(2,2);
    
% elseif expNo == 5
%     %expName = 'lovebird1';
%     totalFrames = 5;    
%     camFileNameLeft = "E:\University_data\MSCS\MphilResearch\code\videoData\Lovebird1\lovebird1_c_4_1024x768.yuv";
%     camFileNameRight = "E:\University_data\MSCS\MphilResearch\code\videoData\Lovebird1\lovebird1_c_8_1024x768.yuv";
%     depFileNameLeft = "E:\University_data\MSCS\MphilResearch\code\videoData\Lovebird1\lovebird1_d_4_1024x768.yuv";
%     depFileNameRight = "E:\University_data\MSCS\MphilResearch\code\videoData\Lovebird1\lovebird1_d_8_1024x768.yuv";
%     virtualView = "E:\University_data\MSCS\MphilResearch\code\results\lovebird\lovebird1_vc_6_1024x768.yuv";
%     virtualDepth = "E:\University_data\MSCS\MphilResearch\code\results\lovebird\lovebird1_vd_6_1024x768.yuv";
%         
%     width = 1024;
%     height = 768;
%     zNear = -2228.745812;
%     zFar = -156012.206815;
%     zN = 1/zNear;
%     zF = 1/zFar;
%     fL = [2017.8074684219137    0                   555.4121600029979
%          0                      2009.3330626387904  385.28498930066263
%          0                      0                   1 ];
%         
%     %fM = fL;    
%     %fR = fL;
%     
%     pL = 77.31768727; %0     
%     pR = -70.80434924; %0;        
%     b = (pR + pL)/2;
%     f = fL(2,2);
%     
elseif expNo == 6
    
    %expName = strcat('Poznan_Hall2_v_6_1920x1088_QP', tQP, '_', dQP, '_sim');
    totalFrames = 200;
    
    camFileNameLeft = strcat('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\PoznanHall2\Poznan_Hall2_c_7_1920x1088.yuv');
    camFileNameRight = strcat('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\PoznanHall2\Poznan_Hall2_c_5_1920x1088.yuv');  
    depFileNameLeft = strcat('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\PoznanHall2\Poznan_Hall2_d_7_1920x1088.yuv');
    depFileNameRight = strcat('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\PoznanHall2\Poznan_Hall2_d_5_1920x1088.yuv');
    
    virtualView3 =strcat('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\PoznanHall2\Poznan_Hall2_v_6_1920x1088.yuv');
    originalView3 = strcat('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\PoznanHall2\Poznan_Hall2_c_6_1920x1088.yuv');
   
    virtual_View_Sequence_Name = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\PoznanHall2\Proznan_Hall2_v_6_1920x1088.yuv";

    width = 1920;
    height = 1088;
    zNear = -23.394160;
    zFar = -172.531931;
    zN = 1/zNear;
    zF = 1/zFar;
    zNr=0;
    zFr=0;
    % Right Camera Parameters
    fR = [1732.875727 0.0           943.231169
        0.0           1729.908923   548.845040
        0.0           0.0           1.0 ];
    
    % Right camera position on x-axis
    pR = 7.965116;
    
    % Left Camera Parameters
    fL = [1732.875727     0.0           943.231169
        0.0              1729.908923   548.845040
        0.0              0.0           1.0 ];
    
    % Left camera position on x-axis
    pL = 11.151163;
    
    
    % Baseline spacing
    b = (pR - pL)/2;
    f = fL(2,2);
    
elseif expNo == 7
    %expName = strcat('Poznan_Street_c_4_1920x1088', tQP, '_', dQP );
    totalFrames = 250;
            
%     camFileNameLeft = strcat('Poznan_Street_c_5_1920x1088_QP', tQP, '_sim.yuv');
%     camFileNameRight = strcat('Poznan_Street_c_3_1920x1088_QP', tQP, '_sim.yuv');
%     
%     depFileNameLeft = strcat('Poznan_Street_d_5_1920x1088_QP', dQP, '_sim.yuv');
%     depFileNameRight = strcat('Poznan_Street_d_3_1920x1088_QP', dQP, '_sim.yuv');

    camFileNameLeft = strcat('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\PoznanStreet\Poznan_Street_00_1920x1088_rec_cam05.yuv');
    camFileNameRight = strcat('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\PoznanStreet\Poznan_Street_00_1920x1088_rec_cam03.yuv');
    depFileNameLeft = strcat('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\PoznanStreet\Poznan_Street_00_1920x1088_depth_cam05.yuv');
    depFileNameRight = strcat('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\PoznanStreet\Poznan_Street_00_1920x1088_depth_cam03.yuv');
    
    virtualView3 =strcat('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\PoznanStreet\Poznan_Street_00_1920x1088_v_cam04.yuv');
    originalView3 = strcat('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\PoznanStreet\Poznan_Street_00_1920x1088_rec_cam04.yuv');
    
    virtual_View_Sequence_Name = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\PoznanStreet\Poznan_Street_v_2_1920x1088.yuv";

    
    
    width = 1920;
    height = 1088;
    
    zNear = -34.506386;
    zFar = -2760.510889;
    zN = 1/zNear;
    zF = 1/zFar;
    zNr=0;
    zFr=0;
    % Camera Parameters
    fR = [1732.875727	0.000000	943.231169
        0.000000	1729.908923	548.845040
        0.000000	0.000000	1.000000];
    
    
    fL = [1732.875727	0.000000	943.231169
        0.000000	1729.908923	548.845040
        0.000000	0.000000	1.000000];
    
    
    pR = 4.779070;
    pL = 7.965116;
    
    % Baseline spacing
    b = (pR - pL)/2;
    f = fL(2,2);
    
        
elseif expNo == 8
    %expName = 'Newspaper_R_V_4';
%     totalFrames = 300;
totalFrames = 1;
    
    camFileNameLeft = 'D:\UNIVERSITY DATA\fyp\depth image base rendering\Newspaper_c_2_1024x768.yuv';
    camFileNameRight = 'D:\UNIVERSITY DATA\fyp\depth image base rendering\Newspaper_c_6_1024x768.yuv';
    depFileNameLeft = 'D:\UNIVERSITY DATA\fyp\depth image base rendering\Newspaper_d_2_1024x768.yuv';
    depFileNameRight = 'D:\UNIVERSITY DATA\fyp\depth image base rendering\Newspaper_d_6_1024x768.yuv';
   
   % virtualView3 = 'E:\sem7\fyp\2nd paper\texture_synthesis\Newspaper_c_4_1024x768.yuv';
   % originalView3 = 'E:\sem7\fyp\2nd paper\texture_synthesis\Newspaper_v_4_1024x768.yuv';
    
   % virtual_View_Sequence_Name = "E:\sem7\fyp\2nd paper\texture_synthesis\Newspaper_vL_4_1024x768.yuv";
   
    Merge_View_Sequence_Name = "D:\UNIVERSITY DATA\fyp\depth image base rendering\Newspaper_vM_4_1024x768.yuv";
    MergeDepth_View_Sequence_Name = "D:\UNIVERSITY DATA\fyp\depth image base rendering\Newspaper_vDM_4_1024x768.yuv";
     Line_Wise_Filling = "D:\UNIVERSITY DATA\fyp\depth image base rendering\Newspaper_vDM_4_Filling_finalAttempt1_1024x768.yuv";


    width = 1024;
    height = 768;
    zNear = -2715.181648;
    zFar = -9050.605493;
    zN = 1/zNear;
    zF = 1/zFar;
    zNr=0;
    zFr=0;
    % Left Camera Parameters
    fL = [2929.4940521927465      0.0                307.63334410569644
        0.0              2922.7064498725026   555.0109690422262
        0.0              0.0                    1.0 ];
    
    % Left camera position on x-axis
    pL = 108.93286665364974;
    
    % Right Camera Parameters
    fR = [2929.4940521927465      0.0               307.63334410569644
        0.0              2922.7064498725026   555.0109690422262
        0.0               0.0                1.0 ];
    
    % Right camera position on x-axis
    pR = -76.43577376668404;
    
    f = fL(2,2);
    % Baseline spacing
    b = (pR - pL)/2;
    
elseif expNo == 9
    %expName = 'cafe_V_3';
    totalFrames = 300;
    
    camFileNameLeft = 'D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\Cafe\cafe_c_2_1920x1080.yuv';
    camFileNameRight = 'D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\Cafe\cafe_c_4_1920x1080.yuv';
    
    depFileNameLeft = 'D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\Cafe\cafe_d_2_1920x1080.yuv';
    depFileNameRight = 'D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\Cafe\cafe_d_4_1920x1080.yuv';
    
    virtualView3 = 'D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\Cafe\cafe_c_3_1920x1080.yuv';
    originalView3 =  'D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\Cafe\cafe_v_3_1920x1080.yuv';
    virtual_View_Sequence_Name = "D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\Cafe\cafe_v_3_1024x768.yuv";

    width = 1920;
    height = 1080;
    zNear = -1297.455033;
    zFar = -3892.365100;
    zN = 1/zNear;
    zF = 1/zFar;
    zNr=0;
    zFr=0;
    % Left Camera Parameters
    fL = [1796.4762 0.0000 978.4051
        0.0000 1796.8924 489.3078
        0.0000 0.0000	1.0000];
    
    % Left camera position on x-axis
    pL = -324.6527;
    
    % Right Camera Parameters
    fR = [1796.4762 0.0000 978.4051
        0.0000 1796.8924 489.3078
        0.0000 0.0000	1.0000];
    
    % Right camera position on x-axis
    pR = -454.6527;
    
    f = fL(2,2);
    % Baseline spacing
    b = (pR - pL)/2;
    
    
% elseif expNo == 10
%     %expName = strcat('pantomime_c_39_1280x960', tQP, '_', dQP );
%     totalFrames = 100;
%     
%     camFileNameLeft = strcat('C:\3DV\SEQUENCES\Pantomime\pantomime_c_37_1280x960.yuv');
%     camFileNameRight = strcat('C:\3DV\SEQUENCES\Pantomime\pantomime_c_41_1280x960.yuv');
%     
%     depFileNameLeft = strcat('C:\3DV\SEQUENCES\Pantomime\pantomime_d_37_1280x960.yuv');
%     depFileNameRight = strcat('C:\3DV\SEQUENCES\Pantomime\pantomime_d_41_1280x960.yuv');
%     
%     width = 1280;
%     height = 960;
%     
%     zNear = 3907.725727;
%     zFar = 8221.650623;
%     
%     % Camera Parameters
%     fL = [2979,     0,      -170.905600000000
%         0,          2979,   452.712100000000
%         0,          0,      1];
%     
%     
%     fR = [2979,     0,      -98.4384
%         0,     2979,   452.7121
%         0,     0,      1];
%     
%     
%     pL = -125;
%     pR = 75;
%     %     pL = -1050;
%     %     pR = -950;
%     
%     
%     % Baseline spacing
%     b = (pR - pL)/2;
%     f = fL(2,2);
%     
elseif expNo == 11
    
    %expName = strcat('GT_Fly_c_7_1920x1088', tQP, '_', dQP );
    totalFrames = 250;
    
    camFileNameLeft = 'D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\GTF\GT_Fly_c_9_1920x1088.yuv';
    camFileNameRight = 'D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\GTF\GT_Fly_c_1_1920x1088.yuv';
%     camFileNameLeft =  'GT_Fly_c_9_1920x1088.yuv';
%     camFileNameRight = 'GT_Fly_c_5_1920x1088.yuv';
    
    %depFileNameLeft = strcat('D:\Temporal3DV\QP', tQP, '\GT_Fly_d_5_1920x1088_QP', tQP, '.yuv');
    %     depFileNameRight = strcat('D:\Temporal3DV\QP', tQP, '\GT_Fly_d_3_1920x1088_QP', tQP, '.yuv');
    depFileNameLeft =  'D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\GTF\GT_Fly_d_9_1920x1088.yuv';
    depFileNameRight = 'D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\GTF\GT_Fly_d_1_1920x1088.yuv';
   
    virtual_View_Sequence_Name = "GT_Fly_v_9_1920x1088.yuv";
    width = 1920;
    height = 1088;
    
    virtualView3 = 'D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\GTF\GT_Fly_v_5_1920x1088.yuv';
    originalView3 = 'D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\GTF\GT_Fly_c_5_1920x1088.yuv';
   
    
    
    
    zNearL =dlmread('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\GTF\GT_Fly_Znear_cam9.txt');
    zFarL  =dlmread('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\GTF\GT_Fly_Zfar_cam1.txt');
    
    zNearR = dlmread('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\GTF\GT_Fly_Znear_cam9.txt'); 
    zFarR  = dlmread('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\GTF\GT_Fly_Zfar_cam1.txt');
    
    pL = dlmread('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\GTF\GT_Fly_transl_cam9.txt');
    pR = dlmread('D:\BS-IT\Sem 7\FYP- Library\Sir data\3DV Data\New Data\GTF\GT_Fly_transl_cam1.txt');
    % Camera Parameters
   
    fL = [2519.92835 0.0 960
        0.0 2519.947852 540
        0.0 0.0 1.0];
    
    fR = [2519.92835 0.0 960
        0.0 2519.947852 540
        0.0 0.0 1.0];
    
    zN=zNearL.';
    zF=zFarL.';
    
    zNr=zNearR.';
    zFr=zFarR.';
  
    
    % Baseline spacing
    b(totalFrames)= zeros; 
 
    for i=1:totalFrames
%    Baseline spacing
    b(i) = (pR(i) - pL(i))/2;
    end
    f = fL(2,2);


else
    error('Invalid expNo');
end

end

