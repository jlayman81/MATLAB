%% Lab 4 Jesse Layman SID: 861135479

% Professor: Ertem Tuncel, 
% TA: Ceren Sevinc,         
% EE141-022

%% 1_a) 
close all
clear all
load ertem_voice;
p = audioplayer(audio_sample,fs)
%play(p);
Yf = fft(audio_sample);
figure
plot(fftshift(abs(Yf)),'b-')
%% 1_b)
sample_4k = audio_sample(1:2:end);
Yf1 = fft(sample_4k);
fs_4k = fs/2;
p1 = audioplayer(sample_4k,fs_4k);
%play(p1);
figure
plot(fftshift(abs(Yf1)),'r-')

%% 1_c) 
% 2000 Hz sample
sample_2k = sample_4k(1:2:end);
Yf2 = fft(sample_2k);
fs_2k = fs/4;
p2 = audioplayer(sample_2k,fs_2k);
%play(p2);
figure
plot(fftshift(abs(Yf2)),'g-')
%1000 Hz sample
sample_1k = sample_2k(1:2:end);
Yf3 = fft(sample_1k);
fs_1k = fs/8;
p3 = audioplayer(sample_1k,fs_1k);
%play(p3);
figure
plot(fftshift(abs(Yf3)),'b-')

%% 1_d)
h_4k = [1 1]/2;
prefiltered_4k = conv(audio_sample,h_4k);
AAsample_4k = prefiltered_4k(1:2:end);
Yf4 = fft(AAsample_4k);
p4 = audioplayer(AAsample_4k,fs_4k);
%play(p4);
figure
plot(fftshift(abs(Yf4)),'r-')
%%
h_2k = [1 1 1 1]/4;
prefiltered_2k = conv(audio_sample,h_2k);
AAsample_2k = prefiltered_2k(1:4:end);
Yf5 = fft(AAsample_2k);
p5 = audioplayer(AAsample_2k,fs_2k);
%play(p5);
figure
plot(fftshift(abs(Yf5)),'g-')
%%
h_1k = [1 1 1 1 1 1 1 1]/8;
prefiltered_1k = conv(audio_sample,h_1k);
AAsample_1k = prefiltered_1k(1:8:end);
Yf6 = fft(AAsample_1k);
p6 = audioplayer(AAsample_1k,fs_1k);
%play(p6);
figure
plot(fftshift(abs(Yf6)),'b-')

%% 2_a)
sample_32k = upsample(audio_sample,4);
Yf7 = fft(sample_32k);
figure
plot(fftshift(abs(Yf7)),'r-')

%% 2_b)
h_ZOH = [1 1 1 1];
ZOH_32k = conv(sample_32k,h_ZOH);
Yf8 = fft(ZOH_32k);
figure
plot(fftshift(abs(Yf8)),'g-')

%% 2_c)
h_tri = [.25 .5 .75 1 .75 .5 .25];
tri_32k = conv(sample_32k,h_tri);
Yf9 = fft(tri_32k);
figure
plot(fftshift(abs(Yf9)),'b-')


%% 2_b)
h_sinc = sinc(-4:.25:4);
sinc_32k = conv(sample_32k,h_sinc);
Yf10 = fft(sinc_32k);
figure
plot(fftshift(abs(Yf10)),'r-')


































































































