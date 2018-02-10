%% Lab 5 Jesse Layman SID: 861135479

% Professor: Ertem Tuncel, 
% TA: Ceren Sevinc,         
% EE141-022

%%1)
clear all
close all
n = 0:300;
T = 0.01;
%t = 1:300;
nT = T.*n;
xn = cos(10*pi.*(nT))+0.5*cos(15*pi.*(nT))-0.25*cos(20*pi.*(nT));
N = 1;
for n1=0:2*N
    if n1==N
    h(n1+1) = 0;
    else
    h(n1+1) = (-1).^((n1)-N)/(((n1)-N)*T);
    end
end
yc = -10*pi*sin(10*pi.*(nT-N*T))-(15/2)*pi*sin(15*pi.*(nT-N*T))+5*pi*sin(20*pi.*(nT-N*T));
Yn = conv(h,xn);
% The two signals agree.
figure
plot(Yn,'r-')
hold
plot(yc,'b-');
%%
%%2)
n=0:300;
T2 = 0.1;
n2T2 = T2.*n;
xn2 = cos(2*pi.*n2T2);
delta = 0.03;
N2=5;
for n2=0:2*N2
h2(n2+1) = sin(pi.*(n2-N2-delta/T2))/(pi.*(n2-N2-delta/T2));
end
y2n = conv(h2,xn2);
y2c = cos(2*pi.*(n2T2-N2*T2-delta)); 
figure
plot(y2n,'r-')
hold
plot(y2c,'b-');
%%