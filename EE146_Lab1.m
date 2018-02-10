%% Lab 1 Jesse Layman SID: 861135479

% Professor: Bir Bhanu,, 
% TA: Vincent On,         
% EE 146 - 021
close all
clear all

%% 1)

% Read images from graphics file
I_cameraman = imread('cameraman.tif');
I_coins = imread('coins.png');
I_rice = imread('rice.png');
I_shadow = imread('shadow.tif');
I_peppers = imread('peppers.png');
% Display images in pairs
figure
imshowpair(I_cameraman,I_coins,'montage');
figure
imshowpair(I_rice,I_shadow,'montage');
% Display last image individually
figure
imshow(I_peppers);
% cameraman is 256 rows, 256 columns, 65536 bytes
% coins is 246 rows, 300 columns, 73800 bytes
% rice is 256 rows, 256 columns, 65536
% shadow is 223 rows, 298 columns, 66454
% peppers is 384 rows, 512 columns, 589824

% Convert color image to grayscale
% rgb2gray is used for this conversion.
I_grayPeppers = rgb2gray(I_peppers);
figure
imshowpair(I_peppers,I_grayPeppers,'montage');

%% 2)

% Display histograms of the images
% Color images are first converted to grayscale 
% the grayscale image is used to make the histogram.
figure
imhist(I_cameraman);
figure
imhist(I_coins);
figure
imhist(I_rice);
figure
imhist(I_shadow);
figure
imhist(I_grayPeppers);

%% 3)
%Testing Otsu thresholding algorithm
Thresh_cameraman = graythresh(I_cameraman);
Bin_cameraman = imbinarize(I_cameraman,Thresh_cameraman);
figure
imshowpair(I_cameraman,Bin_cameraman,'montage')

Thresh_coins = graythresh(I_coins);
Bin_coins = imbinarize(I_coins,Thresh_coins);
figure
imshowpair(I_coins,Bin_coins,'montage')

Thresh_rice = graythresh(I_rice);
Bin_rice = imbinarize(I_rice,Thresh_rice);
figure
imshowpair(I_rice,Bin_rice,'montage')

Thresh_shadow = graythresh(I_shadow);
Bin_shadow = imbinarize(I_shadow,Thresh_shadow);
figure
imshowpair(I_shadow,Bin_shadow,'montage')

Thresh_grayPeppers = graythresh(I_grayPeppers);
Bin_grayPeppers = imbinarize(I_grayPeppers,Thresh_grayPeppers);
figure
imshowpair(I_grayPeppers,Bin_grayPeppers,'montage')

% Otsu's algoithm seems to be most stable when applied to 
% images with low textures.