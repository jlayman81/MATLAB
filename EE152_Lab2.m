%% Lab 2 Jesse Layman SID: 861135479

% Professor: Salman Asif, 
% TA:  Ruchira Pratihar,         
% EE 152 - 021

%% L2.1
close all
clear all
I_ocean = imread('/Users/jesselayman/Downloads/IMG_0690.JPG');
I_fence = imread('/Users/jesselayman/Downloads/IMG_0693_2.JPG');

% a
I_ocean_128AA = imresize(I_ocean,[128 128],'Antialiasing',true);
figure('pos',[10 10 900 600]);
subplot(2,2,1)
imshow(I_ocean_128AA)
title('Resize soft background with AA')
I_ocean_128 = imresize(I_ocean,[128 128],'Antialiasing',false);
subplot(2,2,3)
imshow(I_ocean_128)
title('Resize soft background without AA')
% No antialiasing on the uniform image is better because the image appears
% shaper.
I_fence_128AA = imresize(I_fence,[128 128],'Antialiasing',true);
subplot(2,2,2)
imshow(I_fence_128AA)
title('Resize repeating background with AA')
I_fence_128 = imresize(I_fence,[128 128],'Antialiasing',false);
subplot(2,2,4)
imshow(I_fence_128)
title('Resize repeating background without AA')
% Antialiasing on the repeating background image is better. The image appears
% shaper with  antialiasing on, however there is distortion in the fence.

% b 
I_ocean_512_NN= imresize(I_ocean,[512 512],'nearest',true);
I_ocean_512_BL = imresize(I_ocean,[512 512],'bilinear',true);
I_ocean_512_BC = imresize(I_ocean,[512 512],'bicubic',true);
figure('pos',[10 10 900 600]);
subplot(3,2,1)
imshow(I_ocean_512_NN)
title('Resize soft background with Nearest Neighbor')
subplot(3,2,3)
imshow(I_ocean_512_BL)
title('Resize soft background using Bilinear')
subplot(3,2,5)
imshow(I_ocean_512_BC)
title('Resize soft background using Bicubic')
% Observation - In this instance Bicubic appears to produce the clearest, distortion free image. 
I_fence_512_NN= imresize(I_fence,[512 512],'nearest',true);
I_fence_512_BL = imresize(I_fence,[512 512],'bilinear',true);
I_fence_512_BC = imresize(I_fence,[512 512],'bicubic',true);
subplot(3,2,2)
imshow(I_fence_512_NN)
title('Resize repeating background with Nearest Neighbor')
subplot(3,2,4)
imshow(I_fence_512_BL)
title('Resize repeating background using Bilinear')
subplot(3,2,6)
imshow(I_fence_512_BC)
title('Resize repeating background using Bicubic')
% Observation - In this instance Bicubic appears to produce the clearest, distortion free image for the clouds.
% For the fence background bilinear produces the clearest result.

%% L2.2

% a 
% Ocean picture
Ocean8bit = I_ocean_128;
figure('Name','Ocean Picture Quantization','NumberTitle','off')
subplot(2,4,1)
imshow(I_ocean_128)
title('8 bit quantization')
Ocean7bit= 2*(I_ocean_128/2);
subplot(2,4,2)
imshow(Ocean7bit)
title('7 bit quantization')
Ocean6bit= 4*(I_ocean_128/4);
subplot(2,4,3)
imshow(Ocean6bit)
title('6 bit quantization')
Ocean5bit = 8*(I_ocean_128/8);
subplot(2,4,4)
imshow(Ocean5bit)
title('5 bit quantization')
Ocean4bit = 16*(I_ocean_128/16);
subplot(2,4,5)
imshow(Ocean4bit)
title('4 bit quantization')
Ocean3bit = 32*(I_ocean_128/32);
subplot(2,4,6)
imshow(Ocean3bit)
title('3 bit quantization')
Ocean2bit = 64*(I_ocean_128/64);
subplot(2,4,7)
imshow(Ocean2bit)
title('2 bit quantization')
Ocean1bit = 128*(I_ocean_128/128);
subplot(2,4,8)
imshow(Ocean1bit)
title('1 bit quantization')

% fence picture

Fence8bit = I_fence_128;
figure('Name','Fence Picture Quantization','NumberTitle','off')
subplot(2,4,1)
imshow(I_fence_128)
title('8 bit quantization')
Fence7bit= 2*(I_fence_128/2);
subplot(2,4,2)
imshow(Fence7bit)
title('7 bit quantization')
Fence6bit= 4*(I_fence_128/4);
subplot(2,4,3)
imshow(Fence6bit)
title('6 bit quantization')
Fence5bit = 8*(I_fence_128/8);
subplot(2,4,4)
imshow(Fence5bit)
title('5 bit quantization')
Fence4bit = 16*(I_fence_128/16);
subplot(2,4,5)
imshow(Fence4bit)
title('4 bit quantization')
Fence3bit = 32*(I_fence_128/32);
subplot(2,4,6)
imshow(Fence3bit)
title('3 bit quantization')
Fence2bit = 64*(I_fence_128/64);
subplot(2,4,7)
imshow(Fence2bit)
title('2 bit quantization')
Fence1bit = 128*(I_fence_128/128);
subplot(2,4,8)
imshow(Fence1bit)
title('1 bit quantization')
% Contoring is shown at 5 bit quantization in both images.

