close all;
clear;
clc;

xmin = 0;
xmax = 3;

ymin = 0;
ymax = 3;

tstart = 0;
tstop = 5;

resolution = 20;


[XX, YY] = meshgrid(linspace(xmin,xmax,resolution),linspace(ymin,ymax,resolution));
f1 = figure();

% plot eigenvectors
l1 = 0.5*(1 + sqrt(17));
l2 = 0.5*(1 - sqrt(17));

x1 = -2;
y1 = -2;
v1x = [x1-1,y1+1];
v1y = [x1+4/l1,y1-4/l1];
v2x = [x1-1,y1+1];
v2y = [x1+4/l2,y1-4/l2];

%plot(v1x,v1y,'r')
hold on
%plot(v2x,v2y,'r')
xlim([xmin,xmax]);
ylim([ymin,ymax]);

%plot(0,0,'xr');
%plot(0.5,0,'xb');
%plot(1,-1,'xy');
%plot(1,1,'xm');



for i = 1:resolution
    for j = 1:resolution
        x0 = XX(i,j);
        y0 = YY(i,j);

        [t,y] = ode45(@ode_2D,tstart:0.1:tstop,[x0;y0]);

        plot(y(:,1),y(:,2),'--g');
    end
end

