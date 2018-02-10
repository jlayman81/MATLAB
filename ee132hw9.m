clear all
sys = 's'
z = conv([1],[2 1])
denom = conv(z,[0.04 0.24 1]);
num = [4 10];
x = tf(num,denom);
margin(x)
bode(x)
