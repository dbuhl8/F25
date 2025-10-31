function state_dot = ode_2D(t,state)
    x = state(1);
    y = state(2);
    dxdt = x-y;
    dydt = x^2 - 4;
    state_dot = [dxdt;dydt];
end
