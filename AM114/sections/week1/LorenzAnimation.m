clear all
close all

global r sigma b

sigma = 10; b = 8/3; r = 28;
  
% initial condition is a column vector
c_plus  = [sqrt(b*(r-1));sqrt(b*(r-1));r-1];
c_minus = [-sqrt(b*(r-1));-sqrt(b*(r-1));r-1];

x0 = c_plus+10*(-1+2*rand(3,1)); 

t0 = 0; tf = 50; 
tspan = [t0,tf];

OPTIONS = odeset('AbsTol',1e-10, 'RelTol', 1e-10);
[t,x] = ode45('LorenzDynamics', tspan, x0, OPTIONS); 

x1_max = max(x(:,1)); x1_min = min(x(:,1));
x2_max = max(x(:,2)); x2_min = min(x(:,2));
x3_max = max(x(:,3)); x3_min = min(x(:,3));

plot3(0,0,0,'ko'); grid on; hold on;
plot3(c_plus(1),c_plus(2),c_plus(3),'ko');
plot3(c_minus(1),c_minus(2),c_minus(3),'ko');
plot3(x0(1),x0(2),x0(3));

%% Plot out the solution as the trajectory of 
%% a moving pint in 2D using comet

hold on;
    ax = gca;
    set(ax,'xlim',[x1_min x1_max],'ylim',[x2_min x2_max], 'zlim',[x3_min x3_max]);
    set(ax, 'XGrid', 'on', 'YGrid', 'on', 'ZGrid', 'on');
    xlabel(ax, 'x1'); ylabel(ax, 'x2'); zlabel(ax, 'x3');
    title( ax,'Phase Portriate' );
    comet3( ax, x(:,1), x(:,2), x(:,3), 0);
hold off;


