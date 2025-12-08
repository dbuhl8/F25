function state_dot = ode_2D(t,state)
    x = state(1);
    y = state(2);
    dxdt = y + 2*x*y;
    dydt = x + x^2 - y^2;
    state_dot = [dxdt;dydt];
end
