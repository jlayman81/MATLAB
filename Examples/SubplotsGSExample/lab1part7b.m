function [ A ] = untitles( x )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Q = 2:x;
Z = 2:x;
for c = 2:x
    
  Q(c-1) =  lab1part7(c-1);
  
end
  plot(Z,Q)

