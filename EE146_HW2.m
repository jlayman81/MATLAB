%% EE 146 HW 1 Jesse Layman SID: 861135479

% Professor: Bir Bhanu, 
% TA: Vincent On,         
% EE 146 - 001
close all
clear all

% 9.1
I = [0 0 0 0 1 0
      0 1 1 1 1 1
      1 0 1 1 1 1
      1 1 0 1 1 0
      0 0 1 0 1 0
      0 0 0 1 0 0]
  
   H1 = [1 0 0;0 1 0;0 0 1]
 H2 = [0 1 0;1 1 1;0 1 0]
  % Dilate H1 complete
 H1I = [1 1 1 1 1 0
           0 1 1 1 1 1
           1 0 1 1 1 1
           1 1 0 1 1 1
           0 1 1 0 1 1
           0 0 1 1 0 1] 
% Dilate H2 complete
  H2I = [0 1 1 1 1 1
           1 1 1 1 1 1
           1 1 1 1 1 1
           1 1 1 1 1 1
           1 1 1 1 1 1
           0 0 1 1 1 0]
 
% Erode H1
EH1I = [ 0 0 0 0 1 0
             0 0 0 0 0 1
             1 0 1 1 0 1
             0 1 0 1 0 0
             0 0 1 0 0 0
             0 0 0 1 0 0 ]
% Erode H2
EH1I = [ 0 0 0 0 0 0
             0 0 0 0 1 0
             0 0 0 1 1 0
             0 0 0 0 0 0
             0 0 0 0 0 0
             0 0 0 0 0 0 ]
         
%% 9.2
% using this shape
HC = [ 1 1 1; 1 0 0; 1 1 0]
% First erode, then dilate

%% 10.8
% Exercise 10.8. While computing the convex hull of a region, 
% the maximal diameter (maximum distance between 
% two arbitrary points) can also be simply found. 
% Devise an alternative method for computing this 
% feature without using the convex hull. Determine the 
% running time of your algorithm in terms of the number 
% of points in the region.

% Find boundry, compute distance between pixels, find max distance.
% MN+MN+MN = 3MN
