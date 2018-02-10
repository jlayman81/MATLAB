% Mulitplication of two matrices
clear all % clear the memory
A = [pi;sqrt(2);exp(1)];
B = [1;5;7];
C = 0;
% sumation of element wise multiplication
for c = 1:3
    C = A(c)*B(c)+C;
end
    
A = [pi;sqrt(2);exp(1)];
B = [1;5;7];
C = A'*B;
