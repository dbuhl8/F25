clear;
close all;
clc; 

% Define Initial Condition
x0 = [5,0]; %x(0) = 1
tstop = 50;
tstart = 0;

% dt = 1 approximation
% when dt = 1, what is x(1) according to eulers method
% x(1) = x(0) + dt * f(x(0))
%x1 = x0 + ode283(0,x0);
% x(1) = 0, when using dt = 1 in eulers method

% opening a figure
f1 = figure;
%plot analytical solution x(t) = e^-t
% an array containing time values t = [0, 1]
tspan = tstart:0.1:tstop;
% analytical solution x(t) = e^-t
%x_act = exp(-tspan);

% plotting actual solution
%plot(tspan, x_act, '-red');
%hold on;

% plot the 1st order euler method with different dt
% repeating for dt = 10^(-n)
%error = zeros(1,4);

    [t,y] = ode45(@ode283,[0,1],x0);
    %tt(1) = tstart; % putting in the IC for time
    %xt(:,1) = x0; % putting in IC for x
    
    % tt and xt are full of timeseries data 
    %error(i) = abs(1/exp(1) - xt(end));
    plot(y(1,:),y(2,:), '--') ;


%legend('Actual', 'n = 1', 'n = 2', 'n = 3', 'n = 4')

%f2 = figure;


%loglog(1./dt_array, error,'x');





