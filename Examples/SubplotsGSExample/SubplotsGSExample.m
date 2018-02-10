%% Subplots
% You can display multiple plots in different subregions of the same window
% using the |subplot| function.
%
% The first two inputs to  |subplot| indicate the number of plots in each
% row and column. The third input specifies which plot is active. For
% example, create four plots in a 2-by-2 grid within a figure window.

% Copyright 2015 The MathWorks, Inc.

t = 0:pi/10:2*pi;
[X,Y,Z] = cylinder(4*cos(t));
subplot(2,2,1); mesh(X); title('X');
subplot(2,2,2); mesh(Y); title('Y');
subplot(2,2,3); mesh(Z); title('Z');
subplot(2,2,4); mesh(X,Y,Z); title('X,Y,Z');