function dydt = ode283(t,state)
    % dx/dt = -x;
    x = state(1);
    y = state(2);
    dx = x-y;
    dy = x^2-4;
    dydt = [dx; dy];
end
