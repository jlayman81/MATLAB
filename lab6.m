%% EE 141 DSP Lab 6: Filter Design Using Butterworth Filters
%% 
% In this lab, we will design discrete-time lowpass filters using the
% continuous-time Butterworth filter design. We will explore both the impulse
% invariance approach and the bilinear transformation approach. 
%% Problem Q1 A:
% Choose some sampling period T and a high enough order N such that the
% continuous-time Butterworth filter with magnitude
%Do test cases
clear; close;
N = zeros(1,4); T = rand(1); omega_c = 0.24*pi/T;
w0 = 0;
N(1) = butterNValue(0.99,1,w0/T,omega_c);
w1 = 0.2*pi;
N(2) = butterNValue(0.99,1,w1/T,omega_c);
w2 = 0.3*pi;
N(3) = butterNValue(nan,0.01,w2/T,omega_c);
w3 = pi;
N(4) = butterNValue(nan,0.01,w3/T,omega_c);
N_spec = max(N); % outputs 21
% For w_cont > pi/T, mag should be negligible for chosen T. 
%% Problem Q1 B:
% find the coefficients Ak in the partial fraction expansion
% For this, you need to use the poly and residue functions in MATLAB.
% Note that the Ak’s may end up being complex.
cutoff = 0.25*pi/T;
k = 1:N_spec; %originally I had this go to 2*N_spec, which is an error
p0 = cutoff*exp(1i*pi/2/N_spec*(2*k+N_spec-1)); %poles, the roots of Hc(s)
z0 = inf*ones(1,N_spec);
Hc = prob2(z0,p0,cutoff^N_spec);
[A,p1,~] = prob3(Hc); % note that p1 and p0 should have the same values, but sorted differently
%% Problem Q1 C:
%Plot |Hd(ejw)" for -pi<=w<=pi by sufficiently sampling the frequency axis (step size of 0.01 would do).
% On top of your plot, draw lines indicating the specifications above.
% Are they satisfied? Discuss why or why not.
w = -pi:0.01:pi;
temp = zeros(length(w),length(p1));
for k = 1:length(p1)
    temp(:,k) = T*A(k) ./ (1-exp(p1(k)*T-1i*w));
end
Hd = sum(temp,2);
figure(1)
plot(w,abs(Hd),'k','LineWidth',2)
hold on
plotSpec()
title('Q1: Impulse Invariance approach |H_d(e^j^w)|')
xlabel('w')
%% Problem Q2 A:
%We will design a filter with the same specifications as in Question 1,
% but this time using the bilinear transformation
% s = 1-z^-1 / 1+z^-1
% Using the transformation omega_uppercase = tan(w/2) rewrite the
% requirements in the  omege_uppercase domain (discrete time FT)

% 0.99 <= |Hc(jomega)| <= 1 for tan(-0.2*pi/2) <= omega <= tan(0.2*pi/2)
% |Hc(jomega) <= 0.02 for tan(0.3*pi/2) <= |omega| <= tan(pi/2)
%% Problem Q2 B:
% Choose a cutoff frequency(omega_c) and an N such that the Butterworth
% filter satisfies the specifications.
clear;
omega_c = tan(0.25*pi/2);
N = zeros(1,4);
w0 = tan(0/2);
N(1) = butterNValue(0.99,1,w0,omega_c);
w1 = tan(0.2*pi/2);
N(2) = butterNValue(0.99,1,w1,omega_c);
w2 = tan(0.3*pi/2);
N(3) = butterNValue(nan,0.01,w2,omega_c);
w3 = inf; % tan(pi/2) = inf
N(4) = butterNValue(nan,0.01,w3,omega_c);
N_spec = max(N);
%% Problem Q2 C:
% Plot |Hd(ejw)| by directly computing it via the substitution 
% omega = tan(w/2) in (1). On top of your plot, draw
% lines indicating the specifications above. Are they satisfied?
w = -pi:0.01:pi;
omega = tan(w/2);
Hd_mag = 1./sqrt(1+(omega/omega_c).^(2*N_spec));
figure(2)
plot(w,Hd_mag,'k','LineWidth',2)
hold on
plotSpec()
title('Q2: Bilinear Transformation |H_d(e^j^w)|')
xlabel('w')
%% END

%% Functions
function N = butterNValue(specMin,specMax,w,cutoff)
if isnan(specMin)
    specMin = -inf;
end
if isnan(specMax)
   specMax = +inf; 
end
param = (w/cutoff)^2;
N = 1;
while true
   mag = 1/sqrt(1+param^N);
   if (mag >= specMin) && (mag <= specMax)
       break
   end
   N = N + 1;
end
end
function [H1] = prob2(zeros,poles,g) %from lab 1
num = poly(zeros);
den = poly(poles);
H1 = tf(g*num,den,-1);
end
function [r,p,k] = prob3(H1) %from lab 1
b = H1.Numerator{1}; % use syntax in accordance with 'doc residue'
a = H1.Denominator{1};
[r,p,k] = residue(b,a);
end
function plotSpec()
w = -pi:0.01:pi;
len = length(w);
w1 = 0.2*pi; w2 = 0.3*pi; w3 = pi;
x1 = linspace(-w1,w1,len);
x2 = linspace(-w3,-w2,len); x3 = linspace(w2,w3,len);
c1 = ones(1,len); c2 = 0.99*c1; c3 = 0.01*c1;
d1 = pi*ones(1,len); d2 = 0.3*d1; d3 = 0.2*d1; y = linspace(0,1,len);
plot(x1,c1,'r-',x1,c2,'r-',x2,c3,'r-',x3,c3,'r-',d2,y,'b--',d3,y,'b--',-d2,y,'b--',-d3,y,'b--')
end

