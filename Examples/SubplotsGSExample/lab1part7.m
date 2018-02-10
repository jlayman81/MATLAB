function [ Y ] = untitled( N )
%Implementation of code from part 7c
% Q1
dx = 5/(N-1);
x = 0:dx:5;
y = lab1part6d(x);
A = [ones(N-1,1);0];
Q1 = y'*A*dx
Y = Q1;
end

