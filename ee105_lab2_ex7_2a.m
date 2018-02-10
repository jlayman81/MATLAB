clear

A = [0,1;-25,-4];
B = [0;25];
C = [1,0];
D = [0];

SYS1 = ss(A,B,C,D);
t = 0:1:50;
% U(length(t)) = 0; 
U = sin(.1*t);

X0 = [3;0];
lsim(SYS1,U,t,X0)
