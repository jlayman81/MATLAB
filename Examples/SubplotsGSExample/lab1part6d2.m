function [Q] = vectorformation(N)
x = [0:5/(N+1):5]; %N+1 equally spaced points between 0 and 5
y = lab1part6d(x); %call previous file for f(x)
plot(x,y);
Q = quad(@lab1part6d,0,5) % added this line for part 7
end

