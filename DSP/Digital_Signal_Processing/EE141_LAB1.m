%% Lab 1 Jesse Layman SID: 861135479

% Professor: Ertem Tuncel, 
% TA: Ceren Sevinc,         
% EE141-022 


%% Problem 1
%a)
z1_a = roots([2  16 34 20  0])
p1_a = roots([1 -10 35 -50 24])
g1_a = 2/1

G1_a = zpk(z1_a,p1_a,g1_a)

%b)
z1_b = roots([10 -21 14 -3])
p1_b = roots([3   -3 -6  0])
g1_b = 10/3
G1_b = zpk(z1_b,p1_b,g1_b)

%c)
z1_c = roots([1 0 0 0 -1 0 0 0 0])
p1_c = roots([1 0 0 0 0 0 0 0 -1])
g1_c = 1/1
G1_c = zpk(z1_c,p1_c,g1_c)


%% Problem 2
%a)
z2_a = poly([5  -4  1])
p2_a = poly([6 -13 -2])
g2_a = 8
G = tf(g2_a*z2_a,p2_a)

%b)
j=sqrt(-1);
z2_b = poly([2 1+j 1-j])
p2_b = poly([3 -1 -j j])
g2_b = 2
G = tf(g2_b*z2_b,p2_b)

%c)
z2_c = poly([-1 1 -j j])
p2_c = poly([0 3])
g2_c = -3
G = tf(g2_c*z2_c,p2_c)


%% Problem 3

%a)
n_a = [4 0 -4]
d_a = [1 -3 0]
[r,p,k] = residue(n_a,d_a)

% = 10.667/(z-3) + 1.33/(z+4)

%b)
n_b = [1 0 0 1]
d_b = [1 0 1]
[r,p,k] = residue(n_b,d_b)
% = z+(-0.5-0.5j)/(z-j)+(-0.5+0.5j)/(z+j) 


%% Problem 4
figure
zplaneplot(z1_a,p1_a)
title('Plot of Problem 1, A')

figure
zplaneplot(z1_b,p1_b)
title('Plot of Problem 1, B')

figure
zplaneplot(z1_c,p1_c)
title('Plot of Problem 1, C')















