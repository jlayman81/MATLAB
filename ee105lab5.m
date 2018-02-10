%% Part 1 find the transfer function.
clear all
%Variable values from the problem statement
s = 1j*2*pi*60;
R = 1000;
C = .000100;
%per TA syms L
syms L;
L = 0.5:.001:1.5;
%Functions provided by TA
num = [s R];
den = [C*s^3 R*C*s^2 2*s R];
H = abs(polyval(num,L)./polyval(den,L));
plot(L,H)
grid on

