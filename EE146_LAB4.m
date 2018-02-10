%% Lab 3 Jesse Layman SID: 861135479

% Professor: Bir Bhanu,, 
% TA: Vincent On,         
% EE 146 - 021


%% 1)
close all
clear all
% a)
I_crane = imread('gantrycrane.png');
I_circuit = imread('circuit.tif');
I_crane_gray = rgb2gray(I_crane);

% Crane threshold at 0.01
Crane_sobel_01 = edge(I_crane_gray,'sobel',0.01);
figure('Name','Crane, sobel edge, thresh = 0.01','NumberTitle','off')
imshow(Crane_sobel_01)
[H,T,R] = hough(Crane_sobel_01);
figure('Name','Houghs Plot of Crane, thresh = 0.01','NumberTitle','off')
imshow(H,[],'xData',T,'yData',R,'InitialMagnification','fit')
axis normal
P_Crane_01 = houghpeaks(H,10)
lines = houghlines(Crane_sobel_01,T,R,P_Crane_01);
houghLinePlot(Crane_sobel_01,I_crane_gray,lines);
L = LineLength(lines);  
MaxLine_Crane_01 = max(L)

% Crane threshold at 0.1
clear H T R P L lines;
Crane_sobel_10 = edge(I_crane_gray,'sobel',0.1);
figure('Name','Crane, sobel edge, thresh = 0.1','NumberTitle','off')
imshow(Crane_sobel_10)
[H,T,R] = hough(Crane_sobel_10);
figure('Name','Houghs Plot of Crane, thresh = 0.1','NumberTitle','off')
imshow(H,[],'xData',T,'yData',R,'InitialMagnification','fit')
axis normal
P_Crane_10 = houghpeaks(H,10)
lines = houghlines(Crane_sobel_10,T,R,P_Crane_10);
houghLinePlot(Crane_sobel_10,I_crane_gray,lines);
L = LineLength(lines);  
MaxLine_Crane_10 = max(L)

% Circuit threshold at 0.04
clear H T R P L lines;
Circuit_sobel_04 = edge(I_circuit,'sobel',0.04);
figure('Name','Circuit, sobel edge, thresh = 0.04','NumberTitle','off')
imshow(Circuit_sobel_04)
[H,T,R] = hough(Circuit_sobel_04);
figure('Name','Houghs Plot of Circuit, thresh = 0.04','NumberTitle','off')
imshow(H,[],'xData',T,'yData',R,'InitialMagnification','fit')
axis normal
P_Circuit_04 = houghpeaks(H,10)
lines = houghlines(Circuit_sobel_04,T,R,P_Circuit_04);
houghLinePlot(Circuit_sobel_04,I_circuit,lines);
L = LineLength(lines);  
MaxLine_Circuit_04 = max(L)



 % Circuit threshold at 0.1
clear H T R P L lines;
Circuit_sobel_10 = edge(I_circuit,'sobel',0.1);
figure('Name','Circuit, sobel edge, thresh = 0.10','NumberTitle','off')
imshow(Circuit_sobel_10)
[H,T,R] = hough(Circuit_sobel_10);
figure('Name','Houghs Plot of Circuit, thresh = 0.10','NumberTitle','off')
imshow(H,[],'xData',T,'yData',R,'InitialMagnification','fit')
axis normal
P_Circuit_10 = houghpeaks(H,10)
lines = houghlines(Circuit_sobel_10,T,R,P_Circuit_10);
houghLinePlot(Circuit_sobel_10,I_circuit,lines);
L = LineLength(lines);  
MaxLine_Circuit_10 = max(L)

%% 2)

I_board = checkerboard;
I_cameraman = imread('cameraman.tif');

% Harris features Cameraman
I_c_F = detectHarrisFeatures(I_cameraman,'MinQuality',0.1,'FilterSize',3);
figure('Name','Cameraman with 50 Stongest Peaks','NumberTitle','off')
imshow(I_cameraman)
hold on
plot(I_c_F.selectStrongest(50))
Percent_Error_Cameraman = 9.0/50*100

% Harris features Checkerboard
clear I_c_F
I_c_F = detectHarrisFeatures(I_board,'MinQuality',0.1,'FilterSize',3);
figure('Name','Checkerboard with 50 Stongest Peaks','NumberTitle','off')
imshow(I_board)
hold on
plot(I_c_F.selectStrongest(50));
Percent_Error_Checkerboard = 0

% Calculate hough line lengths 
function L = LineLength(lines)
       for k = 1:length(lines)
     X = [lines(k).point1; lines(k).point2];
     L(k) = pdist(X,'euclidean');
       end
end
%Calculate hough peaks and lines and plot over 
%original image
function  houghLinePlot(edge,orig,lines)
s = inputname(1);
figure('Name',['Houghs line overlay ''' s '''.'],'NumberTitle','off')
imshow(orig), hold on
       max_len = 0;
       for k = 1:length(lines)
         xy = [lines(k).point1; lines(k).point2];
         plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
         % plot beginnings and ends of lines
         plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
         plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
       end
     
    
end  