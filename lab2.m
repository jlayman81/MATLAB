function lab2(x0,T)
% For the given initial condition x0 and step size % T this function uses Euler integration to
% numerically solve the differential equation
% of the fluid level system.
%TODO calculate CPU TIME
N = round(25/T) +1; 
t = zeros(1,N);
x = zeros(2,N);
x(:,1) = x0;
t = T*(0:N-1);
tic
u = sin(0.1*t);
for i=1:N
dx = fldlvl(t(i),x(:,i),u(:,i)); 
x(:,i+1) = x(:,i) + dx*T;
end
toc
clf;
plot(t(1:i)',x(1,1:i)');
str = sprintf('Fluid Sim. for T = %g',T); 
title(str);
xlabel('Time, t, seconds');
ylabel('Fluid height, h, meters');

        