% add noise to smooth background
I_ocean_r = I_ocean_128(:,:,1);
I_ocean_g = I_ocean_128(:,:,2);
I_ocean_b = I_ocean_128(:,:,3);
Ocean8bit_Gr = imnoise(I_ocean_r,'gaussian',0,0.01);
Ocean8bit_Gg = imnoise(I_ocean_g,'gaussian',0,0.01);
Ocean8bit_Gb = imnoise(I_ocean_b,'gaussian',0,0.01);
I_ocean_128(:,:,1) = Ocean8bit_Gr;
I_ocean_128(:,:,2) = Ocean8bit_Gg;
I_ocean_128(:,:,3) = Ocean8bit_Gb;
figure('Name','Cloud Picture Quantization with Gaussian noise','NumberTitle','off')
subplot(2,4,1)
imshow(I_ocean_128)
title('8 bit quantization')
Ocean7bit= 2*(I_ocean_128/2);
subplot(2,4,2)
imshow(Ocean7bit)
title('7 bit quantization')
Ocean6bit= 4*(I_ocean_128/4);
subplot(2,4,3)
imshow(Ocean6bit)
title('6 bit quantization')
Ocean5bit = 8*(I_ocean_128/8);
subplot(2,4,4)
imshow(Ocean5bit)
title('5 bit quantization')
Ocean4bit = 16*(I_ocean_128/16);
subplot(2,4,5)
imshow(Ocean4bit)
title('4 bit quantization')
Ocean3bit = 32*(I_ocean_128/32);
subplot(2,4,6)
imshow(Ocean3bit)
title('3 bit quantization')
Ocean2bit = 64*(I_ocean_128/64);
subplot(2,4,7)
imshow(Ocean2bit)
title('2 bit quantization')
Ocean1bit = 128*(I_ocean_128/128);
subplot(2,4,8)
imshow(Ocean1bit)
title('1 bit quantization')
% Adding noise seems to remove false contoring
% in a smooth background up to 2 bit quantization.

I_fence_r = I_fence_128(:,:,1);
I_fence_g = I_fence_128(:,:,2);
I_fence_b = I_fence_128(:,:,3);
Fence8bit_Gr = imnoise(I_fence_r,'gaussian',0,0.01);
Fence8bit_Gg = imnoise(I_fence_g,'gaussian',0,0.01);
Fence8bit_Gb = imnoise(I_fence_b,'gaussian',0,0.01);
I_fence_128(:,:,1) = Fence8bit_Gr;
I_fence_128(:,:,2) = Fence8bit_Gg;
I_fence_128(:,:,3) = Fence8bit_Gb;

figure('Name','Fence Picture Quantization','NumberTitle','off')
subplot(2,4,1)
imshow(I_fence_128)
title('8 bit quantization')
Fence7bit= 2*(I_fence_128/2);
subplot(2,4,2)
imshow(Fence7bit)
title('7 bit quantization')
Fence6bit= 4*(I_fence_128/4);
subplot(2,4,3)
imshow(Fence6bit)
title('6 bit quantization')
Fence5bit = 8*(I_fence_128/8);
subplot(2,4,4)
imshow(Fence5bit)
title('5 bit quantization')
Fence4bit = 16*(I_fence_128/16);
subplot(2,4,5)
imshow(Fence4bit)
title('4 bit quantization')
Fence3bit = 32*(I_fence_128/32);
subplot(2,4,6)
imshow(Fence3bit)
title('3 bit quantization')
Fence2bit = 64*(I_fence_128/64);
subplot(2,4,7)
imshow(Fence2bit)
title('2 bit quantization')
Fence1bit = 128*(I_fence_128/128);
subplot(2,4,8)
imshow(Fence1bit)
title('1 bit quantization')
% Adding noise removes false contoring
% in a sharp background up to 5 bit quantization.
% At 4 bits the false contoring is back.

%% 2.3
I_self = imread('/Users/jesselayman/Downloads/IMG_0681.JPG');
I_background = imread('/Users/jesselayman/Downloads/IMG_0682.JPG');

I_self = rgb2gray(I_self);
I_background = rgb2gray(I_background);
I_self = imresize(I_self,[512,512]);
I_background = imresize(I_background,[512,512]);
[optimizer,metric] = imregconfig('multimodal');
optimizer.GrowthFactor = 1.01;
optimizer.InitialRadius = 0.01;
optimizer.MaximumIterations = 300;
optimizer.Epsilon = 1.5e-6;
I_reg = imregister(I_self,I_background,'rigid',optimizer,metric);

I_image = I_background-I_reg;
figure
imshow(I_image)
for r = 1:512
    for c = 1:512
        if I_image(r,c) > 44;
            I_image(r,c) = 256;
        else
            I_image(r,c) = 0;
        end
    end
end

    figure 
    imshow(I_image);
