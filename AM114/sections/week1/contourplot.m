
% Direction Field Example 2

xmin = -5;
xmax = 5;
ymin = -2;
ymax = 2;

xspan = xmin:0.5:xmax;
yspan = ymin:0.5:ymax;

[X, Y] = meshgrid(xspan, yspan);

% this should be the solution to the ODE we are attempting to solve
C = Y.^4 + X.^2;

% this version of the contour plot doesn't specify the contour levels
%contour(X,Y,C)


% this version of the contour plot specifies at what levels the contour should be plotted
contour(X,Y,C,[1,4,16])
% i.e. whereever C = 1, 4, or 16, a contour of C = n will be plotted
