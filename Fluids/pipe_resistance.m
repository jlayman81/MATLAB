function [R]=pipe_resistance(l,d)
mu  =   1e-3;   % N s/m/m
R   =   128*mu*l/pi/(d^4);