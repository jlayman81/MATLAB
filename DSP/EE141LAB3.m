%% Lab 3 Jesse Layman SID: 861135479

% Professor: Ertem Tuncel, 
% TA: Ceren Sevinc,         
% EE141-022

%% a) Attached at the end of the report.

%% b)
close all
clear all
load ride;
p = audioplayer(audio_sample,fs)
n = 1:1000;
j=sqrt(-1);
a = 0.9+0.1*j;
c = 0.02;
H(n) = c/(1-(conj(a)/a))*a.^n+c/(1-(a/conj(a)))*conj(a).^n;
Y1 = conv(audio_sample(:,1),H);
Y2 = conv(audio_sample(:,2),H);
Y = [Y1 Y2];
%play(p)

%% c)
yf = fft(Y);
figure
plot(fftshift(abs(yf)),'b-o');
hold on
plot(fftshift(abs(audio_sample)));

%% d)
a2 = -0.9+0.1*j;
c2 = -0.02;
H2(n) = c2/(1-(conj(a2)/a2))*a2.^n+c2/(1-(a2/conj(a2)))*conj(a2).^n;
Y1_2 = conv(audio_sample(:,1),H2);
Y2_2 = conv(audio_sample(:,2),H2);
Y2 = [Y1_2 Y2_2];
yf_2= fft(Y2);
figure
plot(fftshift(abs(yf_2)),'b-o');
hold on
plot(fftshift(abs(audio_sample)));

%% e)
a3 = 0.9*j;
c3 = 0.19;
H3(n) = c3/(1-(conj(a3)/a3))*a3.^n+c3/(1-(a3/conj(a3)))*conj(a3).^n;
Y1_3 = conv(audio_sample(:,1),H3);
Y2_3 = conv(audio_sample(:,2),H3);
Y3 = [Y1_3 Y2_3];
yf_3= fft(Y3);
figure
plot(fftshift(abs(yf_3)),'b-o');
hold on
plot(fftshift(abs(audio_sample)));






































































































