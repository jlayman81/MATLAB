% Generate random data from a uniform distribution
% calculate mean, plot data and mean

n = 50; % 50 data points
r = rand(n,1);
plot(r)
% draw a line from (0,m) to (n,m)
m = mean(r)
hold on
plot([0,n],[m,m])
hold off
title('Mean of Random Uniform Data')
