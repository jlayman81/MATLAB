function [dx] = fldlvl(t,X,U); %
% This function represents the right hand side
% of the fluid level system dynamics. In general,
% dx will have the same dimension as
% the state vector x
A = [0,1;-25,-4];
B = [0;25];
C = [1,0];
D = [0];
dx = A*X + B*U; % rhs of dynamic equation
%===============================


