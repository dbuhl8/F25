clear;
close all;
clc;

% Direction Field Example 3

xmin = -5;
xmax = 15;
ymin = -4;
ymax = 4;

np = 15;
dx = (xmax-xmin)/np;
dy = (ymax-ymin)/np;

xspan = xmin:dx:xmax;
yspan = ymin:dy:ymax;

[X, Y] = meshgrid(xspan,yspan);

dY = (4-X)./(Y.^3 + 2);
dX = ones(size(dY));

norm = sqrt(dY.^2 + dX.^2);

C = Y.^4 + 2*X.^2 - 16*X + 8*Y;

quiver(X, Y, dX./norm, dY./norm)
hold on
contour(X, Y, C)

