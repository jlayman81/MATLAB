%% EE 146 HW 1 Jesse Layman SID: 861135479

% Professor: Bir Bhanu, 
% TA: Vincent On,         
% EE 146 - 001
close all
clear all

%% 1.2)
f = 50
Y = 12000
Z = 95000
X = 1;
% height of projection in mm
height = -f*Y/Z
width = 1;
% find number of pixels
DPI = 4000;
mmtoi = 0.0393701;
Pixels = -1*(height)*width*DPI*mmtoi

%% 1.8)
y = -f*Y/Z
x = -f*X/Z

% changis in Y or height do not effect changes in offset x
% in the case of a line the offset remains constant for any given y.

%% 3.6)

% Read images from graphics file
I_cameraman = imread('cameraman.tif');
H = imhist(I_cameraman);
% Find mean

% eq 3.13 and 3.14
A = 0;
B = 0;
A_temp = 0;
B_temp = 0;
for i = 0:255;
    A_temp = H(i+1)*i + A;
    B_temp = H(i+1)*i^2+B;
    A = A_temp;
    B = B_temp;
end
% eq 3.11 mean
Mean = 1/(256*256)*A;
%eq 3.12 variance
Variance = 1/(256*256)*(B-A^2/(256*256));

%% 11.2)
% Calculate median
I_size = size(I_cameraman);
r = I_size(1);
c = I_size(2);
B = r*c/2;
i_min = 0;
m_temp = 0 ;
for i = 0:255;
m_temp = H(i+1) + m_temp;
if m_temp >= B
    i_min = i
    break
end
end
i_bin = zeros(r,c);
for i = 0:(B*2-1)
    if I_cameraman(i+1) <= 144
        i_bin(i+1) = 0;
    else i_bin(i+1) = 255;
    end
end

imshowpair(I_cameraman,i_bin,'montage')

%% 11.4)

I_peppers = imread('peppers.png');
H_r = imhist(I_peppers(:,:,1),255);
H_g = imhist(I_peppers(:,:,2),255);
H_b = imhist(I_peppers(:,:,3),255);

I_psize = size(I_cameraman);
rp = I_psize(1);
cp = I_psize(2);
Bp = rp*cp/2;
i_min = 0;
m_temp = 0 ;
for i = 0:255;
m_temp = H_r(i+1)+ m_temp;
if m_temp >= Bp
    i_min = i
    break
end
end
ip_r = zeros(rp,cp);
for i = 0:(Bp*2-1)
    if I_peppers(i+1) <= i_min
        ip_r(i+1) = 0;
    else ip_r(i+1) = 255;
    end
end
i_min = 0;
m_temp = 0 ;
 for i = 0:255;
m_temp = H_g(i+1)+ m_temp;
if m_temp >= Bp
    i_min = i
    break
end
end
ip_g = zeros(rp,cp);
for i = 0:(Bp*2-1)
    if I_peppers(i+1) <= i_min
        ip_g(i+1) = 0;
    else ip_g(i+1) = 255;
    end
end 

i_min = 0;
m_temp = 0 ;
 for i = 0:255;
m_temp = H_b(i+1)+ m_temp;
if m_temp >= Bp
    i_min = i
    break
end
end
ip_b = zeros(rp,cp);

for i = 0:(Bp*2-1)
    if I_peppers(i+1) <= i_min
        ip_b(i+1) = 0;
    else ip_b(i+1) = 255;
    end
end 

bin_peppers = zeros(rp,cp);
for i = 0:(Bp*2-1)
 bin_peppers(i+1) = ip_r(i+1) && ip_g(i+1) && ip_b(i+1);
end      
  imshow(bin_peppers)  
  


