%% Lab 7 Jesse Layman SID: 861135479

% Professor: Ertem Tuncel, 
% TA: Ceren Sevinc,         
% EE141-022

%% Step 1
close all
clear all
N = 10;


%% Step 2
A = 0:511;
for  k = 1:512
    if k <= 64 || k >= 446;
        A(k) = 1;
    else 
        A(k) = 0;
    end
end
%% Step 3
g = ifft(A.*exp(-j*pi*k*N/512));

%% Step 4
h = [g(1:N+1) zeros(1,511-N)];

%% Step 5
H = fft(h);

%% Step 6
B = H.*exp(j*pi*k*N/512);
B = real(B);
%% Step 7
for  k = 1:512
    if k <= 64 || k >= 446;
        if B(k) >= 0.95 && B(k) <= 1
            A(k) = B(k);
        elseif B(k) > 1;
            A(k) = 1;
        elseif B(k) < 0.95
           A(k) = 0.95;
        end
    end
end
plot(abs(A));
%% 2)




