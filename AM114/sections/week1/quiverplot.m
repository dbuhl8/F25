close all;
clear;
clc;


% direction field example 1

ymin = -3;
ymax = 3;
tmin = 0;
tmax = 8;

tspan = tmin:0.1:tmax;
yspan = ymin:0.1:ymax;

% dy/dt = cos(2t) - y/t;
dY = @(t,y) cos(2*t) - y./t;

[T,Y] = meshgrid(tspan,yspan);

DY = dY(T,Y);
DT = ones(size(DY));

norm = sqrt(DY.^2 + DT.^2);
DY = DY./norm;
DT = DT./norm;

quiver(T,Y, DY,DT);

