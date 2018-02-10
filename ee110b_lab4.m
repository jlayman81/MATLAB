%% Lab 4 Jesse Layman SID: 861135479            
% Professor: Yingbo Hua,         
% TA: Qiping Zhu,         
% EE110B-023 
%
%% Task 1 (problem 1 & 2)
% 

% 
% 
% 
% 
% <<1.png>>

% plot was used for the frequency response.
clear all
j = sqrt(-1);
f = -1:.01:1;
w = 2*pi*f;
%From hand calculations
Y1 = 1-2*cos(3*pi/4)*exp(-j*w)+exp(-2*j*w);
X1 = 1 - 1.8*cos(pi/4)*exp(-j*w)+0.81*exp(-2*j*w);
H1 = Y1./X1;
figure
subplot(2,1,1)
stem(angle(H1));
title('Phase of H1')
subplot(2,1,2)
stem(abs(H1));
title('Magnatude of H1')
%The angle of h ocilates over the x axis, the plot of the magnatude appears
%to be constant.

%% Problem 3
%
% <<2.png>>
%
n = 0:100;
for l = 1:101
   y(l) = 0;
end
x = cos(3*pi/4*(n+1));
for m = 3:100;
    y(m+1) = x(m+1)-2*cos(3*pi/4)*x(m+1-1)+x(m+1-2)+ ...
        1.8*cos(pi/4)*y(m+1-1)-0.81*y(m+1-2);
end
figure
subplot(2,1,1)
stem(y)
title('Plot of y')

%% Problem 4
%
% <<3.png>>
% 
Y2 = 0:100; 

for f = 0:100
     Y2(f+1) = cos(3*pi/4*f);
end
subplot(2,1,2)
stem(0:0.1:10,Y2)
title('Plot of Y2')
%This plot and the plot form problem 3 are identicle.
%% Problem 5
%
% <<4.png>>
%




