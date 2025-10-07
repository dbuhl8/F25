clear;
close all;
clc; 

x0 = 1;
tstop = 1;
tstart = 0;

% dt = 1 approximation
x1 = x0 + ode283(0,x0);

f1 = figure;
%plot analytical solution
tspan = tstart:0.1:tstop;
x_act = exp(-tspan);

plot(tspan, x_act, '-red');
hold on;

% plot the 1st order euler method with different dt
% repeating for dt = 10^(-n)
for i = 1:4
    dt = 10^(-i);
    nt = tstop/dt;
    tt = zeros(1,nt);
    xt = zeros(1,nt);
    tt(1) = tstart;
    xt(1) = x0;
    for j = 2:nt
        tt(j) = tt(j-1) + dt;
        xt(j) = xt(j-1) + dt*ode283(tt(j-1),xt(j-1));
    end
    plot(tt,xt, '--') ;
end

legend('Actual', 'n = 1', 'n = 2', 'n = 3', 'n = 4')