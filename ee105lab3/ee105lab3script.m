%%
for t = 1:10
    y(t) = exp(0);
end
figure
subplot(3,1,1);
stem(y);
title('a = 0');
%%
clear all
for t = 1:10
    y(t) = exp(t);
end

subplot(3,1,2);
stem(y);
title('a > 0')
clear all
%% 
for t = 1:10
    y(t) = 1/exp(0);
end

subplot(3,1,3);
stem(y);
title('a < 0');