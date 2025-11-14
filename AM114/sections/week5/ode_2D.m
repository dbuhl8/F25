function state_dot = ode_2D(t,state)
    x = state(1);
    y = state(2);
    dxdt = -x*y;
    dydt = x*y - y;
    state_dot = [dxdt;dydt];
end
