
% This is a standard function defintion for matlab 

% statedot is the returned variable
% LorenzDynamics is the name of the function (shares the same name as the file)
% t and state are the two arguments passed to the function
% 
function statedot = LorenzDynamics(t,state)
% here t is a scalar, while state is a vector (with three components: x, y, z)

global r sigma b

% we need to set the parameters of our dynamical system here
r = 28.;
sigma = 10.;
b = 8./3.;

% x, y, and z are components of our state vector (location in phase space)
x = state(1);
y = state(2);
z = state(3);

% state = (x, y, z)

% we compute the RHS of our ODE system here
xdot = sigma*(y-x); % dx/dt
ydot = r*x-y-x*z; % dy/dt
zdot = x*y-b*z; % dz/dt

% then we return the LHS of the ODE into the statedot vector (this is eventually passed to ODE45)
statedot = [xdot;ydot;zdot]; % statedot = (dxdt, dydt, dzdt)
end
