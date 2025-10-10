% pseudocode for exercise 1:

% write a function to return the ODE
% function dx = ode283(t,x)
%   compute dx = f(x)
% return dx

% find x(1) using dt = 1 euler method (only 1 line)
% x1 = x0 + 1*ode283(0,x0)

% write a loop to solve euler's method with 4 different dt sizes
%
% find out how many times to apply eulers method for that dt
% ex: nt = tstop / dt
%
% in that loop, apply eulers method nt times (with another loop)
% t(n+1) = t(n+1) + dt
% x(n+1) = x(n) + dt*ode283(t(n),x(n))