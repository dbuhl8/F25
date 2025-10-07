


xmin = -8;
xmax = 2;

x = xmin:0.1:xmax;

y1 = exp(x);
y2 = cos(x);

f1 = figure;
plot(x,y1,'b',x,y2,'g',x,y1 - y2, 'r')

f2 = figure;

nx = length(x);

tspan = 0:0.1:5;

for i = 1:nx
   [t,y] = ode45("ode227",tspan,x(i));
   plot(t,y)
   hold on;
end 



