close all;
clear;
clc;

xmin = 0.5;
xmax = 2;

ymin = 0.5;
ymax = 2;

tstart = 0;
tstop = 0.25;

resolution = 40;

f1 = figure
hold on;
xlim([xmin,xmax]);
ylim([ymin,ymax]);


% plot a single trajectory
x0 = 1;
y0 = 1;
[t,y] = ode45(@ode_2D,tstart:0.01:tstop,[x0;y0]);
c = exp(1) - 0.5;
c2 = atan(1/sqrt(2*c));
xa = sqrt(c*2)*tan(sqrt(c/2)*t + c2);
plot(y(:,1),y(:,2),'xg');
hold on;
plot(xa,log((xa.^2)/2 + c),'r');
legend('Numerical Solution', 'Actual Solution')


