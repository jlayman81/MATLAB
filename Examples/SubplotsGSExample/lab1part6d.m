% lab1part6d(X) input column vector x and an output 
% column vector y where the i-th element of the 
% output vector is yi = f(xi) and f(xi) = 2 exp(?x2i ).
function [Y] = lab1part6d(X)  % declare function
X = X(:); % force column vector
Y = (2/sqrt(pi))*exp(-X.^2); % perform operation  
end

