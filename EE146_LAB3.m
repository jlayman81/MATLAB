%% Lab 3 Jesse Layman SID: 861135479

% Professor: Bir Bhanu,, 
% TA: Vincent On,         
% EE 146 - 021
close all
clear all
I_Orig = imread('cameraman.tif');
I_Blur = imread('/Users/jesselayman/Downloads/cameramanBlur(1).tif');
I_GN  = imread('/Users/jesselayman/Downloads/cameramanGN.tif');
I_SPN = imread('/Users/jesselayman/Downloads/cameramanSPN.tif');

%% 1)
H_mean = 1/9*[1 1 1; 1 1 1; 1 1 1];
H_gaus  = fspecial('gaussian');



% Download gaussian and salt and pepper currupted images 
% Filter images
% Display images
% Which filter works better for the given image?

% Mean filter
I_GN_M  = imfilter(I_GN, H_mean);
I_SPN_M = imfilter(I_SPN, H_mean);

% Median filter
I_GN_Med  = medfilt2(I_GN);
I_SPN_Med = medfilt2(I_SPN);

% Gaussian filter
I_GN_G  = imfilter(I_GN, H_gaus);
I_SPN_G = imfilter(I_SPN, H_gaus);

% Calculate Peak SNR to determine effectiveness of filter
I_GN_M_SNR = psnr(I_GN_M,I_Orig);
I_SPN_M_SNR = psnr(I_SPN_M,I_Orig);
I_GN_Med_SNR = psnr(I_GN_Med,I_Orig);
I_SPN_Med_SNR = psnr(I_SPN_Med,I_Orig);
I_GN_G_SNR = psnr(I_GN_G,I_Orig);
I_SPN_G_SNR = psnr(I_SPN_G,I_Orig);
% Display images
figure('Name','Fitering image corrupted by Gaussian noise','NumberTitle','off')
subplot(1,3,1)
imshow(I_GN_M)
title('Mean Filter, SNR = 23.7521')
subplot(1,3,2)
imshow(I_GN_Med)
title('Med Filter, SNR = 24.1297')

subplot(1,3,3)
imshow(I_GN_G)
title('Gauss Filter, SNR = 23.6757')

figure('Name','Fitering image corrupted by salt and pepper noise','NumberTitle','off')
subplot(1,3,1)
imshow(I_SPN_M)
title('Mean Filter, SNR = 22.9627')

subplot(1,3,2)
imshow(I_SPN_Med)
title('Med Filter, SNR = 26.7585')

subplot(1,3,3)
imshow(I_SPN_G)
title('Gauss Filter, SNR = 21.4914')

% In both cases the median filter has the highest SNR.

%% 2)
% Use Prewitt, Sobel, Laplacian of Gaussian (LOG, see p. 610), 
% and Canny operators to
% detect the edges. Try different thresholds to detect edges 
% and evaluate the results.

I_Coins     = imread('coins.png');

% Prewitt
I_Edge_P_25 = edge(I_Coins,'prewitt',0.25);
I_Edge_P_10 = edge(I_Coins,'prewitt',0.10);
I_Edge_P_def = edge(I_Coins,'prewitt');
figure('Name','Edge detection using Prewitt method','NumberTitle','off')
subplot(1,3,1)
imshow(I_Edge_P_25)
title('Prewitt, Thresh = 0.25')
subplot(1,3,2)
imshow(I_Edge_P_10)
title('Prewitt, Thresh = 0.1')
subplot(1,3,3)
imshow(I_Edge_P_def)
title('Prewitt, Thresh = default')

% Sobel
I_Edge_S_25 = edge(I_Coins,'sobel',0.25);
I_Edge_S_10 = edge(I_Coins,'sobel',0.10);
I_Edge_S_def = edge(I_Coins,'sobel');
figure('Name','Edge detection using Sobel method','NumberTitle','off')
subplot(1,3,1)
imshow(I_Edge_S_25)
title('Sobel, Thresh = 0.25')
subplot(1,3,2)
imshow(I_Edge_S_10)
title('Sobel, Thresh = 0.1')
subplot(1,3,3)
imshow(I_Edge_S_def)
title('Sobel, Thresh = default')

% Log
I_Edge_L_25 = edge(I_Coins,'log',0.25);
I_Edge_L_10 = edge(I_Coins,'log',0.10);
I_Edge_L_def = edge(I_Coins,'log');
figure('Name','Edge detection using Log method','NumberTitle','off')
subplot(1,3,1)
imshow(I_Edge_L_25)
title('Log, Thresh = 0.25')
subplot(1,3,2)
imshow(I_Edge_L_10)
title('Log, Thresh = 0.1')
subplot(1,3,3)
imshow(I_Edge_L_def)
title('Log, Thresh = default')

% Canny
I_Edge_C_25 = edge(I_Coins,'canny',0.25);
I_Edge_C_10 = edge(I_Coins,'canny',0.10);
I_Edge_C_def = edge(I_Coins,'canny');
figure('Name','Edge detection using Canny method','NumberTitle','off')
subplot(1,3,1)
imshow(I_Edge_C_25)
title('Canny, Thresh = 0.25')
subplot(1,3,2)
imshow(I_Edge_C_10)
title('Canny, Thresh = 0.1')
subplot(1,3,3)
imshow(I_Edge_C_def)
title('Canny, Thresh = default')

%% 3)

H_Lap = fspecial('laplacian');
M = I_Blur-(imfilter(I_Blur,H_Lap));
C = 2
Isharp = I_Blur+M*2;
figure 
imshow(Isharp);
figure
imshow(imsharpen(I_Blur));
