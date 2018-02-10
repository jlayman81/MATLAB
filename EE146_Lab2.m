%% Lab 2 Jesse Layman SID: 861135479

% Professor: Bir Bhanu,, 
% TA: Vincent On,         
% EE 146 - 021
close all
clear all
%% 1)
I = imread('/Users/jesselayman/Desktop/bwShapes.tif' );
SE_1 = strel('disk', 20);
SE_2 = strel('square',30);
SE_3 = strel('diamond',50);
% Dilate
I_Disk_dilate = imdilate(I,SE_1);
I_Square_dilate = imdilate(I,SE_2);
I_Diamond_dilate = imdilate(I,SE_3);
% Erode
I_Disk_erode = imerode(I,SE_1);
I_Square_erode = imerode(I,SE_2);
I_Diamond_erode = imerode(I,SE_3);
% Open
I_Disk_open = imopen(I,SE_1);
I_Square_open = imopen(I,SE_2);
I_Diamond_open = imopen(I,SE_3);
% Close
I_Disk_close = imclose(I,SE_1);
I_Square_close = imclose(I,SE_2);
I_Diamond_close = imclose(I,SE_3);
% Display images
% Dilation
figure('pos',[10 10 900 600])
subplot(3,2,1)
imshow(I_Disk_dilate);
title('Disk Dialation')
subplot(3,2,3)
imshow(I_Square_dilate);
title('Square Dialation')
subplot(3,2,5)
imshow(I_Diamond_dilate);
title('Diamond Dialation')
% Erosion
subplot(3,2,2)
imshow(I_Disk_erode);
title('Disk Erosion')
subplot(3,2,4)
imshow(I_Square_erode);
title('Square Erosion')
subplot(3,2,6)
imshow(I_Diamond_erode);
title('Diamond Erosion')
% Open
figure('pos',[10 10 900 600])
subplot(3,2,1)
imshow(I_Disk_open);
title('Disk Open')
subplot(3,2,3)
imshow(I_Square_open);
title('Square Open')
subplot(3,2,5)
imshow(I_Diamond_open);
title('Diamond Open')
% Close
subplot(3,2,2)
imshow(I_Disk_close);
title('Disk Close')
subplot(3,2,4)
imshow(I_Square_close);
title('Square Close')
subplot(3,2,6)
imshow(I_Diamond_close);
title('Diamond Close')

%% 2)

% Label connected devices
im1=[0 0 1 0 0 1 1 1; 
         0 1 1 1 1 1 1 1;
         1 1 1 1 1 1 1 1;
         1 1 1 1 1 1 1 1;
         1 1 1 1 0 0 1 1; 
         1 1 1 0 0 0 0 0; 
         1 1 1 0 0 1 1 1; 
         1 1 1 0 0 1 1 1]
I_L1 = bwlabel(im1,8)
im2=[1 1 0 1 1 1 0 1; 
         1 1 0 1 0 1 0 1;
         1 1 1 1 0 0 0 1;
         0 0 0 0 0 0 0 1;
         1 1 1 1 0 1 0 1; 
         0 0 0 1 0 1 0 1; 
         1 1 0 1 0 0 0 1; 
         1 1 0 1 0 1 1 1]
I_L2 = bwlabel(im2,8)

%% 3)

% Measure Features I_L1
I_L1_Features = regionprops(I_L1,'Area','Perimeter','Centroid');
Features_I_L1= struct2table(I_L1_Features) 
I_L1_Circularity = zeros(size(Features_I_L1,1),1);
for i = 1:size(Features_I_L1,1)
I_L1_Circularity(i) = 4*pi*I_L1_Features(i).Area./((I_L1_Features(i).Perimeter).^2);
end
I_L1_Circularity
% Measure Features I_L2
I_L2_Features = regionprops(I_L2,'Area','Perimeter','Centroid');
Features_I_L2= struct2table(I_L2_Features)
I_L2_Circularity = zeros(size(Features_I_L2,1),1);
for i = 1:size(Features_I_L2,1)
I_L2_Circularity(i) = 4*pi*I_L2_Features(i).Area./((I_L2_Features(i).Perimeter).^2);
end
I_L2_Circularity

    