%% EE 146 HW 3 Jesse Layman SID: 861135479

% Professor: Bir Bhanu, 
% TA: Vincent On,         
% EE 146 - 001
close all
clear all

%% 5.2
% Exercise 5.2. Determine the possible maximum and minimum 
% re- sults (pixel values) for the following linear filter, when applied 
%to an 8-bit grayscale image (with pixel values in the range 
%[0, 255]):
% H= [?1?2 0; ?2 0 2; 0 2 1] .
% Assume that no clamping of the results occurs.

% I' (u,v) ? SUM(-1:1, I(u + i,v + j) · H(i,j))
% Find MIN => I(u,v) = 0, I(u + i,v + j) = 0, I(u - i,v - j) = 0
% => 0(H(i,j))+...+0(H(i,j)) = 0 min pixel value is 0;
% Find MAX =>I(u,v) = 255, I(u + i,v + j) = 255, I(u - i,v - j) = 255
% => 255(-1)+255(-2)+255(0)+255(-2)+255(0)+255(2)+255(0)+...
% 255(2)+255(1) = 0 ... Max Value is 0...

%% 5.9
% Exercise 5.9. Compare the number of processing steps 
% required for non-separable linear filters and x/y-separable filters
% sized 5 × 5, 11 × 11, 25 × 25, and 51 × 51 pixels. Compute the 
% speed gain resulting from separability in each case.
% 5x5 = seperable = 10 non seperable = 25 = 60% faster
% 11x11 = seperable = 22 non seperable = 121 = 82% faster
% 25x25 = seperable = 50 non seperable = 625 = 92% faster
% 51x51 = seperable = 102 non seperable = 2601 = 98.1% faster

%% 6.1
% Calculate (manually) the gradient and the Laplacian (using the 
% discrete approximations in Eqn. (6.2) and Eqn. (6.32), respectively) for 
% the following ?image?:
clear all
I = [ 14 10 19 16 14 12; 
       18   9 11 12 10 19;
         9 14 15 26 13  6;
       21 27 17 17 19 16;
       11 18 18 19 16 14;
       16 10 13  7  22 21; ]
% EQ 6.2 => df/dx(u) = (f(u+1)-f(u-1))/2

% Ix' = [ -2    2.5    3    -2.5  -2    -1
%       -4.5  -3.5  1.5  -0.5  3.5    4.5
%         2.5    3      6    -1    -10  -3.5
%           3   -2     -5     1    -0.5  -1.5
%           7   3.5   0.5  -1    -2.5  -1
%         -3  -1.5 -1.5  4.5     7    -0.5

% Iy' = [ -2     -0.5     -4     -2     -2      3.5
%          -2.5     2       -2      5     -0.5    -3
%           1.5      9        3      2.5    4.5   -1.5
%             1       2       1.5  -3.5    1.5      4
%          -2.5   -8.5     -2    -5      1.5     2.5
%           2.5    -4     -2.5   -6       3        3.5]

% HL = [0 1 0; 1 -4 1; 0 1 0;];

% Laplace = 
%     [0    14    10    19    16    14    12     0
%   14   -28     2   -39   -19   -18   -15    12
%   18   -40    17    11    15    18   -48    19
%     9    17     4     8   -47     9    24     6
%    21   -37   -38     9    13   -14   -25    16
%    11    11    -6    -5   -18    10    -3    14
%    16   -43     7   -17    26   -44   -48    21
%    0    16    10    13     7    22    21     0]

%% 6.3
% Express the Sobel operator (Eqn. (6.10)) in x/y separable 
% form analogous to the decomposition of the Prewitt operator in Eqn. (6.9).

%HSZ = [1 2 1]'*[-1 0 1]

%% 6.5
% Devise and implement a compass edge operator 
% with more than eight (16?) differently oriented filters.
% 4x4 matrix is needed

%% Q. Write the pseudo code to perform median filtering on an image.
%I = imread(Image);
%for i = 1:size(I)
  %  if i = 1
    %    I(i) = (I(i+1)-I(i))/2
   % end
    %if i = size(I)
     %       I(i) = (I(i)-I(i-1))/2
    %else 
      %      I(i) = (I(i+1)-I(i-1))/2
   % end
%end

%% Q. How is the edge detection in color images different from gray scale images? 
% Color images operations must be performed on 3 channels.

%% Q. 12.8 (optional, extra credit)


   