% ee105 Lab4 part 2
% initialize coeficients
clear all
a = 1;
b = 9;
c = .1;
d = 1;
% State space model
A = [0 1/b 0 0; -1/a 0 0 -1/a; ...
    0 0 0 1/d; 0 1/b -1/b -1/(b*c);];
B = [0; 1/a; 0; 0];
C = [0 0 0 1];
D = 0;
[n,d] = ss2tf(A,B,C,D); % transfrer function
ZEROS = roots(n); %roots of the numerator
POLES = roots(d); %roots of the denominator
bode(n,d);



