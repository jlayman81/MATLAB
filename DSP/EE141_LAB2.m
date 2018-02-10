%% Lab 2 Jesse Layman SID: 861135479

% Professor: Ertem Tuncel, 
% TA: Ceren Sevinc,         
% EE141-022 
close all
clear all
%% a)
j = sqrt(-1);
n = 0:1000;
K = 501;
w_k = linspace(-pi,pi,K);
x = 0.9.^n;
for k = 1:K
    X(k) = sum(x.*exp(-j.*w_k(k).*n));
end
%% b)
n_1 = 0:100;
x_1 = 0.9.^n_1;
for k = 1:K
    XX(k) = sum(x_1.*exp(-j.*w_k(k).*n_1));
end
%% c)
figure
plot(abs(X),'b-o');
hold on
plot(abs(XX),'r-x');
%% d)
y = 0.5.^n.*cos((pi*n)/8);
for k = 1:K
    Y(k) = sum(y.*exp(-j.*w_k(k).*n));
end
y_1 = 0.5.^n_1.*cos((pi*n_1)/8);
for k = 1:K
    YY(k) = sum(y_1.*exp(-j.*w_k(k).*n_1));
end
figure
plot(abs(Y),'b-o');
hold on
plot(abs(YY),'r-x');
%% e)
z = 2*x+3*y;
for k = 1:K
    Z(k) = sum(z.*exp(-j.*w_k(k).*n));
end
z_1 = 2*x_1+3*y_1;
for k = 1:K
    ZZ(k) = sum(z_1.*exp(-j.*w_k(k).*n_1));
end
figure
plot(abs(Z),'b-o');
hold on
plot(abs(ZZ),'r-x');
figure
plot(angle(Z),'b-o');
hold on
plot(angle(ZZ),'r-x');
%% f)
zf = 0.9.^(n+1);
for k = 1:K
    Zf(k) = sum(zf.*exp(-j.*w_k(k).*n));
end
zf_1 = 0.9.^(n_1+1);
for k = 1:K
    ZZf(k) = sum(zf_1.*exp(-j.*w_k(k).*n_1));
end
figure
plot(abs(Zf),'b-o');
hold on
plot(abs(ZZf),'r-x');
figure
plot(angle(Zf),'b-o');
hold on
plot(angle(ZZf),'r-x');
%% g)
zg = exp(j*(pi/2).*n).*0.9.^n;
for k = 1:K
    Zg(k) = sum(zg.*exp(-j.*w_k(k).*n));
end
zg_1 = exp(j*(pi/2).*n_1).*0.9.^n_1;
for k = 1:K
    ZZg(k) = sum(zg_1.*exp(-j.*w_k(k).*n_1));
end
figure
plot(abs(Zg),'b-o');
hold on
plot(abs(ZZg),'r-x');
figure
plot(angle(Zg),'b-o');
hold on
plot(angle(ZZg),'r-x');
%% h)
zh = X.*Y;
zh_1 = XX.*YY;
zhh=conv(x,y);
nn=0:2000;
for k = 1:K
    ZZh(k) = sum(zhh.*exp(-j.*w_k(k).*nn));
end

figure
plot(abs(zh),'b-o');
hold on
plot(abs(zh_1),'r-x');
plot(abs(ZZh),'g-*')
figure
plot(angle(zh),'b-o');
hold on
plot(angle(zh_1),'r-x');